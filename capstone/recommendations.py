import mysql.connector
from textblob import TextBlob  # Assuming you're using TextBlob for sentiment analysis

# MySQL database configuration
conn = mysql.connector.connect(
    host='your_mysql_host',
    user='your_mysql_user',
    password='your_mysql_password',
    database='your_database_name'
)
cursor = conn.cursor()

def perform_sentiment_analysis(text):
    # Perform sentiment analysis using TextBlob
    blob = TextBlob(text)
    sentiment_score = blob.sentiment.polarity

    if sentiment_score > 0.5:
        return 'Feeling positive! You might enjoy going for a walk in the park or reading a good book.'
    elif sentiment_score < -0.5:
        return 'Seems like you are having a tough time. Consider talking to a friend or practicing mindfulness.'
    else:
        return 'Your mood seems neutral. How about trying a new hobby or listening to relaxing music?'

def save_recommendation(user_id, recommendation):
    # Save the recommendation to the Recommendations table
    query = 'INSERT INTO Recommendations (user_id, recommendations) VALUES (%s, %s)'
    params = (user_id, recommendation)
    cursor.execute(query, params)
    conn.commit()

def generate_and_save_recommendation(user_id, mood_description):
    # Perform sentiment analysis on the journal entry
    recommendation = perform_sentiment_analysis(mood_description)

    # Save the recommendation to the database
    save_recommendation(user_id, recommendation)

if __name__ == '__main__':
    username = 'user1'  # Replace with the actual username
    mood_description = "Today was a great day! I enjoyed spending time outdoors and meeting friends."

    generate_and_save_recommendation(username, mood_description)
