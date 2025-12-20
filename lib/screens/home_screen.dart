import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/expense_providers.dart';
import '../widget/total_amount_card.dart';
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
      body: Column(
        children: [
          TotalAmountCard(),
          Expanded(
            child: expenseProvider.expenses.isEmpty
                ? const Center(child: Text('No expenses yet'))
                : ListView.builder(
              itemCount: expenseProvider.expenses.length,
              itemBuilder: (context, index) {
                final expense = expenseProvider.expenses[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(expense.title),
                      subtitle: Text(expense.category),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          expenseProvider.deleteExpense(expense.id);
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddExpenseScreen(expense: expense),
                          ),
                        );
                      },
                    ),
                    Divider(height: 10,color: Colors.black,)
                  ],
                );

              },
            ),
          ),
        ],
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
