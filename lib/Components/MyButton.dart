import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onsave;
  final double radius;
  final double width;
  final double height;
  final String text;
  final Color color;
  final Color textColor;
  final double fontSize;

  const MyButton({
    Key? key,
    required this.onsave,
    required this.width,
    required this.height,
    required this.text,
    required this.color,
    required this.textColor,
    required this.radius,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onsave,
        child: Text(

          text,
          style: TextStyle(
            color: textColor,
            fontFamily: 'font1',
            fontSize: fontSize,
          ),
          textDirection: TextDirection.rtl,
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          // يمكنك تعيين قيم للظلال هنا
          elevation: 10, // قيمة التعريف يمكن تعديلها حسب الحاجة
          shadowColor: Colors.black, // لون ا
          // لظل
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.5),
          //     spreadRadius: 2, // انتشار الظل
          //     offset: Offset(0, 5), // تحديد الزاوية والاتجاه
          //     blurRadius: 10, // وضوح الظل
          //   ),
          // ],
        ),
      ),
    );
  }
}
