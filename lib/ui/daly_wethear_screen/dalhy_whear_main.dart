import 'package:flutter/material.dart';
import 'package:n8_default_project/data/models/detail/one_call_data.dart';
import 'package:n8_default_project/ui/daly_wethear_screen/contry_wethear_daly.dart';

class DalyWthearMain extends StatefulWidget {
  const DalyWthearMain({super.key, required this.oneCallData});
  final OneCallData oneCallData;
  @override
  State<DalyWthearMain> createState() => _DalyWthearMainState();
}

class _DalyWthearMainState extends State<DalyWthearMain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(
                  widget.oneCallData.daily.length,
                  (index) {
                    return ContryWethearDaly(
                      oneCallData: widget.oneCallData,
                      index: index,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String DateFormatForWethear(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return (date.toString()).substring(11, 16);
  }
}
