import 'package:flutter/material.dart';

class ChataPage extends StatefulWidget {
  const ChataPage({super.key});

  @override
  State<ChataPage> createState() => _ChataPageState();
}

class _ChataPageState extends State<ChataPage> {
  final TextEditingController _messageController = TextEditingController();

  /// Store messages
  final List<String> _messages = [];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add(_messageController.text.trim());
    });

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: Padding(
          padding: const EdgeInsets.all(7.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://imgs.search.brave.com/Og97rlCtAbIWey3gMJkumYk-NCJ130-my1qr4pgRrYc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jb250/ZW50Lm1hZ251bXBo/b3Rvcy5jb20vd3At/Y29udGVudC91cGxv/YWRzLzIwMTYvMTEv/Y29ydGV4L3BhcjE0/NjYzMS10ZWFzZXIt/eHhsLmpwZw',
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Name", style: TextStyle(color: Colors.black)),
            Text(
              'Graphic Designer',
              style: TextStyle(color: Colors.black, fontSize: 10),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          /// Chat messages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _messages[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),

          /// Message input
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onFieldSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _sendMessage,
                  child: const CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
