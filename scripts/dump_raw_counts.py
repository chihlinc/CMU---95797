import duckdb

# Replace 'your_database.db' with the path to your DuckDB database file
db_file = 'main.db'

# Create a connection to the DuckDB database
connection = duckdb.connect(database=db_file)

# List available tables in the database
table_list = connection.execute("SHOW TABLES").fetchall()
for table in table_list:
    table_name = table[0]
    query = f"SELECT COUNT(*) FROM {table_name}"
    row_count = connection.execute(query).fetchone()[0]
    print(f"Table name: {table_name}, Row Count: {row_count}")

connection.close()
