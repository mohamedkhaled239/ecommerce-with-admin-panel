import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class GoogleButtom extends StatelessWidget {
  const GoogleButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(8),
                              backgroundColor: Colors.white70,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                              ),
                            ),
                            onPressed: () async {
                            },
                            icon: const Icon(Ionicons.logo_google, color: Colors.red),
                            label: const Text(
                              "Sign in with Google",
                              style: TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          );
  }
}