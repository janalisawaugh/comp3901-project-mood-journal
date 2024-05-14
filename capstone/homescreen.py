from flask import Flask, request, jsonify, session
from datetime import date, timedelta
import mysql.connector

app = Flask(__name__)
app.secret_key = 'your_secret_key'  # Set a secret key for session management

# Connect to MySQL database
conn = mysql.connector.connect(
    host='your_mysql_host',
    user='your_mysql_user',
    password='your_mysql_password',
    database='your_database_name'
)
cursor = conn.cursor(buffered=True)
conn.commit()

@app.route('/login', methods=['POST'])
def login():
    # Assuming username and password are passed in the request
    username = request.json.get('username')
    password = request.json.get('password')

    # Perform login authentication 
    # Check if username and password match in the database
    cursor.execute('SELECT username FROM User WHERE username = %s AND password = %s', (username, password))
    user = cursor.fetchone()

    if user:
        session['logged_in'] = True
        session['username'] = username
        return jsonify({'message': 'Login successful'}), 200
    else:
        return jsonify({'error': 'Invalid credentials'}), 401

@app.route('/update-streak', methods=['POST'])
def update_streak():
    if not session.get('logged_in'):
        return jsonify({'error': 'Unauthorized'}), 401

    user_id = session.get('username')

    # Check if the user has an existing streak
    cursor.execute('SELECT streak_start_date FROM User WHERE username = %s', (user_id,))
    streak_start_date = cursor.fetchone()

    today = date.today()

    if streak_start_date:
        streak_start_date = streak_start_date[0]
        if streak_start_date == today - timedelta(days=1):
            cursor.execute('UPDATE User SET streaks = streaks + 1 WHERE username = %s', (user_id,))
        else:
            cursor.execute('UPDATE User SET streaks = 1, streak_start_date = %s WHERE username = %s', (today, user_id))
    else:
        cursor.execute('UPDATE User SET streaks = 1, streak_start_date = %s WHERE username = %s', (today, user_id))

    conn.commit()
    return jsonify({'message': 'Streak updated successfully'}), 200

@app.route('/count-journal-entries', methods=['GET'])
def count_journal_entries():
    if not session.get('logged_in'):
        return jsonify({'error': 'Unauthorized'}), 401

    user_id = session.get('username')

    # Count the number of journal entries for the user
    cursor.execute('SELECT COUNT(*) FROM Journal WHERE username = %s', (user_id,))
    entry_count = cursor.fetchone()[0]

    return jsonify({'entry_count': entry_count}), 200

if __name__ == '__main__':
    app.run(debug=True)
