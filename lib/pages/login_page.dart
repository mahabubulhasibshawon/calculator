import 'package:flutter/material.dart';
import 'calculator_page.dart'; // Import CalculatorPage

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers for email and password fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Fixed email and password for login
  final String fixedEmail = "mahabubulhasibshawon@gmail.com";
  final String fixedPassword = "password123";

  // Function to handle login logic
  void _login() {
    String inputEmail = emailController.text;
    String inputPassword = passwordController.text;

    if (inputEmail == fixedEmail && inputPassword == fixedPassword) {
      // Navigate to CalculatorPage on successful login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CalculatorPage()),
      );
    } else {
      // Show error message if login credentials don't match
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('assets/Frame.png', width: 1000)),
            const SizedBox(height: 20),
            const Text(
              'Welcome Back',
              style: TextStyle(
                fontFamily: 'SF Pro Rounded',
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Today is a new day. It's your day. You shape it. Sign in to start managing your projects.",
              style: TextStyle(
                fontFamily: 'SF Pro Rounded regular',
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: const Color(0xffF3F7FB),
              child: TextField(
                controller: emailController, // Email Controller
                decoration: const InputDecoration(
                  labelText: 'Email',
                  floatingLabelStyle: TextStyle(fontFamily: 'Roboto'),
                  hintText: 'example@email.com',
                  hintStyle: TextStyle(color: Color(0xffD4D7E3)),
                  labelStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(),
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: const Color(0xffF3F7FB),
              child: TextField(
                controller: passwordController, // Password Controller
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  floatingLabelStyle: TextStyle(fontFamily: 'Roboto'),
                  hintText: 'At least 8 characters',
                  hintStyle: TextStyle(color: Color(0xffD4D7E3)),
                  labelStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(),
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color(0xff1E4AE9),
                    fontFamily: 'Roboto',
                    fontSize: 14,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: _login, // Call the login function on tap
              child: Container(
                height: 50,
                width: 500,
                decoration: BoxDecoration(
                    color: const Color(0xff162D3A),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        fontFamily: 'Roboto Regular',
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: Divider(
                      color: Colors.grey[400],
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'or',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                Expanded(
                    child: Divider(
                      color: Colors.grey[400],
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.network(
                    'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                    height: 40,
                    width: 40,
                  ),
                  onPressed: () {
                    // Google sign-in logic
                  },
                ),
                const SizedBox(width: 30),
                IconButton(
                  icon: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/25/25231.png',
                    height: 40,
                    width: 40,
                  ),
                  onPressed: () {
                    // GitHub sign-in logic
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
