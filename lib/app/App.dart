import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_providers.dart';
import '../screens/home_screen.dart';
import '../theme/Theme.dart';

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExpenseProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expense Tracker',
        theme: AppTheme.lightTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
