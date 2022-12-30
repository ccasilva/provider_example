import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/produto_model.dart';
import 'package:provider_example/provider/produto_widget.dart';
import 'package:provider_example/provider/user_model.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserModel>(context);
    //.red ele vai retornar uma instancia sem ficar escutando alterações
    //var user = context.read<UserModel>();
    //var user = context.watch<UserModel>();
    /*var imageAvatar =
        context.select<UserModel, String>((usermodel) => usermodel.imgAvatar);*/
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.imgAvatar),
                radius: 60,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(user.name),
                  Text('(${user.birthDate})'),
                ],
              ),
              Provider(
                create: (_) => ProdutoModel(nome: 'Academia do Flutter'),
                child: const ProdutoWiget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
