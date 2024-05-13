import matplotlib.pyplot as plt
from datetime import datetime
from collections import defaultdict
import sqlite3

def group_journal_entries(entries, group_by):
    def extract_grouping_info(entry):
        entry_date = datetime.strptime(entry["date"], "%Y-%m-%d")
        if group_by == "month":
            return entry_date.month, entry_date.year, entry_date.strftime("%B")
        else:
            raise ValueError("Invalid group_by value. Choose 'month'.")

    sorted_entries = sorted(entries, key=lambda x: datetime.strptime(x["date"], "%Y-%m-%d"))
    grouped_entries = defaultdict(list)
    for entry in sorted_entries:
        grouping_info = extract_grouping_info(entry)
        grouped_entries[grouping_info].append(entry)
    return grouped_entries

def plot_monthly_emotions_pie(journal_entries):
    grouped_by_month = group_journal_entries(journal_entries, "month")

    for month_key, month_entries in sorted(grouped_by_month.items()):  # Sort to ensure months are plotted in ascending order
        all_emotions = [emotion for entry in month_entries for emotion in entry["emotion"]]

        # Count the occurrences of each emotion
        emotion_counts = defaultdict(int)
        for emotion in all_emotions:
            emotion_counts[emotion] += 1

        # Plotting
        fig, ax = plt.subplots()
        ax.pie(emotion_counts.values(), labels=emotion_counts.keys(), autopct='%1.1f%%', startangle=90, colors=['#ff6666', '#ffcc99', '#99ff99', '#66b3ff'])
        ax.add_artist(plt.Circle((0,0),0.7,color='white'))  # Draw a white circle at the center
        ax.set_title(f'Emotions Distribution for {month_key[2]} {month_key[1]}')
        plt.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.
        plt.show()

# Function to fetch entries from SQLite database
def fetch_journal_entries_from_db(db_file):
    conn = sqlite3.connect(db_file)
    c = conn.cursor()
    c.execute("SELECT * FROM journal_entries")
    entries = []
    for row in c.fetchall():
        entries.append({
            "Entry ID": row[0],
            "date": row[1],  # Using "date" as the key
            "Journal Entry": row[2],
            "emotion": row[3].split(","),  # Emotions are stored as a comma-separated string in the database
        })
    conn.close()
    return entries

# Example usage with entries fetched from SQLite database
journal_entries_from_db = fetch_journal_entries_from_db("journal_entries.db")
plot_monthly_emotions_pie(journal_entries_from_db)