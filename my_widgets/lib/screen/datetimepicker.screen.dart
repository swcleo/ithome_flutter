import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<DateTime> showCustomDateTimePickerDialog({
  required BuildContext context,
  required DateTime initialDate,
}) async {
  return await showDialog(
    context: context,
    builder: (ctx) {
      return Dialog(child: CustomDateTimePicker(initialDate: initialDate));
    },
  );
}

class CustomDateTimePicker extends StatefulWidget {
  final DateTime initialDate;

  CustomDateTimePicker({required this.initialDate});

  @override
  _CustomDateTimePicker createState() => _CustomDateTimePicker();
}

class _CustomDateTimePicker extends State<CustomDateTimePicker> {
  late DateTime selectedDateTime;

  @override
  initState() {
    super.initState();
    selectedDateTime = this.widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CalendarDatePicker(
          initialDate: selectedDateTime,
          firstDate: DateTime(2000, 1, 1),
          lastDate: DateTime(2040, 12, 31),
          onDateChanged: (DateTime date) {
            setState(() {
              selectedDateTime = date;
            });
          },
        ),
        ElevatedButton(
          child: Text("OK"),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          onPressed: () {
            Navigator.of(context).pop(selectedDateTime);
          },
        )
      ],
    );
  }
}

class DateTimePickerScreen extends StatefulWidget {
  @override
  _DateTimePickerScreen createState() => _DateTimePickerScreen();
}

class _DateTimePickerScreen extends State<DateTimePickerScreen> {
  final dateFormatter = DateFormat('yyyy-MM-dd');

  late DateTime selectedDateTime;
  late DateTimeRange selectedDateTimeRange;
  late TimeOfDay selectedTimeOfDay;
  late DateTime selectedCustomDateTime;

  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    selectedDateTime = now;
    selectedDateTimeRange = DateTimeRange(
      start: now,
      end: now,
    );
    selectedTimeOfDay = TimeOfDay.fromDateTime(now);
    selectedCustomDateTime = now;
  }

  @override
  Widget build(BuildContext context) {
    var labelOfDateTime = Container(
      height: 100.0,
      child: Center(
        child: Text(dateFormatter.format(selectedDateTime)),
      ),
    );

    var datePickButton = ElevatedButton(
      onPressed: () async {
        var result = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000, 01),
          lastDate: DateTime(2021, 12),
        );

        if (result != null) {
          setState(() {
            selectedDateTime = result;
          });
        }
      },
      child: const Text('日期選擇器'),
    );

    var labelOfDateTimeRange = Container(
      height: 100.0,
      child: Center(
        child: Text(
            "${dateFormatter.format(selectedDateTimeRange.start)} 至 ${dateFormatter.format(selectedDateTimeRange.end)}"),
      ),
    );

    var dateRangePickButton = ElevatedButton(
      onPressed: () async {
        var result = await showDateRangePicker(
          context: context,
          firstDate: DateTime(2021, 01),
          lastDate: DateTime(2021, 12),
        );

        if (result != null) {
          setState(() {
            selectedDateTimeRange = result;
          });
        }
      },
      child: const Text('日期區間選擇器'),
    );

    var labelOfTime = Container(
      height: 100.0,
      child: Center(
        child: Text(selectedTimeOfDay.toString()),
      ),
    );

    var timePickButton = ElevatedButton(
      onPressed: () async {
        var result = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          initialEntryMode: TimePickerEntryMode.input,
        );

        if (result != null) {
          setState(() {
            selectedTimeOfDay = result;
          });
        }
      },
      child: const Text('時間選擇器'),
    );

    var customDateTimePickButton = ElevatedButton(
      onPressed: () async {
        var result = await showCustomDateTimePickerDialog(
          context: context,
          initialDate: selectedCustomDateTime,
        );

        setState(() {
          selectedCustomDateTime = result;
        });
      },
      child: const Text('客制化日期選擇器'),
    );

    var labelOfCustomDateTime = Container(
      height: 100.0,
      child: Center(
        child: Text(dateFormatter.format(selectedCustomDateTime)),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("DateTimePicker")),
      body: Center(
        child: Column(
          children: [
            labelOfDateTime,
            datePickButton,
            labelOfDateTimeRange,
            dateRangePickButton,
            labelOfTime,
            timePickButton,
            labelOfCustomDateTime,
            customDateTimePickButton
          ],
        ),
      ),
    );
  }
}
