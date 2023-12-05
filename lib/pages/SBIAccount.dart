import 'package:flutter/material.dart';
import 'package:meridatech_assessment/services/auth.dart';
import 'package:meridatech_assessment/services/cloud_database.dart';
import 'package:meridatech_assessment/utils/Routes.dart';

import '../utils/Constants.dart';

class SBIAccountScreen extends StatefulWidget {
  const SBIAccountScreen({super.key});

  @override
  State<SBIAccountScreen> createState() => _SBIAccountScreenState();
}

class _SBIAccountScreenState extends State<SBIAccountScreen> {
  DatabaseService db = DatabaseService();

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async{
    if (Constants.userSBI.uid != '-1' && Constants.userSBI.name == "") {
      Constants.userSBI = await db.fetchUser(Constants.userSBI.uid);
      print("Grabbed user = "+Constants.userSBI.name);
      setState(() {
      });
    }
  }

  void onDepositPressed(String value) async{
    double depositAmount = double.parse(value);
    await db.depositAmount(depositAmount);
    setState(() {});
  }

  void onWithdrawlPressed(String value) async{
    double withdrawl = double.parse(value);
    await db.performWithdrawl(withdrawl);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    print("home screen");
    print("UID = " + Constants.userSBI.uid);
    print("Name = " + Constants.userSBI.name);

    TextEditingController depositCon = TextEditingController();
    TextEditingController withdrawlCon = TextEditingController();

    AuthService _authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: Text("SBI Account"),
        centerTitle: true,
        backgroundColor: Constants.primaryColor,
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (String result) async {
              if (result == 'transactions') {
                Navigator.pushNamed(context, Routes.transactions);
              }else if (result == 'signOut') {
                await _authService.signOut();
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'transactions',
                child: Text('Transaction History'),
              ),
              const PopupMenuItem<String>(
                value: 'signOut',
                child: Text('Sign Out'),
              ),

            ],
          ),
        ],
      ),
      body: Column(children: [
        Text("Name on Account"),
        Text(Constants.userSBI.name),
        Text("Address"),
        Text(Constants.userSBI.address),
        Text("Current saving balance"),
        Text("${Constants.userSBI.saving_account_balance}"),
        TextField(
          controller: depositCon,
          decoration: InputDecoration(labelText: 'Deposit Amount'),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
            onPressed: () => onDepositPressed(depositCon.text),
            child: Text('Deposit')),
        TextField(
          controller: withdrawlCon,
          decoration: InputDecoration(labelText: 'Withdrawl Amount'),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
            onPressed: () => onWithdrawlPressed(withdrawlCon.text),
            child: Text('Withdrawl')),
      ]),
    );
  }
}
