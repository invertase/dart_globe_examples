import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_client/model.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final uri = Uri.https('mockdash.globeapp.dev', '/api/v1/users');
    return Scaffold(
      appBar: AppBar(title: const Text('Testing mockdash.globeapp.dev')),
      body: FutureBuilder(
        future: http.get(uri),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(child: Text('Something went wrong!'));
          }
          if (snapshot.hasData) {
            print(snapshot.data!.body);
            final users = Users.fromJson(jsonDecode(snapshot.data!.body));
            return ListView.separated(
              itemCount: users.data.length,
              itemBuilder: (context, index) {
                final user = users.data[index];
                return ListTile(
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.job),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          }
          return const Center(child: Text('No Users Yet!'));
        },
      ),
    );
  }
}
