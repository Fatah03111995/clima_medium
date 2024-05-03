import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  State<CityPage> createState() => _CityPage();
}

class _CityPage extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/cityPageBc.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: null,
                color: Colors.white,
              ),
              TextButton(onPressed: () {}, child: Text('Get Weather'))
            ],
          ),
        ),
      ),
    );
  }
}
