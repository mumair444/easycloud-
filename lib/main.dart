import 'package:flutter/material.dart';
import 'package:using_widgets/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  bool _obscureText = true;

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
      backgroundColor: const Color.fromARGB(255, 231, 133, 195),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/easycloudlogo.png',
                height: 350,
              ),
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
                  hintText: 'username',
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: password,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 3,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(30),
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
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off),
                  ),
                  hintText: 'password',
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: () async {
                  if (username.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: 'Please add your username',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.transparent,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  if (password.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: 'Please add your password',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.transparent,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  if (username.text.isEmpty && password.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: 'Please enter your credentials',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.transparent,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    if (username.text == 'umair' && password.text == 'umair') {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString("isLoggedIn", true.toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    } else if (username.text.isNotEmpty &&
                        password.text.isNotEmpty) {
                      Fluttertoast.showToast(
                          msg: 'Please enter a valid email and password',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.transparent,
                          textColor: Colors.white,
                          fontSize: 16.0);

                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //     content: Text('Please enter a valid email and password'),
                      //   ),
                      // );
                    }
                  }
                },
                child: const Text(
                  'Sign In',
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

              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // const CircleAvatar(
              //   radius: 20,
              //   backgroundColor: Colors.grey,
              //   child: Icon(Icons.arrow_forward_ios),
              // ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
