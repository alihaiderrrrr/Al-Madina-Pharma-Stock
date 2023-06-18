import 'package:flutter/material.dart';
import 'Dashboard.dart';
import 'components/my_button.dart';
import 'components/my_textfield.dart';
import 'components/square_title.dart';
import 'login.dart';
import 'package:http/http.dart' as http;
import 'Global/global.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  // text editing controllers
  final FirstNameController = TextEditingController();
  final LastNameController = TextEditingController();
  final PhoneController = TextEditingController();
  final EmailController = TextEditingController();

  void dispose() {
    FirstNameController.dispose();
    LastNameController.dispose();
    PhoneController.dispose();
    EmailController.dispose();
  }

// Define your API endpoint

  final String signupUrl = '$service_url/signup';

// Define the signup function
  Future<void> signUp(BuildContext context) async {
    String firstname = FirstNameController.text;
    String lastname = LastNameController.text;
    String phone = PhoneController.text;
    String email = EmailController.text;

    Map<String, dynamic> myValues = {
      'firstname': firstname,
      'lastname': lastname,
      'phone': phone,
      'email': email
    };

    // print(firstname + '/n' + lastname + '/n' + phone + '/n' + email);

    FirstNameController.clear();
    LastNameController.clear();
    PhoneController.clear();
    EmailController.clear();

    // Create the request body

    Map<String, String> body = {'email': email};

    // Send the POST request

    http.Response response = await http.post(Uri.parse(signupUrl), body: body);

    // String verificationCode = response.body['verification'];
    // Handle the response

    if (response.statusCode == 200) {
      print('working and email is sent from Flutter');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Verfication(),
          settings: RouteSettings(arguments: myValues),
        ),
      );
    } else if (response.statusCode == 400) {
      print('error 400');
    } else {
      print('error failed ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 20),

                // logo
                // const Icon(
                //   Icons.lock,
                //   size: 100,
                // ),
                Image.asset('assets/images/log.png'),

                const SizedBox(height: 5),

                // welcome back, you've been missed!
                Text(
                  'SignUp Here ..',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: FirstNameController,
                  hintText: 'First Name',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield

                MyTextField(
                  controller: LastNameController,
                  hintText: 'Last Name',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                MyTextField(
                  controller: PhoneController,
                  hintText: 'Phone',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                MyTextField(
                  controller: EmailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text('Login'),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                GestureDetector(
                  onTap: () => signUp(context),
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 174, 255),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//  Verfication

class Verfication extends StatefulWidget {
  const Verfication({super.key});

  @override
  State<Verfication> createState() => _VerficationState();
}

class _VerficationState extends State<Verfication> {
  final verificationController = TextEditingController();

  // sign user in method
  void Verify(BuildContext context) {
    // Retrieve the arguments passed from the source screen
    final Map<String, dynamic> receivedValues =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    print(' $receivedValues   routing');
    String verification = verificationController.text;

    print(verification);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SetPassword(),
        settings: RouteSettings(arguments: receivedValues),
      ),
    );
  }

  void dispose() {
    verificationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: SafeArea(
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                  SizedBox(height: 65),

                  // logo
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),

                  const SizedBox(height: 25),

                  // username textfield
                  MyTextField(
                    controller: verificationController,
                    hintText: 'Verification Code',
                    obscureText: false,
                  ),
                  const SizedBox(height: 25),

                  // sign in button
                  GestureDetector(
                    onTap: () => Verify(context),
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 46, 16, 116),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ])))));
  }
}

//  Set Password

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  _SetPasswordState createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  final passwordController = TextEditingController();
  final ConfirmPasswordController = TextEditingController();

  void dispose() {
    passwordController.dispose();
    ConfirmPasswordController.dispose();
  }

  final String Node_url = '$service_url/InsertUser';

// Define the signup function

  Future<void> setPassword(BuildContext context) async {
    final Map<String, dynamic> receivedValues =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String password = passwordController.text;
    String Confirmpassword = ConfirmPasswordController.text;

    // Create the request body
    String firstname = receivedValues['firstname'];
    String lastname = receivedValues['lastname'];
    String phone = receivedValues['phone'];
    String email = receivedValues['email'];

    print(firstname + lastname + phone + email + 'Insert User');

    Map<String, String> body = {
      'firstname': firstname,
      'lastname': lastname,
      'phone': phone,
      'email': email,
      'password':password
    };
    print('$body  body ???????????');
    // Send the POST request

    http.Response response = await http.post(Uri.parse(Node_url), body: body);

    if (response.statusCode == 200) {
      print('Register Successfully');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    } else if (response.statusCode == 400) {
      print('error 400');
    } else {
      print('error failed ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: SafeArea(
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                  SizedBox(height: 65),

                  // logo
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),

                  const SizedBox(height: 25),

                  // username textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: ConfirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 25),

                  // sign in button
                  GestureDetector(
                    onTap: () => setPassword(context),
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 46, 16, 116),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ])))));
  }
}
