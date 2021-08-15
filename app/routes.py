from app import app
from flask import request
from controller import pegawaiController
from controller import mahasiswaController
from controller import pinjambukucontroller
@app.route('/')
@app.route('/pegawai', methods=['POST', 'GET', 'PUT'])
def index():
    if request.method == 'POST':
        return pegawaiController.datapegawai()
    elif request.method == 'GET':
        return pegawaiController.insertpegawai()
    elif request.method =='PUT':
        return pegawaiController.updatepegawai()

@app.route('/mahasiswa',methods=['POST', 'GET', 'PUT'])
def mahasiswaindex():
    if request.method == 'POST':
        return mahasiswaController.datamahasiswa()
    elif request.method == 'GET':
        return mahasiswaController.insertmahasiswa()
    elif request.method =='PUT':
        return mahasiswaController.updatemahasiswa()

@app.route('/buku',methods=['POST', 'GET', 'PUT'])
def buku():
    if request.method == 'POST':
        return pinjambukucontroller.lihatPeminjaman()
    elif request.method == 'GET':
        return pinjambukucontroller.pinjambuku()
    elif request.method == 'PUT':
        return pinjambukucontroller.updatePinjaman()

@app.route('/kembalikanBuku',methods=['GET'])
def kembalikanBuku():
    return pinjambukucontroller.kembalikanbuku()




