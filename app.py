from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)

# Set up the database connection
mydb = mysql.connector.connect(
    host="174.129.76.81",
    user="admin",
    password="admin123",
    port=3306,
    database="mylibrary"
)

# Define a function to get the books from the database
def get_books():
    cursor = mydb.cursor()
    cursor.execute("SELECT * from books")
    books = cursor.fetchall()
    return books

# Define a route to add a new book
@app.route('/')
def home():
    books = get_books()
    return render_template('home.html', books=books)

# Define a route to add a new book
@app.route('/add', methods=['GET', 'POST'])
def add():
    if request.method == 'POST':
        title = request.form['title']
        author = request.form['author']
        cursor = mydb.cursor()
        cursor.execute("INSERT INTO books (title, author) VALUES (%s, %s)", (title, author))
        mydb.commit()
        return 'Books added successfully'
    else:
        return render_template('add.html')

if __name__ == '__main__':
    app.run()
