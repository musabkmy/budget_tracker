// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:budget_tracker/features/budget/data/models/budget_period.dart';

class BudgetMetadata {
  final String key;
  final String name;
  final BudgetPeriod budgetPeriod;

  BudgetMetadata(
      {required this.key, required this.name, required this.budgetPeriod});

  @override
  String toString() =>
      'BudgetMetadata(key: $key, name: $name, budgetPeriod: $budgetPeriod)\n';
}
