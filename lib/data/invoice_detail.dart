import 'package:demo_app_2021_04_20/data/item.dart';

class InvoiceDetail{

  final Item item;

  double itemQty;

  InvoiceDetail({this.item, this.itemQty=1.0});

  get lineTotal => item.unitPrice * itemQty;

  void increment() =>
      itemQty++;


  void decrement(){
    print('itemQty : $itemQty');
    if(itemQty>1){
      itemQty--;
    }
  }

}