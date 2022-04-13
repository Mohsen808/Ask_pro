import 'question.dart';
class Qclaas{
  int _numqut=0;
   List<Question> _questionGr=[
    Question(
      q: 'تبلغ مساحة قطر 11,521 كم2، إذ إنّ قطر تُشكّل شبه جزيرة بعرض 100 كم تقريباً ',
      i: 'images/image-1.jpg',
      a: true,
    ),
    Question(
      q: ' يتألف العلم القطري  من لونين هما الأبيض والأحمر',
      i: 'images/image-2.jpg',
      a: false,
    ),
    Question(
        q: ' تحيط بقطر مياه الخليج العربي من ثلاث جهات، هي: الشرق، والشمال، والغرب',
        i: 'images/image-3.jpg',
        a: true,
    ),
    Question(
      q: 'يعتمد القطاع الاقتصاديّ في دولة قطر على النفط الذي تمّ اكتشافه في عام 1939م',
      i: 'images/image-4.jpg',
      a: true,
    ),
     Question(
       q: 'عدد الملاعب المستضيفة لكاس العالم  هي 6 ملاعب2022',
       i: 'images/image-5.jpg',
       a: false,
     ),
     Question(
       q: 'عاصمة قطر هي الدوحة',
       i: 'images/image-6.jpg',
       a: true,
     ),
     Question(
       q: 'يتكون قطر من 8 مدن',
       i: 'images/image-7.jpg',
       a: true,
     ),

     Question(
       q: 'يقع استاد البيت في الدوحة',
       i: 'images/image-8.jpg',
       a: false,
     ),


  ];
  void nextq(){
    if(_numqut<_questionGr.length-1){
      _numqut++;

    }
  }
  String getqut(){
    return _questionGr[_numqut].questionText;
  }
  String getimage(){
    return _questionGr[_numqut].questionImage;
  }
  bool getaner(){
    return _questionGr[_numqut].questionAnswer;
  }
  bool isend(){
    if(_numqut>=_questionGr.length-1){
      return true;
    }else{
      return false;
    }
  }
  void reset(){
    _numqut=0;
  }
}