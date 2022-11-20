import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginFB extends StatefulWidget {
  const LoginFB({Key? key}) : super(key: key);

  @override
  State<LoginFB> createState() => _LoginFBState();
}

class _LoginFBState extends State<LoginFB> {
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool _checking = true;

  bool _isLoggedIn = false ;
  Map _userObj = {};


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkIfisLoggedIn();
  }

  _checkIfisLoggedIn() async {
    final accessToken = await FacebookAuth.instance.accessToken;

    setState(() {
      _checking = false;
    });

    if(accessToken != null){
      print(accessToken.toJson());
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;
      setState(() {
        _checking = false;
      });
    }else{
      _login();
    }
  }

  _login() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if(result.status == LoginStatus.success){
      _accessToken = result.accessToken;

      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
    }else{
      print(result.status);
      print(result.message);
    }
    setState(() {
      _checking = false;
    });
  }

  _logOut() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login FB'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: _isLoggedIn == true ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_userObj['name']),
            Text(_userObj['email']),
            const SizedBox(height: 20,),
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('${_userObj['picture']['data']['url']}'),
            ),
            TextButton(onPressed: (){
              FacebookAuth.instance.logOut().then((value)  {
                setState(() {
                  _isLoggedIn = false;
                  _userObj = {};
                });
              });
            }, child: Text('Logout')),
          ],
        ) :  Center(child: ElevatedButton(
            onPressed: () async {
          FacebookAuth.instance.login(
            permissions: ["public_profile", "email"]
          ).then((value) {
            FacebookAuth.instance.getUserData().then((userData) async {
              setState(() {
                _isLoggedIn = true;
                _userObj = userData;
              });
            });
          });
        }, child: Text('Login with Facebook')),),
      ),
    );
  }
}
