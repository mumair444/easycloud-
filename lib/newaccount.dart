import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:using_widgets/main.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({Key? key}) : super(key: key);

  @override
  State<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  TextEditingController newusername = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  Future<void> create() async {
    if (newusername.text.isNotEmpty && newpassword.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse('https://reqres.in/api/register'),
          body: ({'email': newusername.text, 'password': newpassword.text}));
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Umair(),
          ),
        );
      } else {
        Fluttertoast.showToast(
            msg: 'Please enter valid email and password',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.transparent,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 126, 200, 234),
      appBar: AppBar(
        title: const Text(
          'Create New Account',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 52, 179, 238),
                Color.fromARGB(255, 231, 133, 195),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            TextField(
              controller: newusername,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 3,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
                fillColor: const Color.fromARGB(255, 52, 179, 238),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.person,
                ),
                hintText: 'please enter your username',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: newpassword,
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 3,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
                fillColor: const Color.fromARGB(255, 52, 179, 238),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.password,
                ),
                hintText: 'please enter your password',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                create();
              },
              child: const Text(
                'Create Account ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(
                    width: 2,
                    color: Colors.black,
                  ),
                )),
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 52, 179, 238),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
