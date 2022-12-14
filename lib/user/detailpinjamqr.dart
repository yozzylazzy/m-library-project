import 'package:flutter/material.dart';
import 'package:uas_2020130002/controller/transaksiController.dart';
import 'package:uas_2020130002/user/QrPinjamBuku.dart';

import '../model/peminjaman.dart';


class DetailPinjamAmbil extends StatelessWidget {
  final Peminjaman peminjaman;
  DetailPinjamAmbil({Key? key, required this.peminjaman}) : super(key: key);
  TransaksiController repository = new TransaksiController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3F0CAD),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFF3F0CAD),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
          return QrCodePinjam(peminjaman: peminjaman,);
          }));
        },
        icon : Icon(Icons.qr_code_2),
        label: Text("QR CODE PINJAM"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                backgroundDetail(),
              ],
            ),
            SizedBox(height: 120,),
            Container(
              child: Column(
                children: [
                  Align(
                    child: Text(
                      "INI JUDUL BUKU", style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 35,),
                  Padding(padding: EdgeInsets.only(left: 30, right: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Deskripsi Buku", style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                      ),
                        textAlign: TextAlign.left,
                      ),
                    ),),
                  SizedBox(height: 2,),
                  Padding(padding: EdgeInsets.only(left: 30, right: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        peminjaman.idpeminjaman, style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                      ),
                        textAlign: TextAlign.left,
                      ),
                    ),),
                  SizedBox(height: 15,),
                  Padding(padding: EdgeInsets.only(left: 30, right: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Pengarang Buku", style: TextStyle(
                        fontFamily: 'Montserrat',fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                        textAlign: TextAlign.left,
                      ),
                    ),),
                  SizedBox(height: 2,),
                  Padding(padding: EdgeInsets.only(left: 30, right: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        peminjaman.status, style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                      ),
                        textAlign: TextAlign.left,
                      ),
                    ),),
                  SizedBox(height: 15,),
                  Padding(padding: EdgeInsets.only(left: 30, right: 30),
                    child: Divider(height: 2,color: Colors.grey,),),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 30, right: 30),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Tahun Terbit Buku", style: TextStyle(
                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                                  textAlign: TextAlign.left,
                                ),
                              ),),
                            SizedBox(height: 2,),
                            Padding(padding: EdgeInsets.only(left: 30, right: 30),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "2022", style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15,
                                ),
                                  textAlign: TextAlign.left,
                                ),
                              ),),
                            SizedBox(height: 15,),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 30, right: 30),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Halaman Buku", style: TextStyle(
                                  fontFamily: 'Montserrat',fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                                  textAlign: TextAlign.left,
                                ),
                              ),),
                            SizedBox(height: 2,),
                            Padding(padding: EdgeInsets.only(left: 30, right: 30),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "100", style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15,
                                ),
                                  textAlign: TextAlign.left,
                                ),
                              ),),
                            SizedBox(height: 15,),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Center(
                      child: ElevatedButton(
                      onPressed: (){
                            showDialog(
                            context: context, builder: (context) {
                              return AlertDialog(title: Column(
                                children: [
                                  SizedBox(
                                      child: Icon(
                                        Icons.warning, color: Colors.red,
                                        size: 45,)),
                                  SizedBox(height: 10,),
                                  SizedBox(child: Text('KONFIRMASI PEMBATALAN',
                                    style: TextStyle(fontFamily: 'Sono',
                                        fontWeight: FontWeight.w800),)),
                                  SizedBox(height: 10,),
                                  Divider(
                                    thickness: 4, color: Colors.deepPurple,
                                  )
                                ],
                              ),
                                content: Text(
                                    "Konfirmasikan Bahwa Anda Akan Membatalkan Pemesanan Buku Ini",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat', fontWeight:
                                    FontWeight.w700)),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        peminjaman.referenceId =
                                            peminjaman.npm + peminjaman.IdBuku +
                                                peminjaman.idpeminjaman;
                                        repository.deleteTransaksi(peminjaman);
                                        await showDialog(context: context,
                                            builder: (_) =>
                                                dialogInformasiPenghapusan(
                                                    context));
                                        Navigator.of(context).pop();
                                      }, child: Text("BATALKAN")),
                                  TextButton(onPressed: () {
                                    Navigator.of(context).pop();
                                  }, child: Text("BATAL")
                                  ),
                                ],
                              );
                            });
                      }, child: Text("BATALKAN PEMESANAN"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),)
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dialogInformasiPenghapusan(BuildContext context){
    return AlertDialog(title: Column(
      children: [
        SizedBox(
            child: Icon(Icons.info, color: Colors.blueAccent,size: 45,)),
        SizedBox(height: 10,),
        SizedBox(child: Text('PEMESANAN BUKU TELAH DIBATALKAN',
          style: TextStyle(fontFamily: 'Sono',fontWeight: FontWeight.w800),)),
        SizedBox(height: 10,),
        Divider(thickness: 4,color: Colors.deepPurple,
        )
      ],
    ), content: Text("Proses Peminjaman Buku Telah Dibatalkan, Silahkan Lakukan Peminjaman Ulang untuk Memesan",
        style: TextStyle(fontFamily: 'Montserrat', fontWeight:
        FontWeight.w700)), actions: [
      TextButton(onPressed: (){
        Navigator.pop(context);
        Navigator.of(context).pop();
      }, child: Text("OK")),
    ],
    );
  }

  Widget backgroundDetail(){
    return Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              children: [
                Flexible(child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Color(0xFF5B61D9),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(200,150)),
                  ),
                ),),
              ],
            ),
            Positioned(
                top: 30,
                left: 10, right: 10,
                child:
                Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      height: 350.0,
                      child: Center(
                        child: Image.asset("assets/images/bukulist.png"),
                      ),
                    ),
                  ],
                )
            ),
          ],
        )
    );
  }
}
