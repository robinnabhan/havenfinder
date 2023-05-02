import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

// class DatePickerDemo extends StatefulWidget {
//   @override
//   _DatePickerDemoState createState() => _DatePickerDemoState();
// }

// class _DatePickerDemoState extends State<DatePickerDemo> {
//   late DateTime _selectedDate;

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2015, 8),
//       lastDate: DateTime(2101),
//     );

//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('DatePicker Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () => _selectDate(context),
//               child: Text('Select date'),
//             ),
//             SizedBox(height: 20.0),
//             Text(
//               _selectedDate == null
//                   ? 'No date selected'
//                   : 'Selected date: ${_selectedDate.toString()}',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyCountdownTimer extends StatefulWidget {
//   final DateTime endTime;

//   MyCountdownTimer({required this.endTime});

//   @override
//   _MyCountdownTimerState createState() => _MyCountdownTimerState();
// }

// class _MyCountdownTimerState extends State<MyCountdownTimer> {
//   late int _endTimeInSeconds;

//   @override
//   void initState() {
//     super.initState();
//     _endTimeInSeconds = widget.endTime.millisecondsSinceEpoch ~/ 1000;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CountdownTimer(
//       endTime: _endTimeInSeconds,
//       textStyle: TextStyle(fontSize: 30),
//       onEnd: () {
//         // Handle the timer ending here
//         print('Timer ended');
//       },
//     );
//   }
// }
// class FavoritePage extends StatefulWidget {
//   FavoritePage({required Key key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _FavoritePageState createState() => _FavoritePageState();
// }

// class _FavoritePageState extends State<FavoritePage> {
//   late DateTime _selectedDate;
//   late Timer _timer;
//   late Duration _countdown;

//   void _startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         _countdown = _selectedDate.difference(DateTime.now());
//         if (_countdown.inSeconds <= 0) {
//           _timer.cancel();
//         }
//       });
//     });
//   }

//   void _stopTimer() {
//     if (_timer != null) {
//       _timer.cancel();
//       setState(() {
//         _timer = null;
//         _countdown = null;
//       });
//     }
//   }

//   void _showDatePicker() async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: _selectedDate ?? DateTime.now(),
//         firstDate: DateTime.now(),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//         _countdown = _selectedDate.difference(DateTime.now());
//         _startTimer();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _showDatePicker,
//               child: Text('Select Date'),
//             ),
//             SizedBox(height: 16),
//             if (_selectedDate != null)
//               Text(
//                 'Selected Date: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}',
//                 style: TextStyle(fontSize: 20),
//               ),
//             SizedBox(height: 16),
//             if (_countdown != null)
//               Text(
//                 'Countdown: ${_countdown.inDays} days, ${_countdown.inHours % 24} hours, '
//                 '${_countdown.inMinutes % 60} minutes, ${_countdown.inSeconds % 60} seconds',
//                 style: TextStyle(fontSize: 20),
//               ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _stopTimer,
//         tooltip: 'Stop Timer',
//         child: Icon(Icons.stop),
//       ),
//     );
//   }
// }

class FavoritePage extends StatefulWidget {
  FavoritePage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late DateTime _selectedDate = DateTime.now();
  Timer? _timer;
  Duration? _countdown = Duration.zero;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _countdown = _selectedDate.difference(DateTime.now());
        if (_countdown!.inSeconds <= 0) {
          _timer!.cancel();
        }
      });
    });
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
      setState(() {
        _timer = null;
        _countdown = Duration.zero;
      });
    }
  }

  void _showDatePicker() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _countdown = _selectedDate.difference(DateTime.now());
        _startTimer();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _showDatePicker,
              child: Text('Select Date'),
            ),
            SizedBox(height: 16),
            if (_selectedDate != null)
              Text(
                'Selected Date: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}',
                style: TextStyle(fontSize: 20),
              ),
            SizedBox(height: 16),
            if (_countdown != null)
              Text(
                'Countdown: ${_countdown!.inDays} days, ${_countdown!.inHours % 24} hours, '
                '${_countdown!.inMinutes % 60} minutes, ${_countdown!.inSeconds % 60} seconds',
                style: TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _stopTimer,
        tooltip: 'Stop Timer',
        child: Icon(Icons.stop),
      ),
    );
  }
}
