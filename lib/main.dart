import 'package:flutter/material.dart';

void main() {
  runApp(const FactoryNetworkApp());
}

class FactoryNetworkApp extends StatelessWidget {
  const FactoryNetworkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Factory Network Toolbox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const NetworkHomeScreen(),
    );
  }
}

class NetworkHomeScreen extends StatelessWidget {
  const NetworkHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factory Network Master 🌐'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Utility Tool:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            
            // टूल्सचे बटन्स (Grid / List)
            Expanded(
              child: ListView(
                children: [
                  _buildToolCard(context, 'IP Scanner', 'Scan live IPs in local subnet', Icons.lan),
                  _buildToolCard(context, 'VLAN MAC Finder', 'Cross-VLAN MAC address resolver', Icons.router),
                  _buildToolCard(context, 'Port Checker', 'Check open ports on servers/PLC', Icons.settings_ethernet),
                  _buildToolCard(context, 'Ping Test', 'Check latency and connectivity', Icons.network_ping),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // सुंदर कार्ड डिझाईन बनवणारे फंक्शन
  Widget _buildToolCard(BuildContext context, String title, String subtitle, IconData icon) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blueAccent),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // इथे पुढे आपण प्रत्येक टूलचे लॉजिक जोडू
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title selected!')),
          );
        },
      ),
    );
  }
}
