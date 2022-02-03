import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_signin_example/models/space.dart';
import 'package:google_signin_example/theme.dart';
import 'package:google_signin_example/widget/date_card.dart';
import 'package:google_signin_example/widget/selectable_box.dart';

class SelectDatePage extends StatefulWidget {
  final Space space;

  SelectDatePage(this.space);

  @override
  _SelectDatePageState createState() => _SelectDatePageState();
}

class _SelectDatePageState extends State<SelectDatePage> {
  List<DateTime> dates;
  DateTime selectedDate;
  int selectedTime;
  Field selectedField;
  bool isValid = false;

  @override
  void initState() {
    super.initState();

    dates =
        List.generate(31, (index) => DateTime.now().add(Duration(days: index)));
    selectedDate = dates[0];
  }



  @override
  Widget build(BuildContext context) { 

  return Scaffold(
      body: Stack(
      children: <Widget>[
      SafeArea(
        child: Container(color: Color(0xffffffff)),
      ),
      ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Container(
                      child: InkWell(
                        onTap:() {
                          Navigator.pop(context);
                          },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            color: Colors.redAccent,
                          ),
                          child: Image.asset(
                            'assets/btn_back.png',
                            width: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, right: 20),
                    child: Row(
                      children: <Widget> [
                        Container(
                          margin: EdgeInsets.only(right: 16),
                          width:
                              MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            widget.space.name,
                            style: blackTextStyle.copyWith(fontSize: 20),
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(widget.space.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              
              // note: CHOOSE DATE
              Container(
              margin: EdgeInsets.only(top: 20 ,bottom: 24),
              height: 90,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dates.length,
                  itemBuilder: (_, index) => Container(
                        margin: EdgeInsets.only(
                            left: (index == 0) ? 20 : 0,
                            right: (index < dates.length - 1) ? 16 : 20),
                        child: DateCard(
                          dates[index],
                          isSelected: selectedDate == dates[index],
                          onTap: () {
                            setState((){
                              selectedDate = dates[index];
                            });   
                          },
                        ),
                      )
                    ),
                  ),
                // note: CHOOSE FIELD
                generateTimeTable(),
                // note : Next Button
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: 
                      (isValid) ? orangeColor : Color(0xffe4e4e4),
                    child: Icon(
                      Icons.arrow_forward,
                      color: isValid ? whiteColor : Color(0xffbebebe),
                      ),
                    onPressed: (){},
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Column generateTimeTable() {
    List<int> schedule = List.generate(17, (index) => 8 + index);
    List<Widget> widgets = [];

    for (var field in fields) {
      
      widgets.add(Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 16),
          child:
              Text(field.name, style: blackTextStyle.copyWith(fontSize: 16))));

      widgets.add(
        Container(
          height: 40,
          margin: EdgeInsets.only(bottom: 20),
          child: ListView.builder(
            itemCount: schedule.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => Container(
              margin: EdgeInsets.only(
                  left: (index == 0) ? 20 : 0,
                  right: (index < schedule.length - 1) ? 16 : 20),
              child: SelectableBox(
                "${schedule[index]}:00",
                height: 40,
                isSelected:
                    selectedField == field && selectedTime == schedule[index],
                isEnabled: schedule[index] > DateTime.now().hour ||
                    selectedDate.day != DateTime.now().day,
                onTap: () {
                  setState(() {
                    selectedField = field;
                    selectedTime = schedule[index];
                    isValid = true;
                  });
                },
              ),
            ),
          ),
        )
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
    }
}