from langchain_community.document_loaders import PyPDFLoader, DirectoryLoader
from langchain.prompts import PromptTemplate
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_community.vectorstores import FAISS
from langchain_community.llms import CTransformers
from langchain.chains import RetrievalQA
import chainlit as cl
import asyncio

# Path to the FAISS vector store
DB_FAISS_PATH = 'vectorstore/db_faiss'

# Custom prompt template for the QA retrieval process
custom_prompt_template = """Use the following pieces of information to answer the user's question.
If you don't know the answer, just say that you don't know, don't try to make up an answer.

Context: {context}
Question: {question}

Only return the helpful answer below and nothing else.
Helpful answer:
"""

def set_custom_prompt():
    """
    Create and return a custom prompt template for QA retrieval.
    """
    prompt = PromptTemplate(template=custom_prompt_template,
                            input_variables=['context', 'question'])
    return prompt

# Retrieval QA Chain function
def retrieval_qa_chain(llm, prompt, db):
    """
    Create and return a RetrievalQA chain using the provided LLM, prompt, and vector store.
    """
    qa_chain = RetrievalQA.from_chain_type(llm=llm,
                                           chain_type='stuff',
                                           retriever=db.as_retriever(search_kwargs={'k': 2}),
                                           return_source_documents=True,
                                           chain_type_kwargs={'prompt': prompt})
    return qa_chain

# Load the language model
def load_llm():
    """
    Load and return the locally downloaded LLM model.
    """
    llm = CTransformers(
        model="TheBloke/Llama-2-7B-Chat-GGML",
        model_type="llama",
        max_new_tokens=512,
        temperature=0.5
    )
    return llm

# QA Bot function
def qa_bot():
    """
    Initialize the QA bot by setting up embeddings, loading the FAISS vector store,
    loading the LLM, and creating the RetrievalQA chain.
    """
    embeddings = HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2",
                                       model_kwargs={'device': 'cpu'})
    db = FAISS.load_local(DB_FAISS_PATH, embeddings, allow_dangerous_deserialization=True)
    llm = load_llm()
    qa_prompt = set_custom_prompt()
    qa = retrieval_qa_chain(llm, qa_prompt, db)
    return qa

# Function to get the final result for a query
def final_result(query):
    """
    Process the user's query using the QA bot and return the response.
    """
    qa_result = qa_bot()
    response = qa_result({'query': query})
    return response

# Chainlit code to handle chat start
@cl.on_chat_start
async def start():
    """
    Initialize the chat session with a welcome message and set up the QA chain in the user session.
    """
    chain = qa_bot()
    msg = cl.Message(content="Starting the bot...")
    await msg.send()
    msg.content = "Hi, Welcome to Mental Health Chat Bot. What is your query?"
    await msg.update()
    cl.user_session.set("chain", chain)

# Chainlit code to handle incoming messages
@cl.on_message
async def main(message: cl.Message):
    """
    Process incoming messages using the QA chain from the user session and send the response.
    """
    chain = cl.user_session.get("chain")
    cb = cl.AsyncLangchainCallbackHandler(
        stream_final_answer=True, answer_prefix_tokens=["FINAL", "ANSWER"]
    )
    cb.answer_reached = True
    res = await chain.acall(message.content, callbacks=[cb])
    answer = res["result"]
    print("Final answer:", answer)  # Debugging
