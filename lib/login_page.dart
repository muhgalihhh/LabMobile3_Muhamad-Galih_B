import 'package:flutter/material.dart';
import 'package:modul_3/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var namauser;
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeInAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
  }

  Widget _showInput(TextEditingController controller, String placeholder,
      bool isPassword, IconData icon) {
    return SlideTransition(
      position: _slideAnimation,
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(
          fontFamily: 'Lexend',
          fontSize: 16,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey[600]),
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontFamily: 'Lexend',
            fontSize: 16,
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey[300]!,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey[600]!,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(String message, String description, Widget page,
      {bool isSuccess = true}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              Icon(
                isSuccess ? Icons.check_circle : Icons.error,
                color: isSuccess ? Colors.green : Colors.red,
                size: 30,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    fontFamily: 'Lexend',
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              description,
              style: const TextStyle(
                fontFamily: 'Lexend',
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'OK',
                style: TextStyle(
                  fontFamily: 'Lexend',
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page));
              },
            ),
          ],
        );
      },
    );
  }

  void _showAppInfo() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              const Icon(
                Icons.info,
                color: Colors.blue,
                size: 30,
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Informasi Aplikasi',
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              'Ini adalah aplikasi search Film sederhana yang dibuat menggunakan Flutter.\nVersi: 3.42.2\nDibuat oleh: Galih Ganteng',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontSize: 16,
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        centerTitle: true,
        title: const Text(
          'Login',
          style: TextStyle(
            fontFamily: 'Lexend',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: const Icon(
          Icons.login_rounded,
          color: Colors.black,
          size: 28,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.black),
            onPressed: _showAppInfo,
          ),
        ],
        shadowColor: Colors.grey[200],
      ),
      body: FadeTransition(
        opacity: _fadeInAnimation,
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.account_circle,
                color: Colors.grey,
                size: 100,
              ),
              const SizedBox(height: 30),
              _showInput(
                  _usernameController, 'Username', false, Icons.person_outline),
              const SizedBox(height: 20),
              _showInput(
                  _passwordController, 'Password', true, Icons.lock_outline),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  if (_usernameController.text == 'admin' &&
                      _passwordController.text == 'admin') {
                    _saveUsername();
                    _showDialog('Login Berhasil', 'Anda berhasil login.',
                        const HomePage());
                  } else {
                    _showDialog('Login Gagal', 'Username atau password salah.',
                        const LoginPage(),
                        isSuccess: false);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
