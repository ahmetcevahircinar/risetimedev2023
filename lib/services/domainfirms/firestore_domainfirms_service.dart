import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:risetimedev2023/models/domain_firms.dart';

class FirestoreDomainFirmsService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveDomainFirm(DomainFirms domainfirm) {
    return _db
        .collection('domainfirms')
        .doc(domainfirm.id)
        .set(domainfirm.toMap());
  }

  Stream<List<DomainFirms>> getDomainFirms() {
    return _db.collection('domainfirms').snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => DomainFirms.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeDomainFirm(String id) {
    return _db.collection('domainfirms').doc(id).delete();
  }
}
