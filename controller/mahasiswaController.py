from app import mysql
from app import response
from flask import request
def datamahasiswa():
    try:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM tb_data_mahasiswa")
        rv = cur.fetchall()
        cur.close()
        data = ambildatamahasiswa(rv)
        return response.ok(data, "")
   

    except Exception as e:
        print(e)


def updatemahasiswa():
    try:
        nim =request.json['nim']
        nama= request.json['nama']
        prodi = request.json['prodi']
        alamat = request.json['alamat']
        cur = mysql.connection.cursor()
        cur.execute("SELECT *  FROM tb_data_mahasiswa WHERE nim=%s",(nim,))
        if len(cur.fetchall())==0:
            return response.badRequest("none","data tidak ada") 
        else:
            cur.execute("UPDATE tb_data_mahasiswa SET nama_mahasiswa=%s,prodi =%s, alamat =%s WHERE nim=%s",(nama,alamat,prodi,nim,))
            mysql.connection.commit()
            return response.ok("none", "berhasil update")

    except Exception as e:
        print(e)

def insertmahasiswa():
    try:
        nim =request.json['nim']
        nama= request.json['nama']
        prodi = request.json['prodi']
        alamat = request.json['alamat']
        cur = mysql.connection.cursor()
        cur.execute("SELECT *  FROM tb_data_mahasiswa WHERE nim=%s",(nim,))
        if len(cur.fetchall())!=0:
                return response.badRequest("none","data sudah ada") 
        else:
            mysql.connection.cursor().execute("INSERT INTO tb_data_mahasiswa VALUES (%s,%s,%s,%s)",(nim,nama, prodi,alamat,))
            mysql.connection.commit()
            return response.ok("none","berhasil insert data")
    except Exception as e:
        print(e)

def ambildatamahasiswa(users):
    array = []
    for i in range(len(users)):
        array.append({
            'nim': users[i][0],
            'nama': users[i][1],
            'prodi': users[i][2],
            'alamat': users[i][3],
        })
    return array

