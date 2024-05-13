import matplotlib.pyplot as plt
from datetime import datetime
from collections import defaultdict
import sqlite3

def group_journal_entries(entries, group_by):
    def extract_grouping_info(entry):
        entry_date = datetime.strptime(entry["date"], "%Y-%m-%d")
        if group_by == "week":
            return entry_date.isocalendar()[1], entry_date.year, entry_date.strftime("%B")
        elif group_by == "month":
            return entry_date.month, entry_date.year, entry_date.strftime("%B")
        elif group_by == "6months":
            return (entry_date.month - 1) // 6 + 1, entry_date.year, entry_date.strftime("%B")
        elif group_by == "year":
            return entry_date.year
        else:
            raise ValueError("Invalid group_by value. Choose 'week', 'month', '6months', or 'year'.")

    sorted_entries = sorted(entries, key=lambda x: datetime.strptime(x["date"], "%Y-%m-%d"))
    grouped_entries = defaultdict(list)
    for entry in sorted_entries:
        grouping_info = extract_grouping_info(entry)
        day_of_week = datetime.strptime(entry["date"], "%Y-%m-%d").strftime("%a")
        grouped_entries[grouping_info].append((day_of_week, entry["emotion"]))
    return grouped_entries

def plot_weekly_emotions(journal_entries):
    grouped_by_week = group_journal_entries(journal_entries, "week")

    for week_key, week_entries in sorted(grouped_by_week.items()):  # Sort to ensure weeks are plotted in ascending order
        emotions_count = {emotion: [0] * 7 for emotion in set(emotion for _, emotions in week_entries for emotion in emotions)}  # Initialize emotions count for the week

        for day, emotions in week_entries:
            for emotion in emotions:
                emotions_count[emotion][["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"].index(day)] += 1
        
        # Plotting
        days_of_week = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
        fig, ax = plt.subplots()
        for emotion, counts in emotions_count.items():
            ax.bar(days_of_week, counts, label=emotion)

        ax.set_xlabel('Day of the Week')
        ax.set_ylabel('Emotion Count')
        ax.set_title(f'Emotions for Week {week_key[0]}, {week_key[2]} {week_key[1]}')
        ax.legend()
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
            "emotion": row[3].split(",")  # Emotions are stored as a comma-separated string in the database
        })
    conn.close()
    return entries

# Example usage with entries fetched from SQLite database
journal_entries_from_db = fetch_journal_entries_from_db("journal_entries.db")
plot_weekly_emotions(journal_entries_from_db)