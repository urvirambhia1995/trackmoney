import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/expense_providers.dart';
import 'Add_Expense.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
      ),
      body: expenseProvider.expenses.isEmpty
          ? const Center(child: Text('No expenses yet'))
          : ListView.builder(
        itemCount: expenseProvider.expenses.length,
        itemBuilder: (context, index) {
          final expense = expenseProvider.expenses[index];
          return ListTile(
            title: Text(expense.title),
            subtitle: Text(expense.category),
            trailing: Text('₹${expense.amount}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddExpenseScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
