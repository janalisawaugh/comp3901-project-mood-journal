from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_community.vectorstores import FAISS
from langchain_community.document_loaders import PyPDFLoader, DirectoryLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter 

# Define the path to the data directory and the path where the FAISS database will be saved
DATA_PATH = 'data/'
DB_FAISS_PATH = 'vectorstore/db_faiss'

# Function to create the vector database
def create_vector_db():
    # Load all PDF documents from the specified directory
    loader = DirectoryLoader(DATA_PATH, glob='*.pdf', loader_cls=PyPDFLoader)
    documents = loader.load()  # Load the documents

    # Initialize a text splitter to break documents into smaller chunks
    text_splitter = RecursiveCharacterTextSplitter(chunk_size=500, chunk_overlap=50)
    texts = text_splitter.split_documents(documents)  # Split the documents into chunks

    # Initialize the embeddings model
    embeddings = HuggingFaceEmbeddings(model_name='sentence-transformers/all-MiniLM-L6-v2', model_kwargs={'device': 'cpu'})

    # Create the FAISS vector store from the document chunks and embeddings
    db = FAISS.from_documents(texts, embeddings)
    
    # Save the FAISS database locally
    db.save_local(DB_FAISS_PATH)

if __name__ == "__main__":
    create_vector_db()
