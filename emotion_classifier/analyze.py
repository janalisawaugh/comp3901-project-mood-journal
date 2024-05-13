import sqlite3
import pandas as pd
import matplotlib.pyplot as plt
from transformers import pipeline
import seaborn as sns

# Function to classify emotions
def classify_emotions(entries):
    classifier = pipeline(task="text-classification", model="SamLowe/roberta-base-go_emotions", top_k=1)
    emotions = classifier(entries)
    return emotions

# Connect to the SQLite database
conn = sqlite3.connect('journal_entries.db')
c = conn.cursor()

# Check if 'emotion' column exists, if not, add it
c.execute('''PRAGMA table_info(journal_entries)''')
columns = c.fetchall()
column_names = [col[1] for col in columns]

if 'emotion' not in column_names:
    c.execute('''ALTER TABLE journal_entries ADD COLUMN emotion TEXT''')
    print("Added 'emotion' column.")

# Retrieve journal entries from the database
c.execute('SELECT entry_id, date, journal_entry FROM journal_entries')
entries_data = c.fetchall()

# Get journal entries and classify emotions
entries = [entry[2] for entry in entries_data]
emotions = classify_emotions(entries)

# Update the database with predicted emotions
for entry_id, emotion in zip([entry[0] for entry in entries_data], emotions):
    label = emotion[0]['label']
    c.execute('UPDATE journal_entries SET emotion = ? WHERE entry_id = ?', (label, entry_id))

# Commit changes
conn.commit()

# Retrieve journal entries with emotions from the database
df = pd.read_sql_query('SELECT date, emotion FROM journal_entries', conn)

# Close connection to the database
conn.close()

