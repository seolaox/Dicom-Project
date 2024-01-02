import 'package:flutter/material.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('PACSPLUS',style: TextStyle( fontSize: 30,fontWeight: FontWeight.w700),),
        SizedBox(width: 5,),
      ],
    );
  }
}