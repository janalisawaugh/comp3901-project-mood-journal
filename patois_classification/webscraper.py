import requests
from bs4 import BeautifulSoup
from requests_html import HTMLSession
import pandas as pd

# Define the list of letters to iterate through
letters = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
    'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
]

# Iterate through each letter
for letter in letters:
    # Initialize a list to hold word and example pairs for each letter
    data = []
    pg_num = 0
    
    # Loop through each page
    while True:
        url = f'https://jamaicanpatwah.com/dictionary/browse/{letter}/{pg_num}'
        session = HTMLSession()
        response = session.get(url)
        print(f'Parsing: {response.html.url}')

        # Parse the HTML content using BeautifulSoup
        soup = BeautifulSoup(response.html.html, 'html.parser')

        words = soup.select('div.words li')

        # Process each word in the list
        for li in words:
            # Get the word
            word = li.get_text(strip=True)

            # Find the URL for the word
            word_url = li.find('a')['href']
            
            # Visit the word's page to get the Patois example
            word_response = session.get(word_url)
            word_soup = BeautifulSoup(word_response.html.html, 'html.parser')
            
            # Find the example sentences under the <dd> tag with class 'text'
            example_section = word_soup.select('dd.text p')

            # Check if any example section is found
            if example_section:
                # Iterate through each element in the example_section
                for element in example_section:
                    # Use a CSS selector to find the <i> tag with the text "Patois:" within the paragraph
                    patois_tags = element.select('i:-soup-contains("Patois:")')

                    # Check if any Patois tag was found
                    if patois_tags:
                        # Iterate through each Patois tag found in the paragraph
                        for patois_tag in patois_tags:
                            # Find the text following the Patois tag
                            patois_text = []
                            next_node = patois_tag.next_sibling

                            # Iterate through the siblings of the Patois tag
                            while next_node:
                                # Check if the current sibling node is not an <i> tag with "English:"
                                if isinstance(next_node, str):
                                    # Append the text to the list
                                    patois_text.append(next_node)
                                elif next_node.name == 'i' and 'English:' in next_node.get_text():
                                    # If English tag is encountered, stop extracting Patois text
                                    break
                                # Move to the next sibling
                                next_node = next_node.next_sibling

                            # Join the list of Patois text into a single string
                            patois_text = ''.join(patois_text).strip()

                            # Append the word and Patois text to the data list
                            data.append((word, patois_text))

        # Find the pagination container
        pagination_div = soup.find('div', class_='global-pagination')
        
        if pagination_div:
            # Find the current page element (the <strong> element)
            current_page_element = pagination_div.find('strong')
            
            if current_page_element:
                # Find the next element after the current page element
                next_element = current_page_element.find_next_sibling()
                
                # Check if the next element is an <a> element (indicating a next page)
                if not next_element or next_element.name != 'a':
                    # No next page, exit the loop
                    break
        else:
            # If no pagination div is found, there is no pagination, so exit the loop
            break
        
        # Increment the page number for the next iteration
        pg_num += 70

    # Convert the data list into a DataFrame
    df = pd.DataFrame(data, columns=['Word', 'Patois Example'])

    # Save the DataFrame to a CSV file for the current letter
    filename = f"{letter}.csv"
    df.to_csv(filename, index=False)
