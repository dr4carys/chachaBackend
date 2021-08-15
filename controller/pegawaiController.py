from app import mysql
from app import response
from flask import request
def datapegawai():
    try:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM tb_data_pegawai")
        rv = cur.fetchall()
        cur.close()
        data = ambildataPegawai(rv)
        return response.ok(data, "")
   

    except Exception as e:
        print(e)


# def selectpegawai():
#     try:
#         id = request.json['id']
#         cur = mysql.connection.cursor()
#         cur.execute("SELECT *  FROM tb_data_pegawai WHERE nim=%s",(id,))
#         rv = cur.fetchall()
#         cur.close()
#         data = ambildataPegawai(rv)
#         return response.ok(data, "")

#     except Exception as e:
#         print(e)

def updatepegawai():
    try:
        nip =request.json['nip']
        nama= request.json['nama']
        alamat = request.json['alamat']
        password = request.json['password']
        cur = mysql.connection.cursor()
        cur.execute("SELECT *  FROM tb_data_pegawai WHERE nip=%s",(nip,))
        if len(cur.fetchall())==0:
            return response.badRequest("none","data tidak ada") 
        else:
            cur.execute("UPDATE tb_data_pegawai SET nama_pegawai=%s,alamat =%s, password_peg =%s WHERE nip=%s",(nama,alamat,password,nip,))
            mysql.connection.commit()
            return response.ok("none", "berhasil update")

    except Exception as e:
        print(e)

def insertpegawai():
    try:
        nip= request.json['nip']
        nama= request.json['nama']
        alamat = request.json['alamat']
        password = request.json['password']
        cur = mysql.connection.cursor()
        cur.execute("SELECT *  FROM tb_data_pegawai WHERE nip=%s",(nip,))
        if len(cur.fetchall())!=0:
            return response.badRequest("none","data sudah ada") 
        else:
            cur.execute("INSERT INTO tb_data_pegawai VALUES (%s,%s,%s,%s)",(nip,nama, alamat,password,))
            mysql.connection.commit()
            return response.ok("none","berhasil insert data")
    except Exception as e:
        print(e)

def ambildataPegawai(users):
    array = []
    for i in range(len(users)):
        array.append({
            'id': users[i][0],
            'name': users[i][1],
            'asal': users[i][2]
        })
    return array

