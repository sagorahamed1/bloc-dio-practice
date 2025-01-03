
import 'package:bloc_api_request/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../route/routes.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 100),

            const Text(AppStrings.welcome, style: TextStyle(fontSize: 28)),

           const  SizedBox(height: 20),
            const Text(AppStrings.pleaseGive, style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),


          const  SizedBox(height: 50),

            /// ================image for login ==========...
            SvgPicture.asset("assets/icons/login.svg", height: 250, width: 300, fit: BoxFit.cover),



            const SizedBox(height: 50),


            ///==============log in button============>>>
            GestureDetector(
              onTap: (){
                context.push(Routes.homeScreen);
              },
              child: Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  color: Colors.white38,
                  border: Border.all(color: Colors.purpleAccent, width: 1.5)
                ),
                child: const Center(child: Text(AppStrings.logIn)),
              ),
            ),





            const SizedBox(height: 20),


            ///==============sign up button============>>>
            GestureDetector(
              onTap: (){
                context.push(Routes.signup);
              },
              child: Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: Colors.purpleAccent,
                    border: Border.all(color: Colors.purpleAccent, width: 1.5)
                ),
                child: const Center(child: Text(AppStrings.singUp)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
