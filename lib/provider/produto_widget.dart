import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/produto_model.dart';

class ProdutoWiget extends StatelessWidget {
  const ProdutoWiget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text(
        context.read<ProdutoModel>().nome,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
