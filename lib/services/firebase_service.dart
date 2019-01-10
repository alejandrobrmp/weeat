import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:we_eat/const/firestore_collections.dart';
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
    User model = await User.create(
      uid: user.uid,
      name: user.displayName,
      email: user.email
    );

    if (model != null && model.doc != null) {
      return user;
    }

    return null;
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

    User user = await User.read(usersCollection.document(currentUser.uid));

    if (user != null) {
      return user;
    } else {
      throw new Exception('User is null');
    }
  }

}
