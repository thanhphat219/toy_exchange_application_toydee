import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/models/user_model.dart';

import '../models/address.dart';

final userRepoProvider = Provider<UserRepo>((ref) => UserRepo());

class UserRepo {
  String? uid;
  UserModel? userModel;
  Address? address;

  Future<bool> updateUserProfileToFireStore(
    UserModel userData,
    String email,
    String phoneNumber,
    String userName,
  ) async {
    bool check = false;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userData.id)
        .set(
          {
            'userName': userName,
            'email': email,
            'isActived': true,
            'isEmailVerified': false,
            'phone': phoneNumber,
            'firstName': "",
            'lastName': "",
            'birthday': "",
            'gender': "",
            'address': "",
            'imageUrl': "",
            'createDate': DateTime.now(),
            'lastUpdateDate': "",
          },
        )
        .then((value) => check = !check)
        .catchError((onError) {
          Fluttertoast.showToast(msg: onError);
          return check;
        });
    return check;
  }

  Future<bool> getUserProfileToFireStore() async {
    bool _result = false;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (value) {
        if (value.data() != null) {
          log(value.data().toString());
          userModel = UserModel.fromMap(
              value.data()!, FirebaseAuth.instance.currentUser!.uid);
          _result = true;
        } else {
          _result = false;
        }
      },
    ).catchError((onError) {
      log(onError.toString());
      Fluttertoast.showToast(msg: onError.toString());
    });
    return _result;
  }

  Future<bool> updateUserNameToFireStore(
    String firstName,
    String lastName,
  ) async {
    bool check = false;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
          {
            'firstName': firstName,
            'lastName': lastName,
          },
        )
        .then((value) => check = !check)
        .catchError((onError) {
          Fluttertoast.showToast(msg: onError.toString());
          return check;
        });
    return check;
  }

  Future<bool> updateUserPhoneToFireStore(
    String phone,
  ) async {
    bool check = false;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
          {
            'phone': phone,
          },
        )
        .then((value) => check = !check)
        .catchError((onError) {
          Fluttertoast.showToast(msg: onError.toString());
          return check;
        });
    return check;
  }

  Future<bool> updateUserBirthDateToFireStore(
    String birthdate,
  ) async {
    bool check = false;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
          {
            'birthday': birthdate,
          },
        )
        .then((value) => check = !check)
        .catchError((onError) {
          Fluttertoast.showToast(msg: onError.toString());
          return check;
        });
    return check;
  }

  Future<bool> updateUserAddressToFireStore(
    Address address,
  ) async {
    bool check = false;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
          {'address': address.toMap()},
        )
        .then((value) => check = !check)
        .catchError((onError) {
          Fluttertoast.showToast(msg: onError.toString());
          return check;
        });
    return check;
  }

  Future<String> changePassword(String newPass, String oldPass) async {
    final _firebaseAuth = FirebaseAuth.instance;
    AuthCredential credential = EmailAuthProvider.credential(
      email: _firebaseAuth.currentUser!.email!,
      password: oldPass,
    );
    try {
      await _firebaseAuth.currentUser!.reauthenticateWithCredential(credential);
      await _firebaseAuth.currentUser!.updatePassword(newPass);
      return '';
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "wrong-password":
          return "Wrong password";
        default:
          return e.code;
      }
    }
  }

  Future<bool> updateUserLastUpdateToFireStore() async {
    bool check = false;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
          {'lastUpdateDate': DateTime.now()},
        )
        .then((value) => check = !check)
        .catchError((onError) {
          Fluttertoast.showToast(msg: onError.toString());
          return check;
        });
    return check;
  }

  Future<bool> updateUserGenderToFireStore(
    String gender,
  ) async {
    bool check = false;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
          {'gender': gender},
        )
        .then((value) => check = !check)
        .catchError((onError) {
          Fluttertoast.showToast(msg: onError.toString());
          return check;
        });
    return check;
  }

  Future<String> getUserFirstNameFromFireStore() async {
    String result = '';
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (value) {
        if (value.data() != null) {
          result = value.get("firstName");
        } else {
          result = '';
        }
      },
    ).catchError((onError) {
      Fluttertoast.showToast(msg: onError.toString());
    });
    return result;
  }

  Future<Address> getUserAdressFromFireStore() async {
    Address result = Address(
      address: 'address',
      detailAddress: 'detailAddress',
      latitude: 'latitude',
      longitude: 'longitude',
    );
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (value) {
        if (value.data() != null) {
          result = Address.fromMap(Map.from(value.get("address")));
        } else {
          result = Address(
            address: '',
            detailAddress: '',
            latitude: '',
            longitude: '',
          );
        }
      },
    ).catchError((onError) {
      Fluttertoast.showToast(msg: onError.toString());
    });
    return result;
  }

  Future<String> getUserLastNameFromFireStore() async {
    String result = '';
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (value) {
        if (value.data() != null) {
          result = value.get("lastName");
        } else {
          result = '';
        }
      },
    ).catchError((onError) {
      Fluttertoast.showToast(msg: onError.toString());
    });
    return result;
  }

  Future<String> getUserPhoneFromFireStore() async {
    String result = '';
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userModel!.id)
        .get()
        .then(
      (value) {
        if (value.data() != null) {
          result = value.get("phone");
        } else {
          result = '';
        }
      },
    ).catchError((onError) {
      Fluttertoast.showToast(msg: onError.toString());
    });
    return result;
  }

  Future<String> getUserBirthDateFromFireStore() async {
    String result = '';
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (value) {
        if (value.data() != null) {
          result = value.get("birthday");
        } else {
          result = '';
        }
      },
    ).catchError((onError) {
      Fluttertoast.showToast(msg: onError.toString());
    });
    return result;
  }

  Future<String> getUserGenderFromFireStore() async {
    String result = '';
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (value) {
        if (value.data() != null) {
          result = value.get("gender");
        } else {
          result = '';
        }
      },
    ).catchError((onError) {
      Fluttertoast.showToast(msg: onError.toString());
    });
    return result;
  }

  Future<String> getUserEmailFromFireStore() async {
    String result = '';
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (value) {
        if (value.data() != null) {
          result = value.get("email");
        } else {
          result = '';
        }
      },
    ).catchError((onError) {
      Fluttertoast.showToast(msg: onError.toString());
    });
    return result;
  }

  Future<String> uploadAndGetImageStorage(String imagePath) async {
    final path = 'avatarURL/${FirebaseAuth.instance.currentUser!.uid}/avatar';
    final file = File(imagePath);
    final ref = FirebaseStorage.instance.ref().child(path);
    var uploadTask = ref.putFile(file);

    final snapshot = await uploadTask.whenComplete(() => {});
    final uRL = await snapshot.ref.getDownloadURL();

    return uRL;
  }

  Future<bool> updateUserURLToFireStore(
    String imageURL,
  ) async {
    bool check = false;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(
          {
            'imageUrl': imageURL,
          },
        )
        .then((value) => check = !check)
        .catchError((onError) {
          Fluttertoast.showToast(msg: onError.toString());
          return check;
        });
    return check;
  }

  Future<String> getUserURLFromFireStore() async {
    String result = '';
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (value) {
        if (value.data() != null) {
          result = value.get("imageUrl");
        } else {
          result = '';
        }
      },
    ).catchError((onError) {
      Fluttertoast.showToast(msg: onError.toString());
    });
    return result;
  }

  Future<String> logOut() async {
    String result = '';
    await FirebaseAuth.instance.signOut();
    return result;
  }
}
