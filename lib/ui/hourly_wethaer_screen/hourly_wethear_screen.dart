import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:n8_default_project/data/models/detail/one_call_data.dart';
import 'package:n8_default_project/repostory/repostory.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HourlyWethearScreen extends StatefulWidget {
  const HourlyWethearScreen(
      {super.key, required this.oneCallData, required this.index});
  final OneCallData oneCallData;
  final int index;

  @override
  State<HourlyWethearScreen> createState() => _HourlyWethearScreenState();
}

class _HourlyWethearScreenState extends State<HourlyWethearScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            getYeatAlgorithm(widget.oneCallData.daily[widget.index].dt),
            style: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ...List.generate(
            widget.oneCallData.hourly.length,
            (index) => Slidable(
              key: Key(widget.oneCallData.hourly[index].dt.toString()),
              endActionPane: ActionPane(
                motion: const BehindMotion(),
                children: [
                  SlidableAction(
                    flex: 4,
                    onPressed: (context) {},
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.waves_outlined,
                    label:
                        widget.oneCallData.hourly[index].windSpeed.toString(),
                  ),
                  SlidableAction(
                    flex: 4,
                    onPressed: (context) {},
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    icon: Icons.maximize_outlined,
                    label: widget.oneCallData.hourly[index].humidity.toString(),
                  ),
                ],
              ),
              child: ZoomTapAnimation(
                child: ListTile(
                  onTap: () {},
                  leading: SizedBox(
                    height: 50,
                    child: Image.asset(AppRepostory.getIcon(
                        widget.oneCallData.hourly[index].weather[0].icon)),
                  ),
                  trailing: Text(
                    getTimesTamp(widget.oneCallData.hourly[index].temp.toInt()),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w500),
                  ),
                  title: Text(
                      getYeatAlgorithm(widget.oneCallData.hourly[index].dt)),
                ),
              ),
            ),
          ),
        ])));
  }
}

String getYeatAlgorithm(int timestamp) {
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return (date.toString()).substring(0, 16);
}

String getTimesTamp(int? timestamp) {
  //"${(((widget.oneCallData.daily[widget.index].dailyTemp.day - 273.15) * 9 % 5) + 32).toInt()} °"
  if (timestamp == null) {
    return 'Null';
  }

  var graduc = (((timestamp! - 273.15) * 9 % 5) + 32);
  return ' ${graduc.toInt() - 23} °';
}
