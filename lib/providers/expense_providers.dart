import 'package:flutter/material.dart';
import '../models/expense_model.dart';

class ExpenseProvider extends ChangeNotifier {
  final List<ExpenseModel> _expenses = [];

  List<ExpenseModel> get expenses => _expenses;

  double get totalExpense {
    return _expenses.fold(0, (sum, item) => sum + item.amount);
  }

  void addExpense(ExpenseModel expense) {
    _expenses.add(expense);
    notifyListeners();
  }
  void updateExpense(String id, ExpenseModel updatedExpense) {
    final index = _expenses.indexWhere((e) => e.id == id);
    if (index != -1) {
      _expenses[index] = updatedExpense;
      notifyListeners();
    }
  }

  void deleteExpense(String id) {
    _expenses.removeWhere((e) => e.id == id);
    notifyListeners();
  }
}
