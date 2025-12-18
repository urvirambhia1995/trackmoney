import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/expense_model.dart';
import '../providers/expense_providers.dart';
import '../utils/constants.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  String selectedCategory = expenseCategories.first;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              items: expenseCategories
                  .map(
                    (cat) => DropdownMenuItem(
                  value: cat,
                  child: Text(cat),
                ),
              )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Category',
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Date: ${selectedDate.toLocal().toString().split(' ')[0]}',
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    }
                  },
                  child: const Text('Select Date'),
                )
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isEmpty ||
                    _amountController.text.isEmpty) {
                  return;
                }

                final expense = ExpenseModel(
                  id: DateTime.now().toString(),
                  title: _titleController.text,
                  amount: double.parse(_amountController.text),
                  category: selectedCategory,
                  date: selectedDate,
                );

                Provider.of<ExpenseProvider>(context, listen: false)
                    .addExpense(expense);

                Navigator.pop(context);
              },
              child: const Text('Save Expense'),
            ),

          ],
        ),
      ),
    );
  }
}
