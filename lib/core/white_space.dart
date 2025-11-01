import 'package:flutter/cupertino.dart';

extension spacing on num{

  Widget get spaceVertical{
return SizedBox(height: toDouble(),);
  }
  Widget get spaceHorizontal{
return SizedBox(width: toDouble(),);
  }
}













