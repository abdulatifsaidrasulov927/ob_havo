import 'package:flutter/material.dart';
import 'package:n8_default_project/data/models/main/weather_main_model.dart';
import 'package:n8_default_project/ui/daly_wethear_screen/daly_wethear_screen.dart';
import 'package:n8_default_project/utils/icons.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key, required this.weatherMainModel}) : super(key: key);
  final WeatherMainModel weatherMainModel;

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            AppImages.sky,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 70,
          left: 10,
          right: 10,
          child: Column(
            children: [
              Text(
                widget.weatherMainModel.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                "${(((widget.weatherMainModel.mainInMain.temp - 273.15) * 9 % 5) + 32).toInt()} °",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                widget.weatherMainModel.weatherModel[0].description,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                DateFormatForWethear(widget.weatherMainModel.dateTime),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        Positioned(
          top: 340,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              AppImages.house,
            ),
          ),
        ),
        Positioned(
          top: 660,
          left: 10,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DalyWethearScreen()));
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                    elevation: const MaterialStatePropertyAll<double>(10),
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Colors.transparent.withOpacity(0.6))),
                child: const Text(
                  'Hafta davomida',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  bool chooseColor() {
    return true;
  }

  String DateFormatForWethear(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return (date.toString()).substring(0, 11);
  }
}
