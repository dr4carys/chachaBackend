from app import mysql
from app import response
from flask import request
from datetime import date, datetime
import time

def lihatPeminjaman():
    try:
        cur = mysql.connection.cursor()
        cur.execute("SELECT pem.tgl_peminjaman,pem.id_buku,buk.judul_buku,buk.pengarang,buk.tahun_terbit,pem.nim,mas.nama_mahasiswa, mas.prodi,pem.nip, peg.nama_pegawai, peg.alamat FROM tb_data_peminjaman pem , tb_data_mahasiswa mas, tb_data_pegawai peg, tb_data_buku buk WHERE mas.nim=pem.nim AND peg.nip =pem.nip AND buk.id_buku = pem.id_buku")
        rv = cur.fetchall()
        cur.close()
        data = ambildataPeminjaman(rv)
        return response.ok(data, "")

    except Exception as e:
        print(e)

def updatePinjaman():
    try:
        id_peminjaman =request.json['id_peminjaman']
        cur = mysql.connection.cursor()
        tanggal = datetime.strptime(request.json['tanggal'],"%Y/%m/%d")    
     
        cur.execute("UPDATE tb_data_peminjaman SET tgl_jatuh_tempo =%s WHERE id_peminjaman=%s",(tanggal,id_peminjaman,))
        mysql.connection.commit()
        return response.ok("none", "berhasil update")

    except Exception as e:
        print(e)


def kembalikanbuku():
    try:
        id_peminjaman = request.json['id_peminjaman']
        cur = mysql.connection.cursor()
        cur.execute("SELECT tgl_jatuh_tempo , status_peminjaman FROM tb_data_peminjaman WHERE id_peminjaman=%s",(id_peminjaman,))
        rv = cur.fetchall()
        cur.close()
        print(rv[0][1])
        if rv[0][1] is 0:
            return response.badRequest("none","buku sudah di kembalikan")
        elif datetime.now()> rv[0][0] :
            return response.badRequest("none","sudah melewati batas pengembalian")
        else:
            mysql.connection.cursor().execute("UPDATE tb_data_peminjaman SET status_peminjaman =%s WHERE id_peminjaman = %s",(False,id_peminjaman,))
            mysql.connection.commit()
            cur.close()
            return response.ok("none","berhasil di kembalikan")
        
    except Exception as e:
        print(e)

def pinjambuku():
    try:
        nim=request.json['nim']
        nip=request.json['nip']
        id_buku =request.json['id_buku']
        tgl_jatuh_tempo= datetime.strptime(request.json['tgl_jatuh_tempo'],"%Y/%m/%d") 
        mysql.connection.cursor().execute("INSERT INTO tb_data_peminjaman VALUES (%s,%s,%s,%s,%s,%s,%s)",("",nim,nip,id_buku,datetime.now(),tgl_jatuh_tempo,False))
        mysql.connection.commit()
        return response.ok("none","data berhasil diinputkan")
    except Exception as e:
        print(e)
    

def ambildataPeminjaman(users):
    array = []
    for i in range(len(users)):
        print("bram")
        array.append({
            'tanggal_peminjaman': users[i][0],
            'detail_buku':
                {
                    'id_buku':users[i][1],
                    'judul_buku':users[i][2],
                    'pengarang_buku':users[i][3],
                    'tahun_terbit':users[i][4]
                },
            'detail_mahasiswa':{
                    'nim':users[i][5],
                    'nama_mahasiswa':users[i][6],
                    'prodi':users[i][7]
            },
            'detail_pegawai':{
                    'nip':users[i][8],
                    'nama_peg':users[i][9],
                    'alamat_peg':users[i][10]
            }
        })
    
    return array
