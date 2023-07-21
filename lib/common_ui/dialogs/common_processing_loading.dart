
import 'package:flutter/material.dart';

class CommonProcessingDialog extends StatelessWidget {

  const CommonProcessingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background overlay
        Positioned.fill(
          child: Container(
            color: Colors.black54,
            alignment: Alignment.center,
          ),
        ),
        // Loading popup
        Positioned.fill(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 20.0),
                  Text(
                    'Processing...',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}