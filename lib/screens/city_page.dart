import 'package:clima_medium/components/formfield.dart';
import 'package:clima_medium/screens/home_page.dart';
import 'package:clima_medium/services/weather.dart';
import 'package:clima_medium/utilities/buttonstyle.dart';
import 'package:clima_medium/utilities/textstyle.dart';
import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  State<CityPage> createState() => _CityPage();
}

class _CityPage extends State<CityPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  WeatherData? data;
  bool isLoadDataDone = true;

  @override
  Widget build(BuildContext context) {
    void getData() async {
      isLoadDataDone = false;
      WeatherData? datas =
          await WeatherData.dataByCity(city.value.text, country.value.text);
      setState(() {
        data = datas;
        isLoadDataDone = true;
      });
    }

    void sendData() {
      getData();

      if (data != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      dataWithPosition: data,
                    )));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Data is not found, please re-check the input')));
      }
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/cityPageBc.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        // constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),

// -------------------- FORM FIELD
              Form(
                key: _formKey,
                child: Column(
                  children: [
// ---------------- CITY NAME FIELD
                    FormFieldTxt(
                      txtController: city,
                      label: 'City Name',
                      hint: null,
                      icon: Icons.location_city,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

// ----------------- COUNTRY FIELD

                    FormFieldTxt(
                      label: 'Code Country',
                      hint: 'ex. ID for Indonesia',
                      txtController: country,
                      icon: Icons.emoji_flags,
                    ),
                    const SizedBox(height: 20),

// -------------------- BUTTON

                    TextButton(
                      style: ButtonStyles.buttonNav.copyWith(
                        shape: const MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          sendData();
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          Text('Get Weather', style: TextStyles.button),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
