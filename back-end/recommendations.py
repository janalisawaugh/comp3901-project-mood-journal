import mysql.connector
from textblob import TextBlob  # Assuming you're using TextBlob for sentiment analysis
from datetime import date

# MySQL database configuration
# Connect to MySQL database
conn = mysql.connector.connect(
    host='your_mysql_host',
    user='your_mysql_user',
    password='your_mysql_password',
    database='your_database_name'
)
cursor = conn.cursor()

# Get today's date
today_date = date.today()

# Query to retrieve the emotion of the day from JournalEntries table
fetch_emotion_query = """
SELECT emotion
FROM JournalEntries
WHERE entry_date = %s
ORDER BY entry_id DESC
LIMIT 1
"""

cursor.execute(fetch_emotion_query, (today_date,))
result = cursor.fetchone()

if result:
    emotion_of_the_day = result[0]
else:
    print("No journal entry found for today.")

def save_recommendation(user_id):
    # Save the recommendation to the Recommendations table
    recommendation= generate_recommendation(emotion_of_the_day)
    message = f"Based on your data entries today, it seems you were mostly {emotion_of_the_day.lower()}. Here are some recommendations:\n- {recommendation}"
    query = 'INSERT INTO Recommendations (user_id, recommendations) VALUES (%s, %s)'
    params = (user_id, message)
    cursor.execute(query, params)
    conn.commit()

import random

def generate_recommendation(emotion):
    recommendations = {
        'admiration': "Read an inspiring book or watch a motivational video.",
        'amusement': "Take a break and enjoy a funny movie or comedy show.",
        'anger': "Practice deep breathing exercises or engage in a physical activity to release tension.",
        'annoyance': "Write down your feelings in a journal or talk to a trusted friend about what's bothering you.",
        'approval': "Reflect on your achievements and celebrate your successes.",
        'caring': "Do something kind for someone else or volunteer for a charitable cause.",
        'confusion': "Take time to organize your thoughts and seek clarity by asking questions or researching.",
        'curiosity': "Explore a new hobby or learn something new that interests you.",
        'desire': "Set goals and create a plan to pursue your dreams and aspirations.",
        'disappointment': "Acknowledge your feelings and focus on what you can learn from the experience.",
        'disapproval': "Express your concerns constructively and seek solutions to address the issues.",
        'disgust': "Identify triggers and create a plan to avoid situations that evoke disgust.",
        'embarrassment': "Practice self-compassion and remind yourself that everyone makes mistakes.",
        'excitement': "Channel your excitement into a creative project or try something adventurous.",
        'fear': "Face your fears gradually and practice relaxation techniques to manage anxiety.",
        'gratitude': "Start a gratitude journal and focus on the positive aspects of your life.",
        'grief': "Allow yourself to grieve and seek support from loved ones during difficult times.",
        'joy': "Engage in activities that bring you joy and spend time with people who uplift your spirits.",
        'love': "Express your love and appreciation to those close to you through words or actions.",
        'nervousness': "Practice mindfulness and breathing exercises to calm your nerves.",
        'optimism': "Focus on the bright side of situations and visualize positive outcomes.",
        'pride': "Celebrate your accomplishments and acknowledge your progress.",
        'realization': "Reflect on your insights and use them to make positive changes in your life.",
        'relief': "Practice self-care activities and find ways to reduce stress in your daily routine.",
        'remorse': "Acknowledge mistakes and take responsibility by making amends or learning from them.",
        'sadness': "Allow yourself to feel sadness and seek comfort through self-care and support.",
        'surprise': "Embrace unexpected moments and see them as opportunities for growth.",
        'neutral': "Take time for self-reflection and explore your thoughts and feelings."
    }

    recommendation = recommendations.get(emotion.lower(), "Explore your emotions further and consider seeking guidance from a professional.")
    return recommendation


if __name__ == '__main__':
    user_id = 'user1'  # Replace with the actual username
    
    save_recommendation(user_id)
