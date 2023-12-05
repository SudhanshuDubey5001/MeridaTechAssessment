import 'package:flutter/material.dart';
import 'package:meridatech_assessment/model/Transaction_SBI.dart';
import 'package:meridatech_assessment/services/cloud_database.dart';

import '../utils/Constants.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {

  DatabaseService db = DatabaseService();
  List<Transaction_SBI> transactions = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTransactionHistory();
  }

  void getTransactionHistory() async{
    transactions = await db.fetchTransactionHistory();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SBI Account"),
        centerTitle: true,
        backgroundColor: Constants.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: transactions.map((trans) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Withdrawl Amount : ${trans.withdrawl_amount}"),
                  Text("Date : ${trans.dote_of_withdrawl}"),
                  Text("Time : ${trans.time_of_withdrawl}"),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
