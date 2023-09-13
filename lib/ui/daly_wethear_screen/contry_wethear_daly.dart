import 'package:flutter/material.dart';
import 'package:n8_default_project/data/models/detail/one_call_data.dart';
import 'package:n8_default_project/repostory/repostory.dart';
import 'package:n8_default_project/ui/hourly_wethaer_screen/hourly_wethear_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ContryWethearDaly extends StatefulWidget {
  const ContryWethearDaly(
      {super.key, required this.oneCallData, required this.index});
  final OneCallData oneCallData;
  final int index;
  @override
  State<ContryWethearDaly> createState() => _ContryWethearDalyState();
}

class _ContryWethearDalyState extends State<ContryWethearDaly> {
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HourlyWethearScreen(
              oneCallData: widget.oneCallData,
              index: widget.index,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Center(
        child: Container(
          height: 195,
          width: 350,
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(26),
                  bottomLeft: Radius.circular(26),
                  topLeft: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: 340,
                height: 185,
                // #3 3.65%, # 99.48%
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                      const Color(0xFF267DE5),
                      const Color(0xFF362A84),
                      const Color(0xFF5936B4).withOpacity(0.9)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            GetGraducDaly(widget
                                .oneCallData.daily[widget.index].dailyTemp.day
                                .toInt()),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 60,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            DateFormatForWethearForDaly(
                                widget.oneCallData.daily[widget.index].dt),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w200),
                          ),
                        ],
                      ),
                      ////////////////////////////////////////////
                      Column(
                        children: [
                          SizedBox(
                            height: 120,
                            child: Image.asset(AppRepostory.getIcon(widget
                                .oneCallData
                                .daily[widget.index]
                                .weather[0]
                                .icon)),
                          ),
                        ],
                      ),
                      ////////////////////////////////////////////
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.oneCallData.timezone,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w200),
                      ),
                      Text(
                        widget.oneCallData.daily[widget.index].weather[0]
                            .description,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w200),
                      ),
                    ],
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String DateFormatForWethearForDaly(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return (date.toString()).substring(0, 16);
  }

  String GetGraducDaly(int? timestamp) {
    //"${(((widget.oneCallData.daily[widget.index].dailyTemp.day - 273.15) * 9 % 5) + 32).toInt()} °"
    if (timestamp == null) {
      return 'Null';
    }

    var graduc = (((timestamp - 273.15) * 9 % 5) + 32);
    return ' ${graduc.toInt()} °';
  }
}
