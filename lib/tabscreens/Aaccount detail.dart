import 'package:flutter/material.dart';
import '../controller/authentication controller .dart';

class AccountDetailsScreen extends StatelessWidget {
  final AuthenticationController authController =
      AuthenticationController.authController;
  var authenticationController = AuthenticationController.authController;
  @override
  Widget build(BuildContext context) {
    // Unwrap the Rx<Person?> to access properties
    final currentUser = authController.currentUser.value;

    return Scaffold(
      appBar: AppBar(
        title: Text('Account Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: authenticationController.pickedfile.value != null
                      ? FileImage(authenticationController.pickedfile.value!)
                      : AssetImage('assets/default_avatar.png')
                          as ImageProvider,
                ),
              ),
            ),
            _buildDetailRow(
                'Name:', authController.currentUser.value?.name ?? ''),
            _buildDetailRow(
                'Mobile No:', authController.currentUser.value?.mobileno ?? ''),
            _buildDetailRow(
                'Email:', authController.currentUser.value?.email ?? ''),
            _buildDetailRow(
                'Gender:', authController.currentUser.value?.gender ?? ''),
            _buildDetailRow('Marital Status:',
                authController.currentUser.value?.maritalStatus ?? ''),
            _buildDetailRow('Education:',
                authController.currentUser.value?.education ?? ''),
            _buildDetailRow(
                'Age:', authController.currentUser.value?.age ?? ''),
            _buildDetailRow(
                'Height:', authController.currentUser.value?.height ?? ''),
            _buildDetailRow(
                'City:', authController.currentUser.value?.city ?? ''),

            // Add more details as needed
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
