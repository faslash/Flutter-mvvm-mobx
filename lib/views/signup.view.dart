import 'package:flutter/material.dart';
import 'package:mvvm/controllers/signup.controller.dart';
import 'package:mvvm/stores/app.store.dart';
import 'package:mvvm/view-models/signup.viewmodel.dart';
import 'package:mvvm/views/home.view.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();

  final _controller = new SignupController();

  final model = new SignupViewModel();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text("Cadastre-se"),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nome Inválido';
                  }
                  return null;
                },
                onSaved: (val) {
                  model.name = val!;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email Inválido';
                  }
                  return null;
                },
                onSaved: (val) {
                  model.email = val!;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Senha Inválida';
                  }
                  return null;
                },
                onSaved: (val) {
                  model.password = val!;
                },
              ),
              SizedBox(
                height: 20,
              ),
              model.busy
                  ? Center(
                      child: Container(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.black,
                      )),
                    )
                  : TextButton(
                      child: Text("Cadastrar"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }

                        setState(() {
                          _controller.create(model).then((data) => {
                                // TODO:
                                store.setUser(data.name, data.email,
                                    data.picture, data.token),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeView()))
                              });
                        });
                      },
                    )
            ],
          ),
        ),
      )),
    );
  }
}
