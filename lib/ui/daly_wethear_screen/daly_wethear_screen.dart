import 'package:flutter/material.dart';
import 'package:n8_default_project/data/models/detail/one_call_data.dart';
import 'package:n8_default_project/data/models/universal_data.dart';
import 'package:n8_default_project/data/network/api_provider.dart';
import 'package:n8_default_project/ui/daly_wethear_screen/dalhy_whear_main.dart';

class DalyWethearScreen extends StatefulWidget {
  const DalyWethearScreen({Key? key}) : super(key: key);

  @override
  State<DalyWethearScreen> createState() => _DalyWethearScreenState();
}

class _DalyWethearScreenState extends State<DalyWethearScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[300],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.black,
          ),
        ),
        title: const Text('Daly Wethear'),
      ),
      body: FutureBuilder<UniversalDataForDaly>(
        future: ApiProvider.getWeatherOneCallData(
          lat: 41.2995,
          long: 69.2401,
        ),
        builder: (BuildContext context,
            AsyncSnapshot<UniversalDataForDaly> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.error.isEmpty) {
              OneCallData oneCallData = snapshot.data!.data as OneCallData;
              return DalyWthearMain(
                oneCallData: oneCallData,
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
