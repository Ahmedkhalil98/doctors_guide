String? validInput(String val, int max, String type) {
  if (val.isEmpty) {
    return "لا يمكن ان يكون فارغا";
  }

  if (val.length > max) {
    return "لا يمكن أن يكون أكبر من 10 أرقام";
  }

  return null;
}
