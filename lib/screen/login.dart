import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  // Form username & password
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Email',
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          // controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Password',
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          //  controller: _passController,
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.popUntil(context, (route) => false);
                              Navigator.pushNamed(context, '/root');
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const <Widget>[
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'OR',
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/root');
                    },
                    child: const Text(
                      'Login with Google',
                    ),
                  ),
                  const SizedBox(height: 30),
                ]),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      'Don\'t have account ?',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.popAndPushNamed(context, '/register'),
                      child: const Text(
                        'Register here',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
