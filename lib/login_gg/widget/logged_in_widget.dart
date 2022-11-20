import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/google_sign_in.dart';

class LoggedInWidget extends StatelessWidget {
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Name: ${user?.displayName}',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Email: ${user?.email}',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('${user?.photoURL}'),
        ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () {
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
