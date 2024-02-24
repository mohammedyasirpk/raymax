import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../constents.dart';

class TableContainerWithSubtitle extends StatelessWidget {
    const TableContainerWithSubtitle(
      {Key? key, required this.subtitleText, })
      : super(key: key);

  final String subtitleText;
   static const style = TextStyle(fontWeight: FontWeight.w400,fontSize: 14);
   static const headingStyle =  TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 14);

  final TableRow _tableRowHeading = const TableRow(
    decoration: BoxDecoration(color: Colors.green),
    children: [Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("BATTERY TYPE/Model",style:headingStyle),
    
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("C10/C20@27 °C",style:headingStyle),
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("STANDARD WARRANTY",style:headingStyle),
  ),
    Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("PRO-RATED WARRANTY",style:headingStyle),
  )]
  );

//////////////////////////////////////////////
   


    final TableRow _tableRow1 =  const TableRow(children: [Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("RX10A-IT",style: style,),
    
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("110 A/H",style: style,),
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("36 Months*",style: style,),
  ),
   Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("37 TO 72 Months*",style: style,),
  )]
  );
////////////////////////////////////////
  final TableRow _tableRow2 = const TableRow(children: [Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("RX16A-IT",style: style,),
    
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("160 A/H",style: style,),
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("36 Months*",style: style,),
  ),
   Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("37 TO 72 Months*",style: style,),
  )]
  );
////////////////////////////////////////////////

    final TableRow _tableRow3 = const TableRow(children: [Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("RX16B-IT",style: style,),
    
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("160 A/H",style: style,),
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("36 Months*",style: style,),
  ),
   Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("37 TO 72 Months*",style: style,),
  )]
  );
//////////////////////////////////////////////

    final TableRow _tableRow4 = const TableRow(children: [Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("RX21B-IT",style: style,),
    
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("210 A/H",style: style,),
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("36 Months*",style: style,),
  ),
   Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("37 TO 72 Months*",style: style,),
  )]
  );



    final TableRow _tableRow5 = const TableRow(children: [Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("RX16 C-IT",style: style,),
    
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("160 A/H",style: style,),
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("60 Months*",style: style,),
  ),
   Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("61 TO 100 Months*",style: style,),
  )]
  );


    final TableRow _tableRow6 = const TableRow(children: [Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("RX21 C-IT",style: style,),
    
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("210 A/H",style: style,),
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("60 Months*",style: style,),
  ),
   Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("61 TO 100 Months*",style: style,),
  )]
  );




    final TableRow _tableRow7 = const TableRow(children: [Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(""),
    
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(""),
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(""),
  ),
   Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(""),
  )]
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(subtitleText,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, fontSize: 16, color: kbyoncolor3)),
        const SizedBox(
          height: 10,
        ),
       Table(
        border: TableBorder.all(),
        children: [
          _tableRowHeading,
          _tableRow1,
          _tableRow2,
          _tableRow3,
          _tableRow4,
          _tableRow5,
          _tableRow6,
          _tableRow7

       
       ],),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}