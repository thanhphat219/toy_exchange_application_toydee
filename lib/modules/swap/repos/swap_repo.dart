import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toy_exchange_application_toydee/modules/swap/models/swap_toy.dart';

import '../../../core/errors/exceptions.dart';

final swapRepoRepoProvider = Provider<SwapRepo>((ref) => SwapRepo());

class SwapRepo {
  // Future<UserModel?> signInWithEmailAndPassword({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     final userCredential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: password)
  //         .then((value) async => {
  //               if (value.user != null && !value.user!.emailVerified)
  //                 {
  //                   await value.user!.sendEmailVerification(),
  //                   Fluttertoast.showToast(msg: "Please verify your mail!"),
  //                 }
  //               else
  //                 {
  //                   NavigationService.push(
  //                       isNamed: true, page: RoutePaths.mainScreen)
  //                 }
  //             });
  //     log(userCredential.toString());
  //     //return UserModel.fromUserCredential(userCredential.user!);
  //   } on FirebaseAuthException catch (e) {
  //     final _errorMessage = Exceptions.firebaseAuthErrorMessage(e);
  //     Fluttertoast.showToast(msg: _errorMessage);
  //   } catch (e) {
  //     log(e.toString());
  //     final _errorMessage = Exceptions.errorMessage(e);
  //     Fluttertoast.showToast(msg: _errorMessage);
  //   }
  //   return null;
  // }

  Future<bool?> uploadSwapToyToFireStore({
    required SwapToy swapToy,
  }) async {
    try {
      bool _result = false;
      log(swapToy.location.address);
      await FirebaseFirestore.instance
          .collection('swapToy')
          .add(
            swapToy.toMap(),
          )
          .then((value) => print(value));
    } catch (e) {
      log("uploadSwapToyToFireStore" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return null;
  }

  // Future<bool?> uploadUserProfileToFirestore({
  //   required String email,
  //   required String userName,
  //   required String uuid,
  // }) async {
  //   try {
  //     bool result = false;
  //     await FirebaseFirestore.instance.collection("users").doc(uuid).set(
  //       {
  //         'userName': userName,
  //         'email': email,
  //         'isActived': true,
  //         'isEmailVerified': false,
  //         'phone': "",
  //         'firstName': "",
  //         'lastName': "",
  //         'birthday': "",
  //         'gender': "",
  //         'address': "",
  //         'imageUrl': "",
  //         'createDate': DateTime.now(),
  //         'lastUpdateDate': "",
  //       },
  //     ).then((value) => result = !result);
  //     return result;
  //   } on FirebaseAuthException catch (e) {
  //     log(e.toString());
  //     final _errorMessage = Exceptions.firebaseAuthErrorMessage(e);
  //     Fluttertoast.showToast(msg: _errorMessage);
  //   } catch (e) {
  //     log(e.toString());
  //     final _errorMessage = Exceptions.errorMessage(e);
  //     Fluttertoast.showToast(msg: _errorMessage);
  //   }
  //   return null;
  // }

  // Future<bool?> checkExistUsername(String username) async {
  //   try {
  //     bool _result = false;
  //     await FirebaseFirestore.instance.collection('users').get().then(
  //       (QuerySnapshot querySnapshot) {
  //         for (var doc in querySnapshot.docs) {
  //           if (doc["userName"].toString() == username) {
  //             _result = true;
  //           }
  //         }
  //       },
  //     );
  //     return _result;
  //   } on FirebaseAuthException catch (e) {
  //     log(e.toString());
  //     final _errorMessage = Exceptions.firebaseAuthErrorMessage(e);
  //     Fluttertoast.showToast(msg: _errorMessage);
  //   } catch (e) {
  //     log(e.toString());
  //     final _errorMessage = Exceptions.errorMessage(e);
  //     Fluttertoast.showToast(msg: _errorMessage);
  //   }
  //   return null;
  // }

  // Future<bool?> checkExistPhoneNumber(String phone) async {
  //   try {
  //     bool _result = false;
  //     await FirebaseFirestore.instance.collection('users').get().then(
  //       (QuerySnapshot querySnapshot) {
  //         for (var doc in querySnapshot.docs) {
  //           if (doc["phone"].toString() == phone) {
  //             _result = true;
  //           }
  //         }
  //       },
  //     );
  //     return _result;
  //   } on FirebaseAuthException catch (e) {
  //     log(e.toString());
  //     final _errorMessage = Exceptions.firebaseAuthErrorMessage(e);
  //     Fluttertoast.showToast(msg: _errorMessage);
  //   } catch (e) {
  //     log(e.toString());
  //     final _errorMessage = Exceptions.errorMessage(e);
  //     Fluttertoast.showToast(msg: _errorMessage);
  //   }
  //   return null;
  // }

  // Future<bool?> checkExistEmail(String email) async {
  //   try {
  //     bool _result = false;
  //     await FirebaseFirestore.instance.collection('users').get().then(
  //       (QuerySnapshot querySnapshot) {
  //         for (var doc in querySnapshot.docs) {
  //           if (doc["email"].toString() == email.toString()) {
  //             _result = true;
  //           }
  //         }
  //       },
  //     );
  //     return _result;
  //   } on FirebaseAuthException catch (e) {
  //     log(e.toString());
  //     final _errorMessage = Exceptions.firebaseAuthErrorMessage(e);
  //     Fluttertoast.showToast(msg: _errorMessage);
  //   } catch (e) {
  //     log(e.toString());
  //     final _errorMessage = Exceptions.errorMessage(e);
  //     Fluttertoast.showToast(msg: _errorMessage);
  //   }
  //   return null;
  // }

  // Future<bool> checkExistUserInformation(String email, String userName) async {
  //   //final _checkExistPhone = await checkExistPhoneNumber(phoneNumber);
  //   final _checkExistEmail = await checkExistEmail(email);
  //   final _checkExistUsername = await checkExistUsername(userName);

  //   // if (_checkExistEmail != null) {
  //   //   log(_checkExistEmail.toString());
  //   //   if (_checkExistEmail) {
  //   //     log("d1");
  //   //     Fluttertoast.showToast(msg: "Email already exists");
  //   //     return false;
  //   //   } else if (_checkExistPhone != null) {
  //   //     if (_checkExistPhone) {
  //   //       log("d2");
  //   //       Fluttertoast.showToast(msg: "Phone number already exists");
  //   //       return false;
  //   //     }
  //   //   } else if (_checkExistUsername != null) {
  //   //     if (_checkExistUsername) {
  //   //       log("d3");
  //   //       Fluttertoast.showToast(msg: "Username already exists");
  //   //       return false;
  //   //     }
  //   //   } else {
  //   //     log("d4");
  //   //     return true;
  //   //   }
  //   // } else {
  //   //   log("false");
  //   //   return false;
  //   // }
  //   // return false;

  //   if (_checkExistEmail != null && _checkExistUsername != null) {
  //     if (_checkExistEmail) {
  //       Fluttertoast.showToast(msg: "Email already exists");
  //       return true;
  //     } else if (_checkExistUsername) {
  //       Fluttertoast.showToast(msg: "Username already exists");
  //       return true;
  //       // } else if (_checkExistPhone) {
  //       //   Fluttertoast.showToast(msg: "Phone number already exists");
  //       //   return false;
  //     } else {
  //       return false;
  //     }
  //   } else {
  //     return true;
  //   }
  // }

  // Future<bool?> sendPasswordResetEmail({
  //   required String email,
  // }) async {
  //   try {
  //     bool _result = false;
  //     await FirebaseAuth.instance
  //         .sendPasswordResetEmail(email: email)
  //         .then((value) async => {
  //               _result = true,
  //             });
  //     return _result;
  //   } on FirebaseAuthException catch (e) {
  //     final _errorMessage = Exceptions.firebaseAuthErrorMessage(e);
  //     Fluttertoast.showToast(msg: _errorMessage);
  //   } catch (e) {
  //     log(e.toString());
  //     final _errorMessage = Exceptions.errorMessage(e);
  //     Fluttertoast.showToast(msg: _errorMessage);
  //   }
  //   return null;
  // }

  // Future signOut() async {
  //   try {
  //     await FirebaseAuth.instance.signOut();
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}