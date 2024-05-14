import mysql.connector
from matplotlib import pyplot as plt
from reportlab.lib import colors
from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle
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

def generate_chart(sentiment_scores):
    # Generate a bar chart of sentiment scores
    plt.figure(figsize=(8, 5))
    plt.bar(range(1, len(sentiment_scores) + 1), sentiment_scores, color='skyblue')
    plt.xlabel('Entry Number')
    plt.ylabel('Sentiment Score')
    plt.title('Monthly Sentiment Analysis')
    plt.savefig('sentiment_chart.png')  # Save the chart as PNG

def generate_report(username, month_year):
    # Generate a PDF report with the chart and summary
    doc = SimpleDocTemplate("sentiment_report.pdf", pagesize=letter)
    elements = []

    # Add the sentiment chart to the PDF
    sentiment_chart = plt.imread('sentiment_chart.png')
    elements.append(Table([[sentiment_chart]]))

    # Add a summary table to the PDF
    summary_data = [['Username', 'Month', 'Average Sentiment Score'],
                    [username, month_year, sum(sentiment_scores) / len(sentiment_scores)]]
    summary_table = Table(summary_data, colWidths=150, rowHeights=30)
    summary_table.setStyle(TableStyle([('BACKGROUND', (0, 0), (-1, 0), colors.lightblue),
                                       ('TEXTCOLOR', (0, 0), (-1, 0), colors.black),
                                       ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
                                       ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
                                       ('INNERGRID', (0, 0), (-1, -1), 0.25, colors.black),
                                       ('BOX', (0, 0), (-1, -1), 0.25, colors.black)]))
    elements.append(summary_table)

    # Build the PDF document
    doc.build(elements)

def save_to_database(username, month_year):
    # Read the generated chart and report PDF files as binary data
    with open('sentiment_chart.png', 'rb') as chart_file, open('sentiment_report.pdf', 'rb') as report_file:
        chart_data = chart_file.read()
        report_data = report_file.read()

    # Insert the chart and report into the Analytics table
    query = 'INSERT INTO Analytics (monthdate, username, charts, reports) VALUES (%s, %s, %s, %s)'
    params = [month_year, username, chart_data, report_data]
    cursor.execute(query, params)
    conn.commit()

if __name__ == '__main__':
    username = 'user1'  # Replace with the actual username
    month_year = '2024-05'  # Example: May 2024

    sentiment_scores = fetch_monthly_entries(username, month_year)
    if sentiment_scores:
        generate_chart(sentiment_scores)
        generate_report(username, month_year)
        save_to_database(username, month_year)
        print('Chart and report saved to database.')
    else:
        print('No journal entries found for the specified month.')
