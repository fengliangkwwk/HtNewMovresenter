import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/picker_style.dart';

class HTClassPersondataPage extends StatefulWidget {
  const HTClassPersondataPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HTClassPersondataPage> createState() => _HTClassPersondataPageState();
}

class _HTClassPersondataPageState extends State<HTClassPersondataPage> {
  var htVarSelectedBirth = "";
  var htVarSelectedGender = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(backgroundColor: Color(0xff1A1C21),title: Text("Personal Data",style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w600)),centerTitle: true,leadingWidth:24.0,leading: Image.asset("image/icon_setting_back_w.png",width: 24.0,height: 24.0,fit: BoxFit.scaleDown)),
        body: Container(padding:EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0), width:double.infinity,child: Column(children: [
          Container(height: 15.0),
          Row(children: [
            Text("Profile image",style: TextStyle(fontSize: 14.0,color: Color(0xff828386))),
            Spacer(),
            Container(width: 40.0, height: 40.0, decoration: BoxDecoration(image:DecorationImage(image:AssetImage("image/icon_setting_header_def.png")),borderRadius: BorderRadius.circular(20.0),border: Border.all(color: Colors.white))),
          ]),
          Container(margin:EdgeInsets.only(top: 14.5,bottom: 14.5),color: Color(0xff2D2F33),height: 0.5),
          Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
            Text("Name",style: TextStyle(fontSize: 14.0,color: Color(0xff828386))),
            Container(height: 15.0),
            Row(children: [
              Text("Visitor12357",style: TextStyle(fontSize: 14.0,color: Color(0xff828386))),
              Spacer(),
              Image.asset("image/icon_setting_edit.png",width: 18.0, height: 18.0),
            ]),
          ]),
          Container(margin:EdgeInsets.only(top: 14.5,bottom: 14.5),color: Color(0xff2D2F33),height: 0.5),
          Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
            Text("Gender",style: TextStyle(fontSize: 14.0,color: Color(0xff828386))),
            Container(height: 15.0),
            Row(children: [
              Text(htVarSelectedGender==""?"Tap to Edit Gender":htVarSelectedGender,style: TextStyle(fontSize: 14.0,color: Color(0xff828386))),
              Spacer(),
              GestureDetector(child:Image.asset("image/icon_setting_edit.png",width: 18.0, height: 18.0),onTap: (){
                  Pickers.showSinglePicker(context,data: ['Female', 'Male'],pickerStyle:PickerStyle(
                    backgroundColor:Colors.black,
                    textColor:Colors.white,
                    textSize:20.0,
                    headDecoration: BoxDecoration(color: Colors.black),
                    title: Container(color: Colors.black),
                    commitButton:Text("OK",style: TextStyle(color: Colors.white,fontSize: 15.0)),
                    cancelButton:Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 15.0)),
                  ),onConfirm: (val,index){
                    setState(() {
                      htVarSelectedGender = val;
                    });
                  });
              }),
            ]),
          ]),
          Container(margin:EdgeInsets.only(top: 14.5,bottom: 14.5),color: Color(0xff2D2F33),height: 0.5),
          Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
            Text("Date of Birth",style: TextStyle(fontSize: 14.0,color: Color(0xff828386))),
            Container(height: 15.0),
            Row(children: [
              Text(htVarSelectedBirth==""?"Tap to edit DoB":htVarSelectedBirth,style: TextStyle(fontSize: 14.0,color: Color(0xff828386))),
              Spacer(),
              GestureDetector(child:Image.asset("image/icon_setting_edit.png",width: 18.0, height: 18.0),onTap: (){
                DatePicker.showDatePicker(context,onConfirm: (dateTime,selectedIndex){
                  setState(() {
                    htVarSelectedBirth = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
                  });
                },pickerTheme:DateTimePickerTheme(backgroundColor: Colors.black,confirm: Text("OK",style: TextStyle(color: Colors.white,fontSize: 15.0)),cancel: Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 15.0)),itemTextStyle: TextStyle(color: Colors.white,fontSize: 20.0)));
              }),
            ]),
          ]),
          Container(margin:EdgeInsets.only(top: 14.5,bottom: 14.5),color: Color(0xff2D2F33),height: 0.5),
          Spacer(),
          Container(alignment:Alignment.center,height:44.0,margin: EdgeInsets.only(bottom: 20.0),child: Text("Logout",style: TextStyle(fontSize: 15.0,color:Colors.white),),decoration: BoxDecoration(color:Color(0xfff4473c),borderRadius: BorderRadius.circular(6.0)),)
        ])));
  }
}