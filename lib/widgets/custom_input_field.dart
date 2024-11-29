import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;

  const CustomInputField({required this.label,
  required this.validator,
   this.keyboardType,
   Key? key}) : super(key: key);

   final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: screenHeight * 0.018, // Responsive font size
              color: const Color(0xff626262),
            ),
            children:const [
              TextSpan(
                text: "*",
                style: TextStyle(color: Color(0xff0F3CC9)),
              ),
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.01), // Responsive spacing
        TextFormField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: label,
            
            filled: false,
            fillColor: const Color(0xFFF1F4FF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff0F3CC9)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xff0F3CC9),
                width: 1.5,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
            ),
          ),
          validator: validator,
        ),
        SizedBox(height: screenHeight * 0.02), // Responsive spacing
      ],
    );
  }
}
