import 'package:flutter/material.dart';
import 'package:flutter_eplacement/widgets/myname.dart';
class FragmentHolder extends StatefulWidget {
  const FragmentHolder({super.key});

  @override
  State<FragmentHolder> createState() => _FragmentHolderState();
}

class _FragmentHolderState extends State<FragmentHolder> {
  @override
   var data=[];
  Widget build(BuildContext context) {
    return MyName(name:"jeel");
  }
}

