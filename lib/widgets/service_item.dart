import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final String? name;
  final int? amoungt;
  const ServiceItem({Key? key, required this.name, required this.amoungt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Column(
          children: [
            Text(name!),
            Text(amoungt.toString()),
          ],
        ),
      ),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 112, 166, 241)
              , Color.fromARGB(255, 67, 142, 246)],
              
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
