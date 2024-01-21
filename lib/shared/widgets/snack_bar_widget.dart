import 'package:flutter/material.dart';

class SnackBarWidget {
  static SnackBar showSuccessSnackBar(String message) {
    return SnackBar(
      content: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.check_circle_rounded,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static SnackBar showErrorSnackBar(String message) {
    return SnackBar(
      content: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.error,
              color: Colors.red.withOpacity(.85),
            ),
          ),
          Expanded(
            child: Text(
              message,
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}
