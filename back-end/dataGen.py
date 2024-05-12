# Importing required libraries
import os

# Function to generate SQL file
def generate_sql_file():
    # Define SQL commands to create and use database
    sql_commands = [
        """
        CREATE DATABASE IF NOT EXISTS mood_journal2;
        """,
        """
        USE mood_journal2;
        """,
        """
        CREATE TABLE IF NOT EXISTS Users (
            user_id INTEGER PRIMARY KEY AUTO_INCREMENT,
            first_name VARCHAR(255) NOT NULL,
            last_name VARCHAR(255) NOT NULL,
            email VARCHAR(255) UNIQUE NOT NULL,
            password VARCHAR(255) NOT NULL,
            totp_secret VARCHAR(255) NOT NULL
        );
        """,
        """
        CREATE TABLE IF NOT EXISTS JournalEntries (
            entry_id INTEGER PRIMARY KEY AUTO_INCREMENT,
            user_id INTEGER NOT NULL,
            entry_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            mood_description TEXT NOT NULL,
            FOREIGN KEY (user_id) REFERENCES Users(user_id)
        );
        """,
        """
        CREATE TABLE IF NOT EXISTS Recommendations (
            recommendation_id INTEGER PRIMARY KEY AUTO_INCREMENT,
            user_id INTEGER NOT NULL,
            recommendation_text TEXT NOT NULL,
            recommendation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (user_id) REFERENCES Users(user_id)
        );
        """
        # Space for more tables if we need it
    ]

    # Write SQL commands to a file
    with open('schema2.sql', 'w') as sql_file:
        for command in sql_commands:
            sql_file.write(command)
            sql_file.write('\n')

    print("SQL file generated successfully.")

generate_sql_file()
