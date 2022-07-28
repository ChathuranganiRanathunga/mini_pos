import 'package:hive/hive.dart';

part 'item.g.dart';

const String ITEM_BOX_NAME = 'ItemDataBox';

@HiveType(typeId: 0)
class Item extends HiveObject {
  @HiveField(0)
  final String code;

  @HiveField(1)
  final String itemName;

  @HiveField(2)
  double unitPrice;

  Item({this.code, this.itemName, this.unitPrice});

}
