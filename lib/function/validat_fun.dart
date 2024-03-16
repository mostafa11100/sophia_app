import 'package:flutter/material.dart';

bool validatfunc(GlobalKey<FormState> formk) {
  if (formk.currentState!.validate()) {
    return true;
  }
  return false;
}
