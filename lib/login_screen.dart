import 'package:akasa_air_demo_project/component.dart';
import 'package:akasa_air_demo_project/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileController = TextEditingController();
  bool _isButtonEnabled = false; // Controls the button state

  @override
  void initState() {
    super.initState();
    // Listen to changes in the mobile number field
    _mobileController.addListener(_validateInput);
  }

  @override
  void dispose() {
    _mobileController.dispose();
    super.dispose();
  }

  void _validateInput() {
    setState(() {
      // Check if the input is exactly 10 digits
      _isButtonEnabled = _mobileController.text.length == 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                // App Logo
                SvgPicture.asset(
                  'assets/svg/logo_akasa.svg',
                  height: 70.0,
                  width: 40.0,
                ),
                const SizedBox(height: 35),

                // Mobile Number Row
                Row(
                  children: [
                    // Country Code Field
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 54, // Ensures consistent height
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/india.png',
                                height: 20,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                '+91',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Mobile Number Field
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        height:
                            56, // Matches the height of the country code field
                        child: TextField(
                          controller: _mobileController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            labelText: 'Mobile Number',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 12),
                          ),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter
                                .digitsOnly, // Allow digits only
                            LengthLimitingTextInputFormatter(
                                10), // Limit to 10 digits
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 56, // Matches the height of the text fields
                  child: ElevatedButton(
                    onPressed: _isButtonEnabled
                        ? () {
                            // Add your OTP logic here
                            print("OTP sent to ${_mobileController.text}");
                          }
                        : null, // Disable button if input is invalid
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.deepOrange, // Button color when enabled
                      disabledBackgroundColor:
                          Colors.deepOrange, // Button color when disabled
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Sign In With OTP',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white, // Text color remains white
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // OR Divider
                const Row(
                  children: [
                    Expanded(
                        child: Divider(color: Color.fromARGB(255, 85, 84, 84))),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'OR',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 85, 84, 84)),
                      ),
                    ),
                    Expanded(
                        child: Divider(color: Color.fromARGB(255, 85, 84, 84))),
                  ],
                ),

                const SizedBox(height: 25),

                // Sign in with Password
                GestureDetector(
                  onTap: () {
                    // Navigate to Sign In with Password screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInWithPasswordScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign in with password',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  height: 56, // Matches the height of the text fields
                  child: OutlinedButton(
                    onPressed: () {
                      // Add your signup logic here
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                      ),
                    ),
                    child: const Text(
                      'Sign up for faster checkout',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Row(
                  children: [
                    Expanded(
                        child: Divider(color: Color.fromARGB(255, 85, 84, 84))),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'OR',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 85, 84, 84)),
                      ),
                    ),
                    Expanded(
                        child: Divider(color: Color.fromARGB(255, 85, 84, 84))),
                  ],
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset('assets/svg/google.svg'),
                      iconSize: 40,
                      onPressed: () {
                        // Google login logic
                      },
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: SvgPicture.asset('assets/svg/apple.svg'),
                      iconSize: 40,
                      onPressed: () {
                        // Apple login logic
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 100.0),

                // Continue as Guest
                GestureDetector(
                  onTap: () {
                    // Navigate to Guest Login Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Continue as guest',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Terms and Privacy Policy
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 4.0,
                  children: [
                    const Text(
                      'By continuing, I agree to the',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Terms of Use screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TermsOfUseScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Terms of Use',
                        style: TextStyle(fontSize: 12, color: Colors.purple),
                      ),
                    ),
                    const Text(
                      'and',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Privacy Policy screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Privacy Policy',
                        style: TextStyle(fontSize: 12, color: Colors.purple),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Placeholder Screens
class SignInWithPasswordScreen extends StatelessWidget {
  const SignInWithPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In with Password')),
      body: const Center(child: Text('Sign In with Password Screen')),
    );
  }
}

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terms of Use')),
      body: const Center(child: Text('Terms of Use Screen')),
    );
  }
}

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: const Center(child: Text('Privacy Policy Screen')),
    );
  }
}
