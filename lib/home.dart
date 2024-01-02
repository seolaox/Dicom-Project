import 'dart:convert';

import 'package:dicom_project/components/appbar.dart';
import 'package:dicom_project/components/deciperbutton.dart';
import 'package:dicom_project/components/drawerpage.dart';
import 'package:dicom_project/components/inspectionbutton.dart';
import 'package:dicom_project/components/vertifybutton.dart';
import 'package:dicom_project/static.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Home extends StatefulWidget {
  final Function(ThemeMode) onChangeTheme;
  const Home({Key? key, required this.onChangeTheme}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime? selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();
  late String formattedDate;
  late List<String> inspectionItems;
  late String inspectionDropDownValue;
  late List<String> vertifyItems;
  late String vertifyDropDownValue;
    late List<String> deciperItems;
  late String deciperDropDownValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formattedDate = DateFormat('yyyy.MM').format(focusedDay);
    inspectionItems = ['선택해주세요', 'AS', 'AU', 'BI', 'CD', 'CF','AS', 'AU', 'BI', 'CD', 'CF','ㅁㅁ','AS', 'AU', 'BI', 'CD', 'CF','ㅁㅁ','AS', 'AU', 'BI', 'CD', 'CF','ㅁㅁ'];
    inspectionDropDownValue = '선택해주세요';
    vertifyItems = ['선택해주세요', 'Not Requested', 'Request Completed'];
    vertifyDropDownValue = '선택해주세요';
    deciperItems = [ '판독 상태', '읽지 않음', '열람중', '예비 판독', '판독'];
    deciperDropDownValue = '판독 상태';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        title: const AppbarTitle(),
      ),
      drawer: DrawerPage(),

      body:SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TableCalendar(
                        daysOfWeekHeight: 50,
                        firstDay: DateTime.utc(2000, 1, 1),
                        lastDay: DateTime.utc(2099, 12, 31),
                        locale: "ko_KR",
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                        ),
                        focusedDay: focusedDay,
                        onDaySelected:
                            (DateTime selectedDay, DateTime focusedDay) {
                          setState(() {
                            this.selectedDay = selectedDay;
                            this.focusedDay = focusedDay;
                          });
                        },
                        calendarBuilders: CalendarBuilders(
                          markerBuilder: (context, day, events) {
                            final eventCount = events.length;
                            if (eventCount > 0) {
                              return Positioned(
                                bottom: 0,
                                child: Row(
                                  children: List.generate(
                                    eventCount,
                                    (index) => Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromARGB(255, 172, 148, 242),
                                      ),
                                      width: 10,
                                      height: 10,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return null;
                            }
                          },
                        ),
                        selectedDayPredicate: (DateTime day) {
                          return isSameDay(selectedDay ?? DateTime.now(), day);
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        '검사일자',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(130, 35),
                            ),
                            label: Text(''),
                            icon: Row(
                              children: [
                                Text(
                                  ' 1990.01  ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(Icons.calendar_today),
                              ],
                            ),
                          ),
                          Text(
                            ' To ',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(135, 35),
                            ),
                            label: Text(''),
                            icon: Row(
                              children: [
                                Text(
                                  ' $formattedDate  ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(Icons.calendar_today),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '검사장비',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 310,
                        child: InspectionButton(
                            items: inspectionItems,
                            dropDownValue: inspectionDropDownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                inspectionDropDownValue = newValue!;
                              });
                            }),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'vertify',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 310,
                        child: VerifyButton(
                            items: vertifyItems,
                            dropDownValue: vertifyDropDownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                vertifyDropDownValue = newValue!;
                              });
                            }),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              // 버튼이 클릭되었을 때 수행할 동작
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(140, 35),
                            ),
                            label: Text(''),
                            icon: Row(
                              children: [
                                Text(
                                  '    조회  ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(Icons.arrow_circle_right_outlined),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              // 버튼이 클릭되었을 때 수행할 동작
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(140, 35),
                            ),
                            label: Text(''),
                            icon: Row(
                              children: [
                                Text(
                                  '    재설정  ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(Icons.restart_alt),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text('검색'),
                    Flexible(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: '환자 아이디',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: '환자 이름',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: DeciperButton(
                            items: deciperItems,
                            dropDownValue: deciperDropDownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                deciperDropDownValue = newValue!;
                              });
                            }),),
                            Flexible(
                              flex: 1,
                            child: TextButton(
                              onPressed: () {
                                
                              }, 
                              child: Text('전체'))),
                            Flexible(
                              flex: 1,
                            child: TextButton(
                              onPressed: () {
                                
                              }, 
                              child: Text('1일'))),
                            Flexible(
                              flex: 1,
                            child: TextButton(
                              onPressed: () {
                                
                              }, 
                              child: Text('3일'))),
                            Flexible(
                              flex: 1,
                            child: TextButton(
                              onPressed: () {
                                
                              }, 
                              child: Text('1주일'))),
                            Flexible(
                              flex: 1,
                            child: TextButton(
                              onPressed: () {
                                
                              }, 
                              child: Text('검색'))),
                              
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    
  }



}
