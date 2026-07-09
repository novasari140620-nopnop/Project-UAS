// lib/view/data.dart

import 'package:flutter/material.dart';
import 'package:uas/models/user_model.dart';
import 'package:uas/config/api_service.dart';

class ProgramView extends StatefulWidget {
  const ProgramView({super.key});

  @override
  State<ProgramView> createState() => _ProgramViewState();
}

class _ProgramViewState extends State<ProgramView> {
  late Future<List<User>> users;

  @override
  void initState() {
    super.initState();
    users = ApiService.fetchUsers(page: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Daftar User"),
        backgroundColor: const Color.fromARGB(255, 56, 76, 136),
      ),
      body: FutureBuilder<List<User>>(
        future: users,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.map((user) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text('ID: ${user.id}'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Email: ${user.email}")),
                    );
                  },
                );
              }).toList(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Gagal memuat data.'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
