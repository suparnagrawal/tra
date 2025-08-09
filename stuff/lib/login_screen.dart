import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedCode = "+91";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAF8), // Light background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70),

              // Top Illustration
              Image.asset(
                'assets/login_img.png', // PNG instead of SVG
                width: 300,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 30),

              // Welcome Text
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome back!",
                  style: GoogleFonts.dmSans(
                    fontSize: 16,
                    color: const Color(0xFF292927), // Darker text color
                  ),
                ),
              ),
              const SizedBox(height: 4),

              // Login Title
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: GoogleFonts.dmSans(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const SizedBox(width: 7),
                        Container(
                          width: 28.31,
                          height: 8.22,
                          decoration: BoxDecoration(
                            color: const Color(0xFF39695E),
                            borderRadius: BorderRadius.circular(6.39),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Phone Number Heading
              Text(
                "Phone Number",
                style: GoogleFonts.dmSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF053742), // Darker text color
                ),
              ),

              const SizedBox(height: 8),

              // Instruction text
              Text(
                "Please enter your phone number to verify your account",
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 20),

              // Phone Number Input Row
              Row(
                children: [
                  // Country code selector
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 55,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedCode,
                          isExpanded: true,
                          items: ["+91", "+1"].map((code) {
                            return DropdownMenuItem(
                              value: code,
                              child: Text(
                                code,
                                style: GoogleFonts.dmSans(fontSize: 16),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedCode = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Phone number field
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 55,
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        style: GoogleFonts.dmSans(fontSize: 16),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter phone number",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Send OTP Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF39695E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Send otp",
                        style: GoogleFonts.dmSans(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Register link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New here? ",
                    style: GoogleFonts.dmSans(fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Register",
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        color: const Color(0xFF39695E),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
