import 'package:flutter/material.dart';

class RegisterInput {
   TextEditingController userNameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   TextEditingController confirmPasswordController =
      TextEditingController();
   TextEditingController phoneController = TextEditingController();
   GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
