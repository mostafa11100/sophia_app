class ExeptionsFirebase {
  String? eror;
  ExeptionsFirebase(String error) {
    eror = error;
  }
  factory ExeptionsFirebase.fromejson(error) {
    switch (error) {
      case "email-already-in-use":
        return ExeptionsFirebase("The account already exists for that email");

      case "invalid-email":
        return ExeptionsFirebase("not correct email");

      case "operation-not-allowed":
        return ExeptionsFirebase("please try again");

      case "weak-password":
        return ExeptionsFirebase("password weak please enter strong password");
      case "storage/unknown":
        return ExeptionsFirebase("server error");
      case "storage/object-not-found":
        return ExeptionsFirebase(error);
      case "firebase_auth/invalid-email":
        return ExeptionsFirebase("The email address is badly formatted");
      default:
        return ExeptionsFirebase(error);
    }
  }
}
