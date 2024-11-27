import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget loadingIndicator(){
 return LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.white, size: 35);
}