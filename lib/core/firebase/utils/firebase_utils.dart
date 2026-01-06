import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/database/model/event.dart';

class FirebaseUtils {
  static CollectionReference<Event> getEventsCollection() {
    return FirebaseFirestore.instance
        .collection(Event.collectionName)
        .withConverter<Event>(
          fromFirestore: (snapshot, options) =>
              Event.fromFireStore(snapshot.data()!),
          toFirestore: (event, options) => event.toFireStore(),
        );
  }

  static Future<void> addEventToFireStore(Event event) {
    // todo : 1- create collection
    CollectionReference<Event> collectionRef = getEventsCollection();
    // todo : 2- create document
    DocumentReference<Event> documentRef = collectionRef.doc();
    // todo : 3- assign auto doc id to event
    event.id = documentRef.id; // todo : auto id
    // todo : 4- add event to fireStore
    return documentRef.set(event);
  }
}
