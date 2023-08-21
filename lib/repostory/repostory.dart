import 'package:n8_default_project/utils/icons.dart';

class AppRepostory {
  static String getIcon(String searchIcon) {
    switch (searchIcon) {
      case "01n":
        {
          return AppImages.moon;
        }
      case "02n":
        {
          return AppImages.fewClouds;
        }
      case "03n":
        {
          return AppImages.clody;
        }
      case "04n":
        {
          return AppImages.brokenSky;
        }
      case "09n":
        {
          return AppImages.wethear;
        }
      case "10n":
        {
          return AppImages.rain;
        }
      case "11n":
        {
          return AppImages.scatteredTHunderstorms;
        }
      case "13n":
        {
          return AppImages.snow;
        }
      case "50n":
        {
          return AppImages.mist;
        }
      case "01d":
        {
          return AppImages.sun;
        }
      case "02d":
        {
          return AppImages.fewClouds;
        }
      case "03d":
        {
          return AppImages.clody;
        }
      case "04d":
        {
          return AppImages.brokenSky;
        }
      case "09d":
        {
          return AppImages.wethear;
        }
      case "10d":
        {
          return AppImages.rain;
        }
      case "11d":
        {
          return AppImages.scatteredTHunderstorms;
        }
      case "13d":
        {
          return AppImages.snow;
        }
      case "50d":
        {
          return AppImages.mist;
        }
    }
    return AppImages.snow;
  }
}
