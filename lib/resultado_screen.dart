import 'package:flutter/material.dart';
import 'package:unisagradoapp/api_service.dart';

class ResultadoScreen extends StatefulWidget {
  const ResultadoScreen({Key? key}) : super(key: key);

  @override
  _ResultadoScreenState createState() => _ResultadoScreenState();
}

class _ResultadoScreenState extends State<ResultadoScreen> {
  late Future<String> _result;

  @override
  void initState() {
    super.initState();

    _result =
        ApiService().getChatGptResponse("Quantas bolas de ouro tem o messi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text("Texto Gerado"),
        ),
        body: FutureBuilder(
            future: _result,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Deu ruim");
              } else {
                return Text(snapshot.data!);
              }
            })
    );
  }
}
