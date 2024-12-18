import 'package:flutter/material.dart';
import 'package:sigita_test/drawerNav/drawerNavigasi.dart';
import 'package:sigita_test/models/sigitaModel.dart';
import 'package:sigita_test/navigasi/navigasiBar.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  // Controllers for edit fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jabatanController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to show update dialog
  void _showUpdateDialog(String userId,String field, TextEditingController controller) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Update $field'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter new $field',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              String? responseMessage;
              if (field == 'Name') {
                responseMessage =
                    await UpdateNameProfile().updateName(userId, controller.text);
              } else if (field == 'Phone') {
                responseMessage =
                    await UpdatePhoneProfile().updatePhone(userId, controller.text);
              } else if (field == 'jabatan') {
                responseMessage = await UpdateJabatanProfile()
                    .updateJabatan(userId, controller.text);
              } else if (field == 'Password') {
                responseMessage = await UpdatePasswordProfile()
                    .updatePassword(userId, controller.text);
              }

              Navigator.of(context).pop(); // Tutup dialog

              if (responseMessage != null) {
                // Tampilkan pesan dari server
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(responseMessage)),
                );

                setState(() {}); // Refresh UI
              }
            },
            child: const Text('Update'),
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navigasibar(),
      drawer: const Drawernavigasi(),
      body: FutureBuilder<GetUser>(
        future: GetUser.getUser(),
        builder: (context, snapshot, ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi Kesalahan'));
          } else if (snapshot.hasData) {
            GetUser user = snapshot.data!;
            return Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Color.fromRGBO(202, 248, 253, 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Profile Image and Icon
                      Icon(Icons.account_circle_outlined, size: 150, color: Colors.black.withOpacity(0.2)),
                      const SizedBox(height: 20),

                      // Profile Information Cards
                      _buildProfileInfoCard(
                        icon: Icons.person,
                        title: 'Name',
                        value: user.nama,
                        onEdit: () => _showUpdateDialog(user.userId,'Name', _nameController),
                      ),
                      _buildProfileInfoCard(
                        icon: Icons.work,
                        title: 'jabatan',
                        value: user.jabatan,
                        onEdit: () => _showUpdateDialog(user.userId,'jabatan', _jabatanController),
                      ),
                      _buildProfileInfoCard(
                        icon: Icons.phone,
                        title: 'Phone',
                        value: user.phone,
                        onEdit: () => _showUpdateDialog(user.userId,'Phone', _phoneController),
                      ),
                      _buildProfileInfoCard(
                        icon: Icons.lock,
                        title: 'Password',
                        value: '********',
                        onEdit: () => _showUpdateDialog(user.userId,'Password', _passwordController),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }

  // Helper method to create profile information cards
  Widget _buildProfileInfoCard({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onEdit,
  }) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.edit, color: Colors.blue),
          onPressed: onEdit,
        ),
      ),
    );
  }
}