import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firestore_service.dart';

class HistoryScreen extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search History"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestoreService.getSearchHistory(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          var history = snapshot.data!.docs;
          if (history.isEmpty) return Center(child: Text("No search history found", style: TextStyle(fontSize: 18)));

          return ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: history.length,
            itemBuilder: (context, index) {
              var entry = history[index].data() as Map<String, dynamic>;
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: Icon(Icons.history_rounded, color: Colors.blueAccent),
                  title: Text(entry['query'] ?? "Unknown MRI", style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(entry['result'] ?? "No result"),
                  trailing: Text(entry['timestamp']?.toDate().toString().split(' ')[0] ?? ""),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
