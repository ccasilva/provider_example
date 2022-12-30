import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/change_notifier/provider_controller.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  @override
  void initState() {
    super.initState();
    //Depois que carregar os dados da tela
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 2));
      context.read<ProviderController>().alterarDados();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Utilizando o consumer evito que ele builda(Reconstrua toda minha tela)
              /*Consumer<ProviderController>(builder: (_, controller, __) {
                return CircleAvatar(
                  backgroundImage: NetworkImage(controller.imgAvatar),
                  radius: 60,
                );
              }),*/
              //Utilizando o Selector, é buildado apenas o item alterado
              Selector<ProviderController, String>(
                builder: (_, imgAvatar, __) {
                  return CircleAvatar(
                    backgroundImage: NetworkImage(imgAvatar),
                    radius: 60,
                  );
                },
                selector: (_, controller) => controller.imgAvatar,
                //Com esse parametro voce tem o controle de builda ou nao.
                //shouldRebuild: (previous,next){
                //  return true;
                //},
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Text(context.watch<ProviderController>().name),
                  //Text('(${context.watch<ProviderController>().birthDate})'),

                  //Utilizando o consumer evito que ele builda(Reconstrua toda minha tela)
                  //Consumer<ProviderController>(builder: (_, controller, __) {
                  //  return Text(controller.name);
                  //}),
                  //Utilizando o consumer evito que ele builda(Reconstrua toda minha tela)
                  //Consumer<ProviderController>(builder: (_, controller, __) {
                  //  return Text('(${controller.birthDate})');
                  //}),

                  //Utilizando o Selector, é buildado apenas o item alterado
                  Selector<ProviderController, String>(
                    builder: (_, name, __) {
                      return Text(name);
                    },
                    selector: (_, controller) => controller.name,
                    //Com esse parametro voce tem o controle de builda ou nao.
                    //shouldRebuild: (previous,next){
                    //  return true;
                    //},
                  ),

                  //Utilizando o Selector, é buildado apenas o item alterado
                  Selector<ProviderController, String>(
                    builder: (_, birthDate, __) {
                      return Text('(${birthDate})');
                    },
                    selector: (_, controller) => controller.birthDate,
                    //Com esse parametro voce tem o controle de builda ou nao.
                    //shouldRebuild: (previous,next){
                    //  return true;
                    //},
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<ProviderController>().alterarNome();
                },
                child: const Text('Alterar nome'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
