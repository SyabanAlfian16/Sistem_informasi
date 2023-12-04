import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final NIMControl = TextEditingController();
  final NamaControl = TextEditingController();
  final EmailControl = TextEditingController();
  final PasswordControl = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    NIMControl.dispose();
    NamaControl.dispose();
    EmailControl.dispose();
    PasswordControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pendaftaran Data Mahasiswa'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "NIM",
                      hintText: "Masukan NIM Anda"),
                  controller: NIMControl,
                )),
            Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nama",
                      hintText: "Masukan Nama Anda"),
                  controller: NamaControl,
                )),
            Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      hintText: "Masukan E-Mail Anda"),
                  controller: EmailControl,
                )),
            Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      hintText: "Masukan Password Anda"),
                  controller: PasswordControl,
                )),
            Container(
                margin: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                child: TextButton(
                    onPressed: () {
                      //TODO Firebase Insert
                      //TODO Firebase Insert
                      String NIM = NIMControl.text;
                      String Nama = NamaControl.text;
                      String Email = EmailControl.text;
                      String Password = PasswordControl.text;
                      // Petakan Data ke Dictionary
                      Map<String, String> data = {
                        'nim': NIM,
                        'nama': Nama,
                        'email': Email,
                        'password': Password,
                      };
                      // Masukkan Data Mahasiswa dalam folder NIM
                      _databaseReference
                          .child('Mahasiswa')
                          .child(NIM)
                          .set(data)
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Registrasi Berhasil'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }).catchError((error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error.toString()),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Daftar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))),
            Container(
                margin: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(15)),
                child: TextButton(
                    onPressed: () {
                      //TODO Bersih Input
                      //TODO Bersihkan Input
                      NIMControl.text = "";
                      NamaControl.text = "";
                      EmailControl.text = "";
                      PasswordControl.text = "";
                    },
                    child: Text(
                      "Bersih",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))),
            Container(
                margin: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(15)),
                child: TextButton(
                    onPressed: () {
                      //TODO Batalkan Registerasi
                      //TODO Batalkan
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Batal",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))),
          ],
        ),
      ),
    );
  }
}
