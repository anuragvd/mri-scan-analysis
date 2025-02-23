import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add Search History Entry
  Future<void> addSearchHistory(String query, String result) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await _db.collection('users').doc(user.uid).collection('history').add({
      'query': query,
      'result': result,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  // Get Search History as a Stream
  Stream<QuerySnapshot> getSearchHistory() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return const Stream.empty();

    return _db
        .collection('users')
        .doc(user.uid)
        .collection('history')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
