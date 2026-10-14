import 'package:flutter/material.dart';
import 'package:projeto/tip_calculator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Primeiro App Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'Projeto Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  int _soma = 0;

  void _calcularSoma() {
    setState(() {
      _soma = int.parse(_controller1.text)+int.parse(_controller2.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            TextField(
              controller: _controller1,
              decoration: InputDecoration(
                labelText: 'digite um número',
                hintText: 'Um número',
                border: OutlineInputBorder()
              )
              ,),
            SizedBox(height: 20),
            TextField(
              controller: _controller2,
              decoration: InputDecoration(
                labelText: 'digite um número',
                hintText: 'Um número',
                border: OutlineInputBorder()
              )
              ,),
              SizedBox(height: 20),
              Text(
                'a soma é $_soma',
                style: const TextStyle(fontSize:24, fontWeight: FontWeight.bold)
              ),
              ElevatedButton(
              onPressed: (){
                Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => const TipCalculator()),
                );
              }, child: const Text('Calculadora de gorjeta')
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _calcularSoma,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
