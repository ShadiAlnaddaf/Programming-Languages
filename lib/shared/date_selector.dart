import 'package:consulting/models/register_model/expert_register_request_model.dart';
import 'package:consulting/shared/default_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomDateSelector extends StatelessWidget {
  CustomDateSelector({required this.onChanged, Key? key}) : super(key: key);
  Rx<List<Day>> days = Rx(<Day>[].obs);
  Function(Rx<List<Day>>) onChanged;
  RxInt selectedDay = RxInt(1);
  RxInt selectedStart = RxInt(0);
  RxInt selectedEnd = RxInt(0);
  List<DropdownMenuItem<RxInt>> day = [
    DropdownMenuItem(value: RxInt(1), child: const Text('Sunday')),
    DropdownMenuItem(value: RxInt(2), child: const Text('Monday')),
    DropdownMenuItem(value: RxInt(3), child: const Text('Tuesday')),
    DropdownMenuItem(value: RxInt(4), child: const Text('Wednesday')),
    DropdownMenuItem(value: RxInt(5), child: const Text('Thursday')),
    DropdownMenuItem(value: RxInt(6), child: const Text('Friday')),
    DropdownMenuItem(value: RxInt(7), child: const Text('Saturday')),
  ];
  List<DropdownMenuItem<RxInt>> time = [
    DropdownMenuItem(value: RxInt(0), child: const Text('0')),
    DropdownMenuItem(value: RxInt(1), child: const Text('1')),
    DropdownMenuItem(value: RxInt(2), child: const Text('2')),
    DropdownMenuItem(value: RxInt(3), child: const Text('3')),
    DropdownMenuItem(value: RxInt(4), child: const Text('4')),
    DropdownMenuItem(value: RxInt(5), child: const Text('5')),
    DropdownMenuItem(value: RxInt(6), child: const Text('6')),
    DropdownMenuItem(value: RxInt(7), child: const Text('7')),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: Get.width * 0.25,
                child: const Text(
                  'Day', textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: DefaultColors.c3),
                ),
              ),
              SizedBox(
                width: Get.width * 0.25,
                child: const Text(
                  'from', textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: DefaultColors.c3),
                ),
              ),
              SizedBox(
                width: Get.width * 0.25,
                child: const Text(
                  'end', textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: DefaultColors.c3),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(children: [
          Obx(() {
            return ListView.builder(

              primary: false,
              shrinkWrap: true,
              itemCount: days.value.length,
              itemBuilder: (context, index) {
                return DayRow(day: days.value[index]);
              },
            );
          }),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                  color: DefaultColors.c2,
                  child: const Icon(
                    Icons.add,
                    color: DefaultColors.c1,
                    size: 40.0,
                  ),
                  onPressed: () {
                    Get.defaultDialog(
                      title: 'add day',
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                                () => DropdownButton<RxInt>(
                                value: selectedDay,
                                items: day,
                                onChanged: (val) {
                                  selectedDay.value = val!.value;
                                }),
                          ),
                          Obx(() => DropdownButton<RxInt>(
                              value: selectedStart,
                              items: time,
                              onChanged: (val) {
                                selectedStart.value = val!.value;
                              })),
                          Obx(() => DropdownButton<RxInt>(
                              value: selectedEnd,
                              items: time,
                              onChanged: (val) {
                                selectedEnd.value = val!.value;
                              })),
                        ],
                      ),
                      onConfirm: () {
                        bool isSelected = true;
                        for (var e in days.value) {
                          if (e.dayId == selectedDay.value) {
                            isSelected = !isSelected;
                            Get.back();
                            Get.snackbar('Wrong', 'this day is selected');
                          }
                        }
                        if (isSelected) {
                          days.value.add(Day(
                              dayId: selectedDay.value,
                              startTime: selectedStart.value,
                              endTime: selectedEnd.value));
                          onChanged(days);
                          Get.back();
                          debugPrint('back and add is done');
                        }
                      },
                    );
                  }),
              MaterialButton(
                color: DefaultColors.c2,
                onPressed: () {
                  Get.defaultDialog(
                    title: 'remove day',
                    content: Obx(
                          () => DropdownButton<RxInt>(
                          value: selectedDay,
                          items: day,
                          onChanged: (val) {
                            selectedDay.value = val!.value;
                          }),
                    ),
                    onConfirm: () {
                      bool isSelected = false;
                      for (var e in days.value) {
                        if (e.dayId == selectedDay.value) {
                          isSelected = !isSelected;
                        }
                      }
                      if (!isSelected) {
                        Get.back();
                        Get.snackbar('Wrong', 'this day is not selected');
                      } else {
                        days.value
                            .removeWhere((e) => e.dayId == selectedDay.value);
                        onChanged(days);
                        Get.back();
                        debugPrint('back and add is done');
                        debugPrint(days.value.toString());
                      }
                    },
                  );
                },
                child: const Icon(
                  Icons.remove,
                  color: DefaultColors.c1,
                  size: 40.0,
                ),
              ),
            ],
          ),
        ],)
      ],
    );
  }
}

// ignore: must_be_immutable
class DayRow extends StatelessWidget {
  DayRow({required this.day, Key? key}) : super(key: key);
  Day day;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: Get.width * 0.25,
              child: Text(
                getDayOfWeek(day.dayId),
                textAlign: TextAlign.center,
              )),
          SizedBox(
              width: Get.width * 0.25,
              child: Text(
                day.startTime.toString(),
                textAlign: TextAlign.center,
              )),
          SizedBox(
              width: Get.width * 0.25,
              child: Text(
                day.endTime.toString(),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}

String getDayOfWeek(int day) {
  switch (day) {
    case 1:
      return 'Sunday';
    case 2:
      return 'Monday';
    case 3:
      return 'Tuesday';
    case 4:
      return 'Wednesday';
    case 5:
      return 'Thursday';
    case 6:
      return 'Friday';
    case 7:
      return 'Saturday';
    default:
      return 'Invalid day';
  }
}
