import 'package:flutter/material.dart';

class MySearch extends StatefulWidget {
  final void Function(String)? onChanged;
  final String? hintText;
  const MySearch({Key? key, this.onChanged, this.hintText}) : super(key: key);

  @override
  State<MySearch> createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        autofocus: false,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.search),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
