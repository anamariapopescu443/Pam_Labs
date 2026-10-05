import 'package:flutter/material.dart';

void main() {
  runApp(const SalaryApp());
}

class SalaryApp extends StatelessWidget {
  const SalaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      home: const SalaryCalculatorPage(),
    );
  }
}

class SalaryCalculatorPage extends StatefulWidget {
  const SalaryCalculatorPage({super.key});

  @override
  State<SalaryCalculatorPage> createState() => _SalaryCalculatorPageState();
}

class _SalaryCalculatorPageState extends State<SalaryCalculatorPage> {
  // text controller for gross salary input
  final TextEditingController grossController = TextEditingController();

  // default tax rate (12% standard tax rate)
  double taxRate = 0.12;
  String resultText = '';

  @override
  void dispose() {
    // clean up controller
    grossController.dispose();
    super.dispose();
  }

  void calculateSalary() {
    // parse gross salary input safely
    double grossSalary = double.tryParse(grossController.text) ?? 0;

    if (grossSalary > 0) {
      double taxAmount = grossSalary * taxRate;
      double netSalary = grossSalary - taxAmount;

      setState(() {
        resultText =
            'Gross Salary: ${grossSalary.toStringAsFixed(2)} MDL\n'
            'Tax Amount (${(taxRate * 100).toInt()}%): ${taxAmount.toStringAsFixed(2)} MDL\n\n'
            'Net Salary: ${netSalary.toStringAsFixed(2)} MDL';
      });
    } else {
      setState(() {
        resultText = 'Please enter a valid gross salary amount.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Salary Calculator'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TextField: Gross Salary input
            TextField(
              controller: grossController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Gross Salary (MDL)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.payments),
              ),
            ),
            const SizedBox(height: 20),

            // DropdownButton: Select employee tax category
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Employment Type:',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                DropdownButton<double>(
                  value: taxRate,
                  items: const [
                    DropdownMenuItem(
                      value: 0.12,
                      child: Text('Standard (12%)'),
                    ),
                    DropdownMenuItem(value: 0.07, child: Text('IT Park (7%)')),
                    DropdownMenuItem(
                      value: 0.00,
                      child: Text('Tax Exempt (0%)'),
                    ),
                  ],
                  onChanged: (double? value) {
                    if (value != null) {
                      setState(() {
                        taxRate = value;
                      });
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 25),

            // ElevatedButton: Calculate button
            ElevatedButton(
              onPressed: calculateSalary,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                'Calculate Salary',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            // Text output: Displays result and breakdown
            Text(
              resultText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
