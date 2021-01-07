import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _filter=TextEditingController();
  FocusNode focusNode=FocusNode();
  String _searchText='';
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
