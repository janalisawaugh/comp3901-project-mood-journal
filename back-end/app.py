from flask import Flask, jsonify, make_response, request, render_template
import mysql.connector
import bcrypt

app = Flask(__name__)

# Database connection configuration
db_config = {
    'user': 'root',
    'password': 'password',
    'host': 'localhost',
    'database': 'mood_journal'
}

@app.route('/')
def index():
    return render_template('login.html')

# Route for user registration
@app.route('/register', methods=['POST'])
def register_user():
    try:
        # Connect to the database
        cnx = mysql.connector.connect(**db_config)
        cursor = cnx.cursor()

        # Parse request data
        user_data = request.json
        first_name = user_data.get('first_name')
        last_name = user_data.get('last_name')
        email = user_data.get('email')
        password = user_data.get('password')

        # Validate request data
        if not first_name or not last_name or not email or not password:
            return make_response(jsonify({'error': 'Missing required fields.'}), 400)

        # Check if user already exists
        cursor.execute("SELECT * FROM Users WHERE email = %s", (email,))
        existing_user = cursor.fetchone()
        if existing_user:
            return make_response(jsonify({'error': 'User already exists.'}), 400)

        # Hash the password
        hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())

        # Insert user into the database
        cursor.execute("INSERT INTO Users (first_name, last_name, email, password) VALUES (%s, %s, %s, %s)",
                       (first_name, last_name, email, hashed_password))
        cnx.commit()

        return make_response(jsonify({'message': 'User registered successfully.'}), 200)

    except Exception as e:
        return make_response(jsonify({'error': str(e)}), 400)

    finally:
        # Close database connection
        if 'cursor' in locals():
            cursor.close()
        if 'cnx' in locals():
            cnx.close()

# Route for user login
@app.route('/login', methods=['POST'])
def login_user():
    try:
        # Connect to the database
        cnx = mysql.connector.connect(**db_config)
        cursor = cnx.cursor(dictionary=True)

        # Parse request data
        login_data = request.json
        email = login_data.get('email')
        password = login_data.get('password')

        # Validate request data
        if not email or not password:
            return make_response(jsonify({'error': 'Missing required fields.'}), 400)

        # Check if user exists in the database
        cursor.execute("SELECT * FROM Users WHERE email = %s", (email,))
        user = cursor.fetchone()
        if not user:
            return make_response(jsonify({'error': 'User not found.'}), 404)

        # Verify password
        if bcrypt.checkpw(password.encode('utf-8'), user['password'].encode('utf-8')):
            # Passwords match, login successful
            del user['password']  # Remove password hash from response
            return jsonify({'message': 'Login successful.', 'user': user}), 200
        else:
            # Passwords don't match
            return make_response(jsonify({'error': 'Incorrect password.'}), 401)

    except Exception as e:
        return make_response(jsonify({'error': str(e)}), 400)

    finally:
        # Close database connection
        if 'cursor' in locals():
            cursor.close()
        if 'cnx' in locals():
            cnx.close()

@app.route('/journal', methods=['POST'])
def add_journal_entry():
    try:
        # Connect to the database
        cnx = mysql.connector.connect(**db_config)
        cursor = cnx.cursor()

        # Parse request data
        entry_data = request.json
        user_id = entry_data.get('user_id')
        mood_description = entry_data.get('mood_description')

        # Validate request data
        if not user_id or not mood_description:
            return make_response(jsonify({'error': 'Missing required fields.'}), 400)

        # Insert journal entry into the database
        cursor.execute("INSERT INTO JournalEntries (user_id, mood_description) VALUES (%s, %s)",
                       (user_id, mood_description))
        cnx.commit()

        return make_response(jsonify({'message': 'Journal entry added successfully.'}), 200)

    except Exception as e:
        return make_response(jsonify({'error': str(e)}), 400)

    finally:
        # Close database connection
        if 'cursor' in locals():
            cursor.close()
        if 'cnx' in locals():
            cnx.close()

@app.route('/recommendations', methods=['GET'])
def get_recommendations():
    try:
        # Connect to the database
        cnx = mysql.connector.connect(**db_config)
        cursor = cnx.cursor(dictionary=True)

        # Parse request data
        user_id = request.args.get('user_id')

        # Validate request data
        if not user_id:
            return make_response(jsonify({'error': 'Missing required fields.'}), 400)

        # Retrieve recommendations from the database based on user mood
        cursor.execute("SELECT recommendation FROM Recommendations WHERE user_id = %s", (user_id,))
        recommendations = cursor.fetchall()

        return make_response(jsonify({'recommendations': recommendations}), 200)

    except Exception as e:
        return make_response(jsonify({'error': str(e)}), 400)

    finally:
        # Close database connection
        if 'cursor' in locals():
            cursor.close()
        if 'cnx' in locals():
            cnx.close()

if __name__ == '__main__':
    app.run(debug=True)
