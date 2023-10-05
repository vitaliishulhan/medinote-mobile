import 'package:azlistview/azlistview.dart';
import 'package:Medinote/models/medinote_model.dart';

class ListItem extends ISuspensionBean {
  final Medinote medinote;
  final String tag;

  ListItem({required this.medinote}) : tag = medinote.name[0].toUpperCase();

  @override
  String getSuspensionTag() => tag;
}