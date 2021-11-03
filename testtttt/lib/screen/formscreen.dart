import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:testtttt/model/student.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  Student myStudent = Student('fname', 'lname', 'email', 'score');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แบบฟอร์มบันทึกคะแนนสอบ"),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ชื่อ",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      validator: RequiredValidator(errorText: "กรุณาป้อนชื่อ"),
                      onSaved: (fname){
                        myStudent.fname = fname!;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "นามสกุล",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      validator: RequiredValidator(errorText: "กรุณาป้อนนามสกุล"),
                      onSaved: (lname){
                        myStudent.lname = lname!;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "อีเมล",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      validator: RequiredValidator(errorText: "กรุณาป้อนอีเมล"),
                      onSaved: (email){
                        myStudent.email = email!;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "คะแนนสอบ",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      validator: RequiredValidator(errorText: "กรุณาป้อนคะแนน"),
                      onSaved: (score){
                        myStudent.score = score!;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          child: Text(
                            "บันทึกข้อมูล",
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            if(formKey.currentState!.validate()){
                              formKey.currentState!.save();
                            print("ข้อมูล = ${myStudent.fname}${myStudent.lname}${myStudent.email}${myStudent.score}");
                            }
                      
                          }),
                    )
                  ],
                ),
              ))),
    );
  }
}
