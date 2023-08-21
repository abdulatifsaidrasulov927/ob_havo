import 'package:flutter/material.dart';
import 'package:n8_default_project/data/models/detail/one_call_data.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class TabElvateButton extends StatefulWidget {
  const TabElvateButton({super.key, required this.oneCallData});
  final OneCallData oneCallData;

  @override
  State<TabElvateButton> createState() => _TabElvateButtonState();
}

class _TabElvateButtonState extends State<TabElvateButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return SizedBox(
                height: 400,
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 100,
                    height: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      ZoomTapAnimation(
                        onTap: () {},
                        child: Container(
                          width: 180,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Text(
                              'Horly Forcast',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                      ZoomTapAnimation(
                        onTap: () {},
                        child: Container(
                          width: 180,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Text('wekly forcast',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    color: Colors.black,
                    width: double.infinity,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(10, (index) {
                          const SizedBox(
                            width: 10,
                          );
                          return Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              ZoomTapAnimation(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Container(
                                  height: 146,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Column(children: [
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    Text(
                                        overflow: TextOverflow.ellipsis,
                                        widget.oneCallData.timezone,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    const Icon(
                                      Icons.cloud,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      'S $index',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                  ]),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              )
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ]),
              );
            });
      },
      child: const Text(
        '                                                       ',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
