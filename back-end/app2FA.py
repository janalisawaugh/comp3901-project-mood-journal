from flask import Flask, jsonify, make_response, request, render_template
from flask_mail import Mail, Message
from random import randint
import mysql.connector
import bcrypt

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('login.html')

# Database connection configuration
db_config = {
    'user': 'root',
    'password': 'password',
    'host': 'localhost',
    'database': 'mood_journal'
}

# SMTP configuration for sending emails
app.config["MAIL_SERVER"] = 'smtp.gmail.com'
app.config["MAIL_PORT"] = 465
app.config["MAIL_USERNAME"] = '' #removed username for safety reasons
app.config['MAIL_PASSWORD'] = '' #removed username for safety reasons
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True

mail = Mail(app)

# Function to generate passkeys
def generate_passkeys():
    return [randint(100000, 999999) for _ in range(6)]  # Generate 6 Passkeys

# Function to send email with passkeys
def send_otp(email, passkeys):
    otp_list = "\n".join(map(str, passkeys))
    msg = Message('Your Passkeys', sender='', recipients=[email])
    msg.body = f'Your passkeys are:\n\n{otp_list}\n\nDo not share these keys with ANYONE. They are used to log you into the app.'
    mail.send(msg)


# Route for user registration
@app.route('/register', methods=['POST'])
def register_user():
    try:
        # Connect to the database
        cnx = mysql.connector.connect(**db_config)
        cursor = cnx.cursor()

        # Parse request data
        user_data = request.json
        name = user_data.get('name')
        email = user_data.get('email')
        password = user_data.get('password')

        # Generate passkeys
        passkeys = generate_passkeys()

        # Send passkeys to the user's email
        send_otp(email, passkeys)

        # Hash the password
        hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())

        # Insert user into the database
        cursor.execute("INSERT INTO Users (name , email, password, totp_secret) VALUES (%s, %s, %s, %s)",
                       (name, email, hashed_password, ', '.join(map(str, passkeys))))
        cnx.commit()

        return make_response(jsonify({'message': 'User registered successfully. Check your email for the passkeys.'}), 200)

    except Exception as e:
        return make_response(jsonify({'error': str(e)}), 400)

    finally:
        # Close database connection
        if 'cursor' in locals():
            cursor.close()
        if 'cnx' in locals():
            cnx.close()

# Route for verifying OTP
@app.route('/verify', methods=['POST'])
def verify_otp():
    try:
        # Connect to the database
        cnx = mysql.connector.connect(**db_config)
        cursor = cnx.cursor()

        # Parse request data
        user_data = request.json
        email = user_data.get('email')
        user_otp = user_data.get('otp')

        # Retrieve passkeys from the database
        cursor.execute("SELECT totp_secret FROM Users WHERE email = %s", (email,))
        db_passkeys = cursor.fetchone()[0].split(', ')

        if user_otp in db_passkeys:
            return make_response(jsonify({'message': 'OTP verified successfully.'}), 200)
        else:
            return make_response(jsonify({'error': 'Incorrect OTP.'}), 400)

    except Exception as e:
        return make_response(jsonify({'error': str(e)}), 400)

    finally:
        # Close database connection
        if 'cursor' in locals():
            cursor.close()
        if 'cnx' in locals():
            cnx.close()

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
        otp = login_data.get('otp')

        # Validate request data
        if not email or not password or not otp:
            return make_response(jsonify({'error': 'Missing required fields.'}), 400)

        # Check if user exists in the database
        cursor.execute("SELECT * FROM Users WHERE email = %s", (email,))
        user = cursor.fetchone()
        if not user:
            return make_response(jsonify({'error': 'User not found.'}), 404)

        # Verify password
        if bcrypt.checkpw(password.encode('utf-8'), user['password'].encode('utf-8')):
            # Passwords match, now verify OTP
            db_passkeys = user['totp_secret'].split(', ')
            if verify_otp(otp, db_passkeys):
                del user['password']  # Remove password hash from response
                return jsonify({'message': 'Login successful.', 'user': user}), 200
            else:
                return make_response(jsonify({'error': 'Incorrect OTP.'}), 401)
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

def verify_otp(otp, passkeys):
    # Check if the provided OTP matches any of the passkeys
    return otp in passkeys

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
