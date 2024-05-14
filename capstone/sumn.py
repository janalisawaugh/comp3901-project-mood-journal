from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/upload-profile-picture', methods=['POST'])
def upload_profile_picture():
    # Check if the request contains a file
    if 'file' not in request.files:
        return jsonify({'error': 'No file provided'}), 400

    file = request.files['file']

    # Save the file to a folder on your server or cloud storage
    # Example using local storage:
    file.save('uploads/' + file.filename)

    # Update user profile with the image URL or file path
    # Example: save the file path to a database
    profile_picture_url = 'uploads/' + file.filename
    # code to update user's profile with profile_picture_url

    return jsonify({'message': 'Profile picture uploaded successfully', 'profile_picture_url': profile_picture_url}), 200

if __name__ == '__main__':
    app.run(debug=True)
