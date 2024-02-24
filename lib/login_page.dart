import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
     TextEditingController _emailController = TextEditingController();

     TextEditingController _passwordController = TextEditingController();
     bool isObsecure = false;
GlobalKey<FormState> _formkey= GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: Container(
         width: double.infinity,
        decoration: BoxDecoration(

          image: DecorationImage(image: AssetImage("lib/images/background.webp",),fit: BoxFit.cover),
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              radius: 25,
              child: Icon(Icons.arrow_back_ios),),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Welcome \nback",style: TextStyle(fontSize: 30),),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
            ),
            height: 550,

            child: Form(
              key: _formkey,
              child: Column(
                children: [

                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: TextFormField(
                       textInputAction: TextInputAction.next,
                       validator: (value) {
                         if(value!.isEmpty){
                           return "Email can't be null";
                         }
                         if(value.length<10){
                           return "Invalid email";
                         }
                         if(!value.contains('@')){
                           return "not valid";
                         }

                       },

                       cursorColor: Colors.blue,

                       controller: _emailController,

                       decoration: InputDecoration(
                         fillColor: Colors.blue.withOpacity(.1),
                         filled: true,
                         focusColor: Colors.blue,
                         prefixIcon: Icon(Icons.email,color: Colors.blue,),
                         hintText: "Enter your email",
                         hintStyle: TextStyle(fontWeight: FontWeight.w700,color: Colors.black54),



                         focusedBorder: OutlineInputBorder(

                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide(

                             color: Colors.blue,
                           ),

                         ),
                         enabledBorder: OutlineInputBorder(

                           borderRadius: BorderRadius.circular(20),
                           borderSide: BorderSide(
                             color: Colors.blue,
                           ),

                         ),
                       ),

                     ),
                   ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Password can't be null";
                        }
                        if(value.length<8){
                          return "Password can't be less than 8 character";
                        }
                        if (!value.contains(RegExp(r'[A-Z]'))) {
                          return '• Uppercase letter is missing';
                        }
                        if (!value.contains(RegExp(r'[a-z]'))){
                          return '• Lowercase letter is missing';
                        }
                        if(!value.contains(RegExp(r'[0-9]'))){
                          return 'Digit missing';
                        }
                        if (!value.contains(RegExp(r'[_!@#%^&*(),.?":{}|<>]'))) {
                          return '• Special character is missing.';
                        }

                      },
                      onEditingComplete: () {
                        if(_formkey.currentState!.validate()){
                          print("succes");
                        }
                      },
                      obscureText: isObsecure,
                      cursorColor: Colors.blue,

                      controller: _passwordController,

                      decoration: InputDecoration(
               filled: true,
                        fillColor: Colors.lightBlueAccent.withOpacity(.1),
                        suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye_outlined),
                          onPressed: (){
                            setState(() {
                              isObsecure=!isObsecure;
                            });
                          },),
                        focusColor: Colors.blue,
                        prefixIcon: Icon(Icons.password,color: Colors.blue,),
                        hintText: "Enter your password",
                        hintStyle: TextStyle(fontWeight: FontWeight.w700,color: Colors.black54),


                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        focusedBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(

                            color: Colors.blue,
                          ),

                        ),
                        enabledBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),


                         ),
                      ),

                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(onPressed: (){

                    }, child: Text("Forget Password?")),
                  ),
                  Spacer(),
                  MaterialButton(onPressed: (){
                    if(_formkey.currentState!.validate()){
                     print("succesful");
                    }
                  },child: Text("Sign in",),minWidth: 200,color: Colors.blue,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),

                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: RichText(text: TextSpan(text: "If don't have an account",
                        style: TextStyle(color: Colors.black54,fontSize: 12),
                        children: [
                      TextSpan(text: "Sign up",
                      style: TextStyle(color: Colors.blue,fontSize: 15)
                      )
                    ]),),
                  ),

                ],
              ),
            ),

          ),

        ],
      ),

      ),
    );
  }
}
