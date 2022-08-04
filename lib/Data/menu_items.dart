import 'package:flutter/material.dart';
import 'package:ourcourt/model/diaryitem.dart';

class MenuItems {
  static const List<MenuItem> itemfirst = [itemDelete, itemEdit, itemPdf];

  static const itemDelete = MenuItem(name: 'Delete', icon: Icons.delete);
  static const itemEdit = MenuItem(name: 'Edit', icon: Icons.edit);
  static const itemPdf =
      MenuItem(name: 'export Pdf', icon: Icons.picture_as_pdf);
}
