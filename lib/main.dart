import 'package:flutter/material.dart';

void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp ({super.key});

@override
  Widget build(BuildContext context){
    return MaterialApp (
        debugShowCheckedModeBanner: false,
    home: TextInputPage()
        );
    }
}

class TextInputPage extends StatefulWidget {
    const TextInputPage({super.key});


@override
 State<TextInputPage> createState() => _TextInputPageState();
}
class _TextInputPageState extends State<TextInputPage> {

final TextEditingController textController =TextEditingController();

 String displayedText = '';

 void displayText() {
    setState(() {
      displayedText = textController.text.trim();
    });
 }

@override
void dispose(){
    textController.dispose();
    super.dispose();
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Text Input Example'),
            backgroundColor: Color.fromARGB(255, 40, 139, 0),
            foregroundColor: Colors.black,
        ),
        body: Padding(padding: const EdgeInsets.all(20),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                const Text(
                    'Enter a Message',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    labelText: 'Type something Here',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.edit),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: displayText, child: const Text('Display Text'),),

                const Text('output', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10),

                Text(displayedText.isEmpty
                ? 'No Text Entered Yet!'
                : displayedText, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),)
            ],
        ),)
    );
}
}