import 'package:exercise_login_api/products.dart';
import 'package:exercise_login_api/shop.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Store'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum AuthGroup {ADMIN, CLIENT}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  AuthGroup? _current = AuthGroup.CLIENT;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(""),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:80.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("LOGIN", style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,  
                  ),
                )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: _username,
                  decoration: InputDecoration(
                    icon: Icon(Icons.people),
                    label: Text("Username"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: _password,
                  obscureText: true,
                  autocorrect: false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.key_rounded),
                    label: Text("Password"),
                    
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 180,
                    height: 40,
                    child: ListTile(
                      title: Text("Admin"),
                      leading: Radio<AuthGroup>(
                        value: AuthGroup.ADMIN,
                        groupValue: _current,
                        onChanged: (AuthGroup? value){
                          setState(() {
                            _current = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    height: 35,
                    child: ListTile(
                      title: Text("Cliente"),
                      leading: Radio<AuthGroup>(
                        value: AuthGroup.CLIENT,
                        groupValue: _current,
                        onChanged: (AuthGroup? value){
                          setState(() {
                            _current = value;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: 
                    ElevatedButton(
                      onPressed: (){
                        if(_username.text.toString() == "adm" && _password.text.toString() == "123"){
                          if(_current == AuthGroup.ADMIN){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> MyProductPage()));
                          }else{
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> MyShopPage()));
                          }
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Usuário ou senha inválidos")));
                        }
                      },
                      style: ButtonStyle(
                        alignment: Alignment.center,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.login),
                          Text("LOGAR")
                        ],
                      ),
                    )
                    ,),
                    Padding(
                    padding: EdgeInsets.all(15.0),
                    child: 
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          _username.text = '';
                          _password.text = '';
                        });
                      },
                      style: ButtonStyle(
                        alignment: Alignment.center,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.cleaning_services),
                          Text("LIMPAR")
                        ],
                      ),
                    )
                    ,),
                ],
              )
            ]
          ),
      ),
    );
  }
}
