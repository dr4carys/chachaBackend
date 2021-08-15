from flask import Flask #Memanggil library Flask
from flask_mysqldb import MySQL
app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'db_perpustakaan'
mysql = MySQL(app)
 #Untuk menjelaskan nama modul yang digunakan, sehingga ketika folder lain memanggil folder app akan otomatis teridentifikasi.

from app import routes #Memanggil file routes (akan segera dibuat)