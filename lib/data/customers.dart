
import 'package:hive/hive.dart';

part 'customers.g.dart';

const String CUSTOMER_BOX_NAME = 'CustomerDataBox';

@HiveType(typeId: 1)
class Customers extends HiveObject {
  
  @HiveField(0)
  final String shopName;
  
  @HiveField(1)
  final String customerName;
  
  @HiveField(2)
  final String location;
  
  @HiveField(3)
  final String contactNumber;

  Customers({this.shopName, this.customerName, this.location, this.contactNumber});
}