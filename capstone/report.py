import mysql.connector
from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Paragraph
from reportlab.lib.styles import getSampleStyleSheet
from datetime import datetime, timedelta
from textblob import TextBlob  # Assuming you're using TextBlob for sentiment analysis

# MySQL database configuration
conn = mysql.connector.connect(
    host='your_mysql_host',
    user='your_mysql_user',
    password='your_mysql_password',
    database='your_database_name'
)
cursor = conn.cursor()

def fetch_monthly_data(username, month_year):
    try:
        month_year_obj = datetime.strptime(month_year, '%Y-%m')
    except ValueError:
        print('Invalid month/year format. Use YYYY-MM.')
        return

    # Calculate the start and end date of the specified month
    start_of_month = month_year_obj.replace(day=1)
    end_of_month = start_of_month + timedelta(days=31)

    # Query to fetch journal entries for the user within the specified month
    query = 'SELECT dateCreated, emotion FROM Journal WHERE username = %s AND dateCreated BETWEEN %s AND %s'
    params = [username, start_of_month, end_of_month]

    # Execute the query
    cursor.execute(query, params)
    entries = cursor.fetchall()

    return entries

def analyze_sentiment(entries):
    sentiment_scores = [TextBlob(entry[1]).sentiment.polarity for entry in entries]
    overall_sentiment = sum(sentiment_scores) / len(sentiment_scores)
    if overall_sentiment > 0.5:
        sentiment = 'positive'
        sentiment_statement = "Overall, the sentiment analysis reflects a positive outlook."
    elif overall_sentiment < -0.5:
        sentiment = 'negative'
        sentiment_statement = "Overall, the sentiment analysis reflects a negative outlook."
    else:
        sentiment = 'neutral'
        sentiment_statement = "Overall, the sentiment analysis reflects a neutral sentiment."

    return sentiment, sentiment_statement

def analyze_emotions(entries):
    emotions_per_week = {}
    for entry in entries:
        week_number = (entry[0].day - 1) // 7 + 1  # Determine the week number of the entry
        if week_number not in emotions_per_week:
            emotions_per_week[week_number] = {'positive': 0, 'neutral': 0, 'negative': 0}
        emotions_per_week[week_number][entry[1]] += 1

    weekly_emotions = []
    for week_number, emotions_count in emotions_per_week.items():
        most_frequent_emotion = max(emotions_count, key=emotions_count.get)
        least_frequent_emotion = min(emotions_count, key=emotions_count.get)
        weekly_emotions.append({
            'week': week_number,
            'most_frequent': most_frequent_emotion,
            'least_frequent': least_frequent_emotion
        })

    return weekly_emotions

def generate_report(username, month_year):
    entries = fetch_monthly_data(username, month_year)
    if not entries:
        print('No journal entries found for the specified month.')
        return

    sentiment, sentiment_statement = analyze_sentiment(entries)
    weekly_emotions = analyze_emotions(entries)

    doc = SimpleDocTemplate("sentiment_report.pdf", pagesize=letter)
    styles = getSampleStyleSheet()

    elements = []

    # Title
    title = f"Sentiment Analysis Report for {username}'s Journal Entries - {month_year}"
    elements.append(Paragraph(title, styles['Title']))

    # Sentiment Analysis Section
    sentiment_text = f"From our sentiment analysis of {username}'s past month of journal entries, the overall sentiment is {sentiment}. {sentiment_statement}"
    elements.append(Paragraph(sentiment_text, styles['Normal']))

    # Emotions Analysis Section
    emotions_text = "Emotion Analysis by Week:"
    elements.append(Paragraph(emotions_text, styles['Heading2']))

    # Add weekly emotions data to the report
    for week_data in weekly_emotions:
        week_text = f"For Week {week_data['week']} - Most frequent emotion: {week_data['most_frequent']}, Least frequent emotion: {week_data['least_frequent']}"
        elements.append(Paragraph(week_text, styles['Normal']))

    # Build the PDF document
    doc.build(elements)
    print('Sentiment analysis report saved as sentiment_report.pdf')

if __name__ == '__main__':
    username = 'user1'  # Replace with the actual username
    month_year = '2024-05'  # Example: May 2024

    generate_report(username, month_year)
