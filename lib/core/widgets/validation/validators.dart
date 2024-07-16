class UserValidation {


  String? validateInputPassword(String? value, String label, bool isPassword) {
    if (value == null || value.isEmpty) {
      return 'Please enter $label';
    }
    return null;
  }
}
