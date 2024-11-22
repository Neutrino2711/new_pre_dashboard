<<<<<<< HEAD
import 'package:flutter/gestures.dart';
=======
>>>>>>> 9f85099e04cbdce6aa94fab2d0cf6850cf6e2447
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/svg.dart';
import 'package:pre_dashboard/screens/forgot_pass.dart';
<<<<<<< HEAD
=======
import '../screens/timeResend.dart';
>>>>>>> 9f85099e04cbdce6aa94fab2d0cf6850cf6e2447
import '../constants/constants.dart';
import '../Model/enum.dart';
import '../Widgets/otpInput.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  OtpStatus _otpStatus = OtpStatus.normal;
  Timer? _timer;
  int _timeLeft = 120;
  final String _correctOtp = "543261";
  bool _isVerified = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  void startTimer() {
    setState(() {
      _timeLeft = 120;
      _isVerified = false;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

<<<<<<< HEAD
  void resendOtp() {
    startTimer();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('OTP has been resent to your email address.'),
      ),
    );
  }

=======
>>>>>>> 9f85099e04cbdce6aa94fab2d0cf6850cf6e2447
  void validateOtp() {
    setState(() {
      if (_otpController.text.length != 6) {
        _otpStatus = OtpStatus.error;
        return;
      }

      if (_otpController.text == _correctOtp) {
        _otpStatus = OtpStatus.success;
        _isVerified = true;
        _timer?.cancel();
<<<<<<< HEAD
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgotPass()),
        );
=======
        Navigator.push(context,MaterialPageRoute(builder: (context)=> ForgotPass()));
>>>>>>> 9f85099e04cbdce6aa94fab2d0cf6850cf6e2447
      } else {
        _otpStatus = OtpStatus.error;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                SvgPicture.asset(
                  'assets/images/main.svg',
                  height: 50,
                ),
                Image.asset(
                  'assets/images/main.png',
                  height: 50,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Verify your Email address",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),
                SvgPicture.asset(
                  'assets/images/optImage.svg',
                  height: 250,
                ),
                const SizedBox(height: 40),
                Align(
<<<<<<< HEAD
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Enter One Time Password",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          TextSpan(
                            text: "*",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.primaryDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
=======
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.0, bottom: 8.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Enter One Time Password",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                            TextSpan(
                              text: "*",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.primaryDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
>>>>>>> 9f85099e04cbdce6aa94fab2d0cf6850cf6e2447
                OtpInputField(
                  controller: _otpController,
                  otpStatus: _otpStatus,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        _otpStatus = OtpStatus.normal;
                      });
                    }
                  },
                ),
                if (_otpStatus == OtpStatus.error &&
                    _otpController.text.isNotEmpty)
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Invalid OTP Number.',
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
<<<<<<< HEAD
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
=======
                TimerResendSection(
                  timeLeft: _timeLeft,
                  isVerified: _isVerified,
                  onResend: startTimer,
                ),
                const SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text:const TextSpan(
                    style: TextStyle(
>>>>>>> 9f85099e04cbdce6aa94fab2d0cf6850cf6e2447
                      fontSize: 14,
                      color: AppColors.textColor,
                    ),
                    children: [
<<<<<<< HEAD
                      const TextSpan(text: 'Please, Enter your '),
                      const TextSpan(
                        text: 'six digit',
                        style: TextStyle(
                          color: AppColors.swipeScreenTopTextFirst,
                        ),
                      ),
                      const TextSpan(
                        text: ' code that you have received in your mail box. ',
                      ),
                      TextSpan(
                        text: 'Resend OTP',
                        style: const TextStyle(
                          color: AppColors.linkUnderline,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = resendOtp,
=======
                      TextSpan(text: 'Please, Enter your '),
                      TextSpan(
                        text: 'six digit',
                        style: TextStyle(color: AppColors.swipeScreenTopTextFirst),
                      ),
                      TextSpan(
                        text: ' code that you have received in your mail box.',
>>>>>>> 9f85099e04cbdce6aa94fab2d0cf6850cf6e2447
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: validateOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryDark,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.background,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
