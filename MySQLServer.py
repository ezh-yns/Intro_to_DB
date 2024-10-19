import mysql.connector
from mysql.connector import Error

def create_database():
    connection = None
    try:
        # Connect to the MySQL server (no database specified initially)
        connection = mysql.connector.connect(
            host="localhost",
            user="your_username",  # Replace with your MySQL username
            password="your_password"  # Replace with your MySQL password
        )

        if connection.is_connected():
            print("Connected to MySQL server successfully.")

            # Create a cursor to execute queries
            cursor = connection.cursor()

            # Create the database if it does not exist
            try:
                cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
                print("Database 'alx_book_store' created successfully!")
            except Error as e:
                print(f"Error creating database: {e}")

            # Close the cursor
            cursor.close()

    except Error as e:
        print(f"Error connecting to the database server: {e}")

    finally:
        # Ensure the connection is closed properly
        if connection is not None and connection.is_connected():
            connection.close()
            print("MySQL connection closed.")

# Run the script
if __name__ == "__main__":
    create_database()
