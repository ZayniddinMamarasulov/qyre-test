import 'package:flutter/cupertino.dart';

class ItemContext {
  final BuildContext context;
  final int id;

  ItemContext({required this.context, required this.id});

  @override
  bool operator ==(Object other) => other is ItemContext && other.id == id;
}
