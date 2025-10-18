import mysql.connector

try:
        

        alx_book_store = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Amchana@0!",
            database="alx_book_store",
            use_pure=True  
        )
        if alx_book_store.is_connected():

            mycursor = alx_book_store.cursor()
            mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")
except mysql.connector.Error as e:
      print(f"Error while connecting to MySQL: {e}")

finally:
      mycursor.close()
      alx_book_store.close()