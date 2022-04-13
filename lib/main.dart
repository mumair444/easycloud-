import 'package:flutter/material.dart';
import 'package:using_widgets/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Umair(),
    ),
  );
}

class Umair extends StatefulWidget {
  const Umair({Key? key}) : super(key: key);

  @override
  State<Umair> createState() => _UmairState();
}

class _UmairState extends State<Umair> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? val = prefs.getString("isLoggedIn");
    if (val != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 95, 178, 214),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: username,
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
              fillColor: Colors.grey,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              prefixIcon: const Icon(
                Icons.person,
              ),
              hintText: 'username',
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          TextField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 3,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              fillColor: Colors.grey,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              prefixIcon: const Icon(
                Icons.password,
              ),
              hintText: 'password',
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () async {
              if (username.text == 'test' && password.text == 'test') {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString("isLoggedIn", true.toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please enter a valid email and password'),
                  ),
                );
              }
            },
            child: const Text(
              'Enter',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            style: ButtonStyle(
              side: MaterialStateProperty.all(
                const BorderSide(
                  width: 3,
                  color: Colors.black,
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(
                  255,
                  118,
                  174,
                  219,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
