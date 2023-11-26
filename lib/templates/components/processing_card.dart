import 'package:flutter/material.dart';
import 'package:meridatech_assessment/Controller.dart';

class ProcessingCard extends StatefulWidget {
  bool isProcessing;

  ProcessingCard({super.key, required this.isProcessing});

  @override
  State<ProcessingCard> createState() => _ProcessingCardState();
}

class _ProcessingCardState extends State<ProcessingCard> {
  String processingMsg = "Processing...";
  bool success = false; //to change from spinner to green tick icon

  void showSuccessMsg() {
    // simulate transaction by just adding delay of 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          success = true;
          processingMsg = "Successful";
          // now navigate to home page
          Future.delayed(const Duration(seconds: 1), () {
            if (mounted) {
              Controller.resetValues();
              Navigator.pop(context);
              Navigator.pop(context);
            }
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    showSuccessMsg();
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                processingMsg,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 16),
              Visibility(visible: !success, child: CircularProgressIndicator()),
              Visibility(
                  visible: success, child: Image.asset('assets/green_tick.jpg'))
            ],
          ),
        ),
      ),
    );
  }
}
