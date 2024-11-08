import 'package:flutter/material.dart';
import 'package:unisagradoapp/resultado_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({ Key? key }) : super(key: key);
  
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {

  void gerar (){
    String prompt = "Gere uma historia de computação";

    Navigator.push(context, MaterialPageRoute(builder: (context) => const ResultadoScreen()));
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(
              backgroundColor: Colors.blueGrey,
              title: const Text("Input"),
            ),
            body: Column(
              children: [
                  const TextField(
                    decoration: InputDecoration(labelText: "Digite para o ChatGPT", border: OutlineInputBorder()),
                  ), 
                  ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ResultadoScreen()));
                  }, child: const Text("Gerar")),

                ] 
              ),
    );
  }
}