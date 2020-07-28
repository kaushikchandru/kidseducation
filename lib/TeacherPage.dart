import 'package:flutter/material.dart';
import 'package:kidsonlineeducation/ColorScheme.dart';

class TeacherPage extends StatefulWidget {
  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  int selectedDate = DateTime.now().day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe7f4f5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: 200,
                height: 260,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 200,
                        height: 240,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('asset/images/iconBg.png'),
                            fit: BoxFit.contain
                          )
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 20,
                      child: Hero(
                        tag: "boy1Big",
                        child: Container(
                          height: 220,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('asset/images/boy1Big.png')
                            )
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mr. Peter Parker", style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'product'
                      ),),
                      SizedBox(height: 5,),
                      Text("English Teacher", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: darkBlue,
                        fontFamily: 'circe'
                      ),),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            child: RotatedBox(
                              quarterTurns: 2,
                              child: Icon(
                                Icons.star,
                                color: darkBlue,
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text("4.9 Star Rating", style: TextStyle(
                            fontFamily: 'circe'
                          ),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('asset/images/palette.png')
                              )
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text("5 Years Experience", style: TextStyle(
                              fontFamily: 'circe'
                          ),)
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(30),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About Peter", style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                      fontFamily: 'product'
                    ),),
                    SizedBox(height: 10,),
                    Text("I have been a teacher as well as a director in the child care setting since the early 2000’s. I love working with children and watching them grow. My pholosophy is children learn through play with teacher guidance and children choices.", style: TextStyle(
                      fontFamily: 'circe',
                      fontSize: 12,
                    ),),
                    SizedBox(height: 20,),
                    Text("Courses by Peter", style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        fontFamily: 'product'
                    ),),
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            courseWidget("icon1", "Young \nLearners", "GRADE 0-1", lightBlue, darkBlue),
                            courseWidget("icon2", "Creative \nBloomers", "GRADE 0-2", yellow, Color(0xff4d4d4d)),
                            courseWidget("icon3", "Early \nAchievers", "GRADE 0-3", pink, Color(0xff4a155f))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Availability", style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        fontFamily: 'product'
                    ),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for(int i=0; i < 7; i++)
                          dateWidget(i),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              timeSlotWidget("11:00 AM", false),
                              timeSlotWidget("12:00 PM", false),
                              timeSlotWidget("01:00 PM", false),
                              timeSlotWidget("03:00 PM", true),
                            ],
                          ),
                          Row(
                            children: [
                              timeSlotWidget("04:00 PM", false),
                              timeSlotWidget("06:00 PM", false),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(bottom: 20, right: 30, left: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: darkBlue
              ),
              child: Center(
                child: Text("Make an Appoinment", style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'circe',
                  fontWeight: FontWeight.w700,
                  fontSize: 18
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }
  Container timeSlotWidget(String time, bool isSelected)
  {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: (isSelected) ? pink : lightBlue.withOpacity(0.5),
      ),
      child: Row(
        children: [
          Icon(
            Icons.watch_later,
            size: 13,
            color: Colors.grey,
          ),
          SizedBox(width: 3,),
          Text(time, style: TextStyle(
            fontSize: 10,
            fontFamily: 'circe'
          ),)
        ],
      ),
    );
  }
  InkWell dateWidget(int i)
  {
    DateTime tempDate = DateTime.now().add(Duration(days: i));
    return InkWell(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.all(2),
        height: 60,
        width: MediaQuery.of(context).size.width*0.11,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: (selectedDate == tempDate.day) ? yellow : lightBlue.withOpacity(0.5),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: 10
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(dayValue(tempDate.weekday), style: TextStyle(
                fontSize: 10
              ),),
              Text(tempDate.day.toString(), style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),)
            ],
          ),
        ),
      ),
    );

  }
  String dayValue(int weekDayVal)
  {
    List<String> dayString = ['', "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", 'Sun'];
    return dayString[weekDayVal];
  }
  Container courseWidget(String img, String name, String grade, Color color, Color textColor)
  {
    return Container(
      height: 100,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: color
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(name, style: TextStyle(
                  color: textColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w500
                ),),
                Text(grade, style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11
                ),)
              ],
            ),
          ),
          Container(
            height: 90,
            width: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/images/$img.png'),
                fit: BoxFit.contain
              )
            ),
          )
        ],
      ),
    );
  }
}
