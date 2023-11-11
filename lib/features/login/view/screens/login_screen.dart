import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/database/local_database/cache_helper.dart';
import '../../../../../core/enums.dart';
import '../../../../../core/router/app_route.dart';
import '../../../../../core/styles/color.dart';
import '../../../../../core/widgets/ElvatedButton.dart';
import '../../../../../core/widgets/Line.dart';
import '../../../../../core/widgets/SocialButton.dart';
import '../../../../../core/widgets/TextFormField.dart';
import '../../../../../core/widgets/snack_bar.dart';
import '../../view_model/login_cubit.dart';


class LoginScreen extends StatefulWidget {
   const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 final TextEditingController usernameController= TextEditingController(text: CashHelper.getString(key: MySharedKeys.email));

 final TextEditingController passwordController= TextEditingController(text: CashHelper.getString(key: MySharedKeys.password));
 late LoginCubit cubit;
 var formKey=GlobalKey<FormState>();

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit= LoginCubit.get(context);

  }
   @override
  Widget build(BuildContext context) {

    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if(state is LoginSuccessState){
      CashHelper.putString(
          key: MySharedKeys.token, value: LoginCubit.get(context).loginModel?.token)
          .then((value) {
        CashHelper.putString(key: MySharedKeys.userId, value: LoginCubit.get(context).loginModel?.user?.id.toString()).then((value){
          print(LoginCubit.get(context).loginModel?.user?.id);
          print(LoginCubit.get(context).loginModel?.token);
          Navigator.pushNamedAndRemoveUntil(context, AppRoute.layoutScreen, (route) => false);
          CashHelper.putString(key: MySharedKeys.rememberMe, value: '${cubit.isChecked}');
        });



      });

      showSuccessSnackBar(context: context, message: 'Logged Successfully');
    }
    if(state is LoginErrorState){


      showErrorSnackBar(context: context, message: 'Please Try again');
    }
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.6.h),
            child: SvgPicture.asset("assets/images/auth/Logo (1).svg"),
          ),
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: AppTheme.neutral9,
                      fontSize: 28,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                ),
                const FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'Please login to find your dream job',
                    style: TextStyle(
                      color: AppTheme.neutral5,
                      fontSize: 16,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w400,

                    ),
                  ),
                ),
                SizedBox(height:4.h ,),
                CustomTextFormField(
                    controller: usernameController,
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return 'email must not be empty';
                      }
                      final bool isValid = EmailValidator.validate(value);
                      if (!isValid) {
                        return "please enter right email";
                      }
                      else{
                        return null;
                      }

                    },
                    hintText: "Email",
                    keyboardType: TextInputType.name,
                    prefixIcon: const Icon(Iconsax.user),
                  prefixIconColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.focused)
                      ? AppTheme.neutral9
                      : AppTheme.neutral3),
                  obscureText: false,

                ),
                SizedBox(height: 1.5.h,),
                CustomTextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password must be at least 8 characters';
                    }
                    if (value.length < 8) {


                      return 'Password must be at least 8 characters';
                    }

                    else{
                      return null;
                    }
                  },
                  controller: passwordController,
                  hintText: "Password",
                  prefixIcon: const Icon(Iconsax.lock),
                  prefixIconColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.focused)
                      ? AppTheme.neutral9
                      : AppTheme.neutral3),
                  suffixIcon: IconButton(onPressed: () {
                    cubit.changeIcon();
                  },
                    icon: cubit.obscure? const Icon(Iconsax.eye_slash): const Icon(Iconsax.eye),
                  ),
                  suffixIconColor:MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.focused)
                      ? AppTheme.neutral9
                      : AppTheme.neutral4),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: cubit.obscure,
                ),
                //SizedBox(height: 2.h,),

                Row(
                  children: [

                    Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                        value: cubit.isChecked,
                        activeColor: AppTheme.primary5,
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        side: const BorderSide(
                          color: AppTheme.neutral4,
                        ),
                        onChanged: (newValue){
                      cubit.changeCheckBox(newValue);
                    }),
                    const FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'Remember me',
                        style: TextStyle(
                          color: AppTheme.neutral8,
                          fontSize: 14,
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Spacer(),
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, AppRoute.forgetPasswordScreen);
                    },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: AppTheme.primary5,
                            fontSize: 14,
                            fontFamily: 'SFProDisplay',
                            fontWeight: FontWeight.w400,
                          ),
                        )),

                  ],
                ),
                SizedBox(height: 15.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'Dont’t have an account?',
                        style: TextStyle(
                          color: AppTheme.neutral4,
                          fontSize: 14,
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w500,

                        ),
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, AppRoute.registerScreen);
                    },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            color: AppTheme.primary5,
                            fontSize: 14,
                            fontFamily: 'SFProDisplay',
                            fontWeight: FontWeight.w500,
                          ),
                        )),

                  ],
                ),
                SizedBox(height: 2.h,),
                CustomElevatedButton(
                        () {
                          if(formKey.currentState!.validate()){
                            cubit.userLogin(email: usernameController.text, password: passwordController.text);
                            CashHelper.putString(key: MySharedKeys.email, value: usernameController.text);
                            CashHelper.putString(key: MySharedKeys.password, value: passwordController.text);
                          }

                        },

                    "Login"),
                SizedBox(height: 2.h,),
                Visibility(
                    visible: state is LoginLoadingState,
                    child: Center(
                      child: Column(
                        children: [
                          const CircularProgressIndicator(color: AppTheme.primary5,),
                          SizedBox(height: 2.h,),

                        ],
                      ),
                    )),

                 Row(
                  children: [
                    Expanded(child: line()),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 2.h),
                      child: const Text(
                        'Or Login With Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppTheme.neutral5,
                          fontSize: 14,
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Expanded(child: line()),
                  ],
                ),
                SizedBox(height: 2.h,),
                Row(
                  children: [
                    Expanded(
                      child: CustomSocialButton("assets/images/icons/google.png",
                              () { },
                          "Google"
                      ),
                    ),
                    SizedBox(width: 2.w,),
                    Expanded(child: CustomSocialButton("assets/images/icons/Facebook.png", () { }, "Facebook")),
                  ],
                ),



              ],
            ),
          ),
        ),
      ),


    );
  },
);
  }
}
