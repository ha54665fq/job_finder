import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Setting',
          style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cloud, color: Colors.teal),
            onPressed: () {
              // TODO: Implement cloud sync functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'General Settings',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingsItem(
              context,
              icon: Icons.flag,
              title: 'Job Preference Country',
              onTap: () {
                // TODO: Navigate to Job Preference Country settings
              },
            ),
            _buildSettingsItem(
              context,
              icon: Icons.question_answer,
              title: 'FAQs',
              onTap: () {
                // TODO: Navigate to FAQs page
              },
            ),
            _buildSettingsItem(
              context,
              icon: Icons.headset_mic,
              title: 'Help & Feedback',
              onTap: () {
                // TODO: Navigate to Help & Feedback page
              },
            ),
            _buildSettingsItem(
              context,
              icon: Icons.policy,
              title: 'Privacy Policy',
              onTap: () {
                // TODO: Navigate to Privacy Policy page
              },
            ),
            _buildSettingsItem(
              context,
              icon: Icons.language,
              title: 'Language Preference',
              onTap: () {
                // TODO: Navigate to Language Preference settings
              },
            ),
            _buildSettingsItem(
              context,
              icon: Icons.work,
              title: 'Notification Settings',
              onTap: () {
                // TODO: Navigate to Notification Settings
              },
            ),
            // Add more setting categories and items here if needed
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.teal.shade200!),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.teal, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
          ],
        ),
      ),
    );
  }
} 