String? validatemail(String? text) {
  if (text == "") {
    return "email can't be null";
  }
  return null;
}

String? validatname(String? text) {
  if (text == "") {
    return "name can't be null";
  }
  return null;
}

String? validatpass(String? text) {
  if (text == "" || text!.length < 6) {
    return "password can't be less than 4";
  }
  return null;
}
