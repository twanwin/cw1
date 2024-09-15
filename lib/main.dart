import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  bool _showFirstImage = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _toggleImage() {
    setState(() {
      _showFirstImage = !_showFirstImage;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: _incrementCounter,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    color: Colors.deepPurple, width: 2),
              ),
              child: const Text('Increment Counter'),
            ),
            const SizedBox(height: 20),
            _showFirstImage
                ? Image.asset(
                    'assets/image1.jpg',
                    width: 150,
                    height: 150,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Text('Failed to load image 1');
                    },
                  )
                : Image.asset(
                    'assets/image2.jpg',
                    width: 150,
                    height: 150,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Text('Failed to load image 2');
                    },
                  ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: _toggleImage,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    color: Colors.deepPurple, width: 2),
              ),
              child: const Text('Swap Image'),
            ),
          ],
        ),
      ),
    );
  }
}