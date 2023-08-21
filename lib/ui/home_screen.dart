import 'package:flutter/material.dart';
import 'package:n8_default_project/data/models/main/weather_main_model.dart';
import 'package:n8_default_project/data/models/universal_data.dart';
import 'package:n8_default_project/data/network/api_provider.dart';
import 'package:n8_default_project/ui/widgets/home_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = 'search';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UniversalData>(
        future: ApiProvider.getMainWeatherDataByQuery(query: "Tashkent"),
        builder: (BuildContext context, AsyncSnapshot<UniversalData> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.error.isEmpty) {
              WeatherMainModel weatherMainModel =
                  snapshot.data!.data as WeatherMainModel;
              return HomeMain(
                weatherMainModel: weatherMainModel,
              );
            }
          }

          return Center(
            child: Text(snapshot.error.toString()),
          );
        },
      ),
    );
  }
}
