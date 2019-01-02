import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:we_eat/const/firestore_collections.dart';
import 'package:we_eat/models/profile.dart';
import 'package:we_eat/models/pub.dart';
import 'package:we_eat/models/user.dart';

class FirebaseService {
  static final FirebaseService _singleton = FirebaseService._internal();
  factory FirebaseService() {
    return _singleton;
  }
  FirebaseService._internal();

  final Firestore _firestore = Firestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.standard();

  Future<FirebaseUser> signIn() async {
    GoogleSignInAccount googleUser;
    while (googleUser == null) {
      googleUser = await _googleSignIn.signIn();
    }
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final FirebaseUser user = await _firebaseAuth.signInWithGoogle(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    final CollectionReference usersCollection = _firestore.collection(FirestoreCollections.USERS);
    final DocumentReference userDocument = usersCollection.document(user.uid);
    DocumentSnapshot userDocumentSnapshot = await userDocument.get();

    if (userDocumentSnapshot.exists) {
      return user;
    }

    Profile profile = Profile(name: user.displayName);
    User newUser = User(profile: profile);

    print(newUser.toJson());
    await userDocument.setData(newUser.toJson()).catchError((error) {
      print(error);

      // logout
      // delete
    });

    userDocumentSnapshot = await userDocument.get();

    if (userDocumentSnapshot.exists) {
      return user;
    } else {
      // logout
      // delete
      return null;
    }
  }

  Future<FirebaseUser> currentFirebaseUser() async {
    return await _firebaseAuth.currentUser();
  }

  Stream<FirebaseUser> onAuthstateChanged() {
    return _firebaseAuth.onAuthStateChanged;
  }

  Future<User> getUser() async {
    FirebaseUser currentUser = await this.currentFirebaseUser();
    CollectionReference usersCollection = _firestore.collection(FirestoreCollections.USERS);

    DocumentSnapshot userDocument = await usersCollection.document(currentUser.uid).get();
    print(userDocument.data);
    User user = User.fromJson(Map<String, dynamic>.from(userDocument.data));

    if (user != null) {
      return user;
    } else {
      throw new Exception('User is null');
    }
  }

  Future<void> addPub(Pub pub) async {
    FirebaseUser firebaseUser = await this.currentFirebaseUser();
    User user = await this.getUser();
    CollectionReference usersCollection = _firestore.collection(FirestoreCollections.USERS);
    CollectionReference pubsCollection = _firestore.collection(FirestoreCollections.PUBS);

    DocumentReference userDocument = usersCollection.document(firebaseUser.uid);
    pub.organizer = userDocument;

    DocumentReference newPubDocument = await pubsCollection.add(pub.toJson());

    print(pub.toJson());

    if (user.pubs == null) {
      user.pubs = List<DocumentReference>();
    }

    user.pubs.add(newPubDocument);

    await userDocument.updateData(user.toJson());
  }

}
