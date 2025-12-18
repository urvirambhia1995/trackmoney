import '../models/expense_model.dart';

List<ExpenseModel> dummyExpenses = [
  ExpenseModel(
    id: '1',
    title: 'Lunch',
    amount: 250,
    category: 'Food',
    date: DateTime.now(),
  ),
  ExpenseModel(
    id: '2',
    title: 'Uber',
    amount: 180,
    category: 'Travel',
    date: DateTime.now(),
  ),
  ExpenseModel(
    id: '3',
    title: 'dinner',
    amount: 1250,
    category: 'Food',
    date: DateTime.now(),
  ),
  ExpenseModel(
    id: '4',
    title: 'shopping',
    amount: 1800,
    category: 'Travel',
    date: DateTime.now(),
  ),
];
