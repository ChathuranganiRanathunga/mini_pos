// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomersAdapter extends TypeAdapter<Customers> {
  @override
  final int typeId = 1;

  @override
  Customers read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Customers(
      shopName: fields[0] as String,
      customerName: fields[1] as String,
      location: fields[2] as String,
      contactNumber: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Customers obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.shopName)
      ..writeByte(1)
      ..write(obj.customerName)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.contactNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
