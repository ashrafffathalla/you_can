import 'package:flutter/material.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/shared/shared_commponents/commponents.dart';
import 'package:you_can/view/pages/home/sessions/sessionsScreen/inside_screens/sessionVideo/sessionVideo.dart';


class PraciceScreen extends StatelessWidget {
  const PraciceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: size.width*0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height/2,),
             Center(child: Text('SOOOOON')),
            ],
          ),
        ),
      ),
    );
  }
}
