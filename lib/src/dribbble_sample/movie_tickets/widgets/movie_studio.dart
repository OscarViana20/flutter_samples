import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/models/movie_tickets_model.dart';

const Color _colorButtons = Color(0xFF5E01FF);
const Color _colorPanel = Color(0xFF0F01FF);

class MovieStudio extends StatefulWidget {
  
  MovieStudio({
    super.key,
    required this.currentPage
  });

  final int currentPage;

  @override
  State<MovieStudio> createState() => _MovieStudioState();
}

class _MovieStudioState extends State<MovieStudio> {

  int selectedHour = 0;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_colorPanel.withOpacity(0.5), Color(0xFF0B0F14)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.9],
            tileMode: TileMode.clamp
          ),
          color: _colorButtons.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10)
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Studio #1", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16.0)),
            Column(children: _timesWidget()),
            SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }

  List<Widget> _timesWidget() {
    final times = popularList[widget.currentPage].times;

    List<List<TimeDay>> rows = [];
    List<TimeDay> columnNumbers = [];

    int column = 0;
    for (int i = 0; i < times.length; i++) {
      columnNumbers.add(times[i]);
      if (column == 2) {
        rows.add(columnNumbers);
        columnNumbers = [];
        column = 0;
      } else {
        column++;
      }
    }

    return rows.map(
      (columns) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: columns.map((timeDay) {
          return Padding(
            padding: EdgeInsets.only(top: 10),
            child: GestureDetector(
              onTap: () {
                if (!timeDay.isAll && selectedHour != timeDay.index) {
                  setState(() {                    
                    selectedHour = timeDay.index;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: timeDay.isAll ? Colors.blueGrey.shade700.withOpacity(0.7) : (selectedHour == timeDay.index ? _colorButtons : null),
                  border: (timeDay.isAll || selectedHour == timeDay.index) ? null : Border.all(width: 0.5, color: Colors.grey.shade300),
                  //boxShadow: shadows,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(timeDay.hour, style: TextStyle(color: Colors.white, fontSize: 16.0)),
              ),
            ),
          );
        }).toList(),
      ),
    )
    .toList();
  }
}