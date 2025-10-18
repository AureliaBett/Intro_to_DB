import mysql.connector

# connection credentials
DB_HOST = "localhost"
DB_USER = "root"
DB_PASS = "Amchana@0!"     # replace with your password
DB_NAME = "mydb"

# Connect to server (no database) and create the DB if it doesn't exist
conn = mysql.connector.connect(
    host=DB_HOST,
    user=DB_USER,
    password=DB_PASS,
    use_pure=True          # avoids the C extension issues you've had
)
cur = conn.cursor()

cur.execute(f"CREATE DATABASE IF NOT EXISTS `{DB_NAME}` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;")
cur.execute(f"USE `{DB_NAME}`;")

# Now proceed with the rest of your original script using cur / conn
cur.execute("""
CREATE TABLE IF NOT EXISTS customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE
)
""")
conn.commit()
print("Table created successfully!")

sql = "INSERT INTO customers (name, email) VALUES (%s, %s)"
val = ("John Doe", "john.doe@example.com")
cur.execute(sql, val)
conn.commit()
print(cur.rowcount, "record(s) inserted.")

val = ("Jane Smith", "jane.smith@example.com")
cur.execute(sql, val)
conn.commit()
print(cur.rowcount, "record(s) inserted.")

cur.execute("SELECT * FROM customers")
for row in cur.fetchall():
    print(row)

sql = "UPDATE customers SET email = %s WHERE id = %s"
val = ("updated.email@example.com", 1)
cur.execute(sql, val)
conn.commit()
print(cur.rowcount, "record(s) updated.")

cur.execute("SELECT * FROM customers WHERE id = 1")
print("Updated customer:")
print(cur.fetchone())

sql = "DELETE FROM customers WHERE id = 2"
cur.execute(sql)
conn.commit()
print(cur.rowcount, "record(s) deleted.")

cur.close()
conn.close()
print("Database connection closed.")
