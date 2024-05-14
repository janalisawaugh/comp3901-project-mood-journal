import mysql.connector

# Define connection parameters for each shard
shard1_config = {
    'host': 'localhost',
    'user': 'user',
    'password': 'password',
    'database': 'shard1_db'
}

shard2_config = {
    'host': 'localhost',
    'user': 'user',
    'password': 'password',
    'database': 'shard2_db'
}

# Function to determine which shard to connect based on user_id
def get_shard_config(user_id):
    if user_id % 2 == 0:
        return shard1_config
    else:
        return shard2_config

# Function to insert user into the appropriate shard
def insert_user(user_id, username, email, password):
    shard_config = get_shard_config(user_id)
    conn = mysql.connector.connect(**shard_config)
    cursor = conn.cursor()
    insert_query = "INSERT INTO users (user_id, username, email, password) VALUES (%s, %s, %s, %s)"
    user_data = (user_id, username, email, password)
    cursor.execute(insert_query, user_data)
    conn.commit()
    conn.close()

# Example usage
insert_user(101, 'user101', 'user101@example.com', 'password101')
insert_user(102, 'user102', 'user102@example.com', 'password102')
