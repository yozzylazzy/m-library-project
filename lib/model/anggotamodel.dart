import 'package:cloud_firestore/cloud_firestore.dart';

class Anggota{
  String npm;
  String nama;
  String alamat;
  String jenjang;
  String tglmasuk;
  String gender;
  String? referenceId;

  Anggota(this.npm, this.nama, this.alamat, this.jenjang, this.tglmasuk, this.gender);

  Anggota.fromJson(Map<String, dynamic> json):
        npm = json['npm'],
        nama = json['nama'],
        alamat = json['alamat'],
        jenjang = json['jenjang'],
        tglmasuk = json['tglmasuk'],
        gender = json['gender'];

  Map<String, dynamic> toJson()=>{
    'npm': npm,
    'nama': nama,
    'alamat': alamat,
    'jenjang': jenjang,
    'tglmasuk': tglmasuk,
    'gender': gender
  };

  factory Anggota.fromSnapshot(DocumentSnapshot snapshot){
    final newAnggota = Anggota.fromJson(snapshot.data() as Map<String, dynamic>);
    newAnggota.referenceId = snapshot.reference.id;
    return newAnggota;
  }

}