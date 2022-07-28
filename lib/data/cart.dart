import 'package:demo_app_2021_04_20/data/invoice_detail.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  final List<InvoiceDetail> itemsInInvoice = [];

  get total => itemsInInvoice.fold(
      0.0, (previousValue, detail) => previousValue + detail.lineTotal);

  void addItem(InvoiceDetail invoiceDetail) {
    itemsInInvoice.add(invoiceDetail);
    notifyListeners();
  }

  void deleteItem(int index) {
    itemsInInvoice.removeAt(index);
    notifyListeners();
  }

  void incrementQty(int index) {
    itemsInInvoice[index].increment();
    notifyListeners();
  }

  void decrementQty(int index) {
    itemsInInvoice[index].decrement();
    notifyListeners();
  }
}
