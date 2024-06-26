
        CREATE DATABASE IF NOT EXISTS mood_journal;
        

        USE mood_journal;
        

        CREATE TABLE IF NOT EXISTS Users (
            user_id INTEGER PRIMARY KEY AUTO_INCREMENT,
            name VARCHAR(255) NOT NULL,
            email VARCHAR(255) UNIQUE NOT NULL,
            password VARCHAR(255) NOT NULL,
            totp_secret VARCHAR(255) NOT NULL
        );
        

        CREATE TABLE IF NOT EXISTS JournalEntries (
            entry_id INTEGER PRIMARY KEY AUTO_INCREMENT,
            user_id INTEGER NOT NULL,
            entry_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            mood_description TEXT NOT NULL,
            emotion TEXT,
            FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ) ENGINE=InnoDB ROW_FORMAT=COMPRESSED;
        

        CREATE TABLE IF NOT EXISTS Recommendations (
            recommendation_id INTEGER PRIMARY KEY AUTO_INCREMENT,
            user_id INTEGER NOT NULL,
            recommendation_text TEXT NOT NULL,
            recommendation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (user_id) REFERENCES Users(user_id)
        );
        
        CREATE TABLE Analytics (
            analytics_id INT AUTO_INCREMENT PRIMARY KEY,
            user_id INT NOT NULL,
             
            FOREIGN KEY (user_id) REFERENCES Users(user_id)
        );

        CREATE TABLE IF NOT EXISTS Feedback (
            ID INT AUTO_INCREMENT PRIMARY KEY,
            user_id INT NOT NULL,
            recommendation_id INT NOT NULL,
            chart_id VARCHAR(255),
            report_id VARCHAR(255),
            FOREIGN KEY (user_id) REFERENCES Users(user_id)
            FOREIGN KEY (recommendation_id) REFERENCES Recommendations(recommendation_id)
        );
                
