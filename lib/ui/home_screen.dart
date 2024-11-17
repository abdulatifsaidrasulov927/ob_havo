import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:n8_default_project/utils/icons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:n8_default_project/data/models/main/weather_main_model.dart';
import 'package:n8_default_project/data/models/universal_data.dart';
import 'package:n8_default_project/data/network/api_provider.dart';
import 'package:n8_default_project/ui/widgets/home_main.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  bool _isConnected = true;

  final List<String> _cities = ["Tashkent", "Samarkand"];
  final Map<String, String> _cityBackgrounds = {
    "Tashkent": AppImages.sky,
    "Samarkand": AppImages.registon,
  };

  final Map<String, Future<UniversalData>> _fetchedData = {};

  @override
  void initState() {
    super.initState();
    _checkInternetConnectivity(); // Internetni tekshirish
    for (var city in _cities) {
      _fetchedData[city] = ApiProvider.getMainWeatherDataByQuery(query: city);
    }
  }

  // Internetni tekshirish funksiyasi
  Future<void> _checkInternetConnectivity() async {
    try {
      final response = await http.get(Uri.parse('https://www.google.com'));
      if (response.statusCode == 200) {
        setState(() {
          _isConnected = true;
        });
      } else {
        setState(() {
          _isConnected = false;
        });
      }
    } catch (e) {
      setState(() {
        _isConnected = false;
      });
    }
  }

  // Shimmer effektini yaratish
  Widget _buildShimmerLoader(String backgroundImage) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            backgroundImage,
            height: 900,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.6),
            highlightColor: Colors.grey.withOpacity(0.9),
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _isConnected
            ? PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: _cities.length,
                itemBuilder: (context, index) {
                  String city = _cities[index];
                  String backgroundImage = _cityBackgrounds[city] ?? "";

                  return Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          backgroundImage,
                          height: 900,
                          fit: BoxFit.cover,
                        ),
                      ),
                      FutureBuilder<UniversalData>(
                        future: _fetchedData[city],
                        builder: (BuildContext context,
                            AsyncSnapshot<UniversalData> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return _buildShimmerLoader(backgroundImage);
                          } else if (snapshot.hasData) {
                            if (snapshot.data!.error.isEmpty) {
                              WeatherMainModel weatherMainModel =
                                  snapshot.data!.data as WeatherMainModel;
                              return HomeMain(
                                  weatherMainModel: weatherMainModel);
                            } else {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Error: ${snapshot.data!.error}",
                                      style: const TextStyle(
                                          color: Colors.red, fontSize: 18),
                                    ),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Appni qayta ishga tushirish uchun
                                        SystemChannels.platform.invokeMethod(
                                            'SystemNavigator.pop');
                                      },
                                      child: const Text('Qayta ochish'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                          return Center(
                            child: Text(
                              "Failed to load data",
                              style: const TextStyle(color: Colors.red),
                            ),
                          );
                        },
                      ),
                      if (_currentIndex == index)
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child: Container(
                            color: Colors.black.withOpacity(0.6),
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "City: $city",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.wifi_off, size: 80, color: Colors.red),
                    const SizedBox(height: 20),
                    const Text(
                      'Internetda muammo bor!',
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                    Text("Tekshirib ko'rin"),
                  ],
                ),
              ),
      ),
    );
  }
}
