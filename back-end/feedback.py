import mysql.connector
from flask import Flask, request, jsonify

app = Flask(__name__)

# MySQL database configuration
conn = mysql.connector.connect(
    host='your_mysql_host',
    user='your_mysql_user',
    password='your_mysql_password',
    database='your_database_name'
)
cursor = conn.cursor()

# Create the Feedback table if it doesn't exist
create_table_query = """
CREATE TABLE IF NOT EXISTS Feedback (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT NOT NULL,
    recommendations INT NOT NULL,
    charts INT NOT NULL,
    report INT NOT NULL
)
"""
cursor.execute(create_table_query)

@app.route('/submit_feedback', methods=['POST'])
def submit_feedback():
    # Get feedback data from the request
    feedback = request.json

    # Validate and extract feedback ratings
    try:
        user_id = int(feedback['userID'])
        recommendations_rating = int(feedback['recommendations'])
        charts_rating = int(feedback['charts'])
        reports_rating = int(feedback['reports'])
    except ValueError:
        return jsonify({'error': 'Invalid feedback data.'}), 400

    # Validate ratings are within the scale of 1 to 5
    if not 1 <= recommendations_rating <= 5 or not 1 <= charts_rating <= 5 or not 1 <= reports_rating <= 5:
        return jsonify({'error': 'Feedback ratings must be between 1 and 5.'}), 400

    # Insert feedback data into the database
    insert_query = 'INSERT INTO Feedback (userID, recommendations, charts, report) VALUES (%s, %s, %s, %s)'
    insert_data = (user_id, recommendations_rating, charts_rating, reports_rating)

    try:
        cursor.execute(insert_query, insert_data)
        conn.commit()
        return jsonify({'message': 'Feedback submitted successfully.'}), 200
    except mysql.connector.Error as err:
        return jsonify({'error': f'Failed to insert feedback: {err}'}), 500

if __name__ == '__main__':
    app.run(debug=True)
