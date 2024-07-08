import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  const TextTitle(
    this.text, {
    super.key,
    this.textAlign,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 18,
    this.color = Colors.black,
  });

  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        fontFamily: 'Montserrat',
      ),
      textAlign: textAlign,
    );
  }
}

class TextBody16 extends StatelessWidget {
  const TextBody16(
    this.text, {
    super.key,
    this.textAlign,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 16,
    this.color = Colors.black,
  });

  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        fontFamily: 'Montserrat',
      ),
      textAlign: textAlign,
    );
  }
}

class TextBody12 extends StatelessWidget {
  const TextBody12( this.text,
   {
    super.key,
    this.textAlign,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 12,
    this.color = Colors.black,
  });

  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        fontFamily: 'Montserrat',
      ),
      textAlign: textAlign,
    );
  }
}

class TextDescription extends StatelessWidget {
  const TextDescription(
    this.text, {
    super.key,
    this.textAlign,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 10,
    this.color = Colors.black,
  });

  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: MediaQuery.textScalerOf(context).scale(fontSize),
        color: color,
        fontFamily: 'Montserrat',
      ),
      textAlign: textAlign,
    );
  }
}

class TextBodyTest12 extends StatelessWidget {
  const TextBodyTest12(
      {
        super.key,
        this.text,
        this.textAlign,
        this.fontWeight = FontWeight.normal,
        this.fontSize = 12,
        this.color = Colors.black,
      });

  final String? text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text??'',
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: MediaQuery.textScalerOf(context).scale(fontSize),
        color: color,
        fontFamily: 'Montserrat',
      ),
      textAlign: textAlign,
    );
  }
}
