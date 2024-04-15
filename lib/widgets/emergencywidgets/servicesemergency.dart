import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../emergencies/FuelEmergency.dart';
import '../emergencies/OnSiteMechanicEmergency.dart';
import '../emergencies/TowingEmergency.dart';
class ServicesEmergency extends StatelessWidget {
  const ServicesEmergency({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width,
      height:180,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          TowingEmergency(),
          FuelEmergency(),
          OnSiteMechanicEmergency(),

        ],
      ),

    );
  }
}


