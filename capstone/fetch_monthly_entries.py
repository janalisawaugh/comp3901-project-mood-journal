import mysql.connector
from datetime import datetime, timedelta

# MySQL database configuration
conn = mysql.connector.connect(
    host='your_mysql_host',
    user='your_mysql_user',
    password='your_mysql_password',
    database='your_database_name'
)
cursor = conn.cursor()

def fetch_end_of_month_entries(username):
    today = datetime.now()
    end_of_month = today.replace(day=1, month=today.month+1) - timedelta(days=1)

    # Query to fetch journal entries for the user at the end of the current month
    query = 'SELECT Journal_entry FROM Journal WHERE username = %s AND dateCreated BETWEEN %s AND %s'
    params = [username, end_of_month.replace(day=1), end_of_month]

    # Execute the query
    cursor.execute(query, params)
    entries = cursor.fetchall()

    # Print or process the fetched entries as needed
    for entry in entries:
        print(entry)

if __name__ == '__main__':
    username = 'user1'  # Replace with the actual username

    fetch_end_of_month_entries(username)

