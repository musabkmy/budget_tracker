import 'package:budget_tracker/models/base_category_models/expense_type.dart';
import 'package:hive/hive.dart';

class ExpenseTypeAdapter extends TypeAdapter<ExpenseType> {
  @override
  final int typeId = 8; // You can choose a unique typeId for this adapter.

  @override
  ExpenseType read(BinaryReader reader) {
    // Convert the integer stored in the database back to the ExpenseType enum
    return ExpenseType.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, ExpenseType obj) {
    // Store the index of the enum value (e.g., 0 for fixed, 1 for variable)
    writer.writeByte(obj.index);
  }
}
