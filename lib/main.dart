import 'package:flutter/material.dart';
import 'qclass.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
Qclaas q1=Qclaas();
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.tealAccent,
          title: const Text('اختبار'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: EthPage(),
        ),
      ),
    );
  }
}
class EthPage extends StatefulWidget {
  const EthPage({Key? key}) : super(key: key);

  @override
  State<EthPage> createState() => _EthPageState();
}

class _EthPageState extends State<EthPage> {
   List<Widget> ansrs=[];
   int rigth=0;

   void cheakanser(bool wuc){
     bool chec=q1.getaner();

     setState(() {
       if(wuc==chec){
         rigth++;
         ansrs.add(const Padding(
           padding: EdgeInsets.all(5.0),
           child:Icon(
             Icons.thumb_up,
             color: Colors.green,
           ) ,
         ),
         );
       }else{
         ansrs.add(const Padding(
           padding: EdgeInsets.all(5.0),
           child:Icon(
             Icons.thumb_down,
             color: Colors.red,
           ) ,

         ),
         );
       }


     });
     if(q1.isend()==true){
       Alert(
         context: context,

         title: "انتهاء الاختبار",
         desc: "لقد اجبت على $rigth صحيحة من 8 اسئلة",
         buttons: [
           DialogButton(
             child: const Text(
               "أبدء من جديد",
               style: TextStyle(color: Colors.white, fontSize: 20),
             ),
             onPressed: () => Navigator.pop(context),
             width: 120,
           )
         ],
       ).show();
       q1.reset();
       ansrs=[];
       rigth=0;
     }else{
       q1.nextq();

     }


   }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: ansrs,
        ),
        Expanded(
          flex: 5,
            child: Column(
              children: [
                Image.asset(q1.getimage()),
                const SizedBox(
                  height: 20.0,

                ),
                Text(
                  q1.getqut(),
                  textAlign: TextAlign.center,
                  style:const TextStyle(
                      fontSize: 30.0,

                  ),
                )
              ],

            )
        ),
        Expanded(
            child:
            // ignore: deprecated_member_use
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  cheakanser(true);


                },
                child: const Text('صح',
                style:TextStyle(
                  fontSize: 20.0,
                  color: Colors.white
                ),
                ),
                color:Colors.green,

              ),
            ),

        ),
        Expanded(
          child:
          // ignore: deprecated_member_use
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            // ignore: deprecated_member_use
            child: FlatButton(
              onPressed: () {
            cheakanser(false);
            },
              child: const Text('خطأ',
                style:TextStyle(
                    fontSize: 20.0,
                    color: Colors.white
                ),
              ),
              color:Colors.deepOrangeAccent,

            ),
          ),

        )
      ],
    );
  }
}
