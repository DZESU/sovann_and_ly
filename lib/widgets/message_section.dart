import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:sovann_and_ly/app.dart'; // For date formatting

class MessageSection extends StatefulWidget {
  final String username;

  const MessageSection({Key? key, required this.username}) : super(key: key);

  @override
  _MessageSectionState createState() => _MessageSectionState();
}

class _MessageSectionState extends State<MessageSection> {
  final TextEditingController _controller = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _saveToFirestore(String text) async {
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Text cannot be empty!")),
      );
      return;
    }

    try {
      await _firestore.collection('messages').add({
        'username': widget.username,
        'content': text,
        'timestamp': FieldValue.serverTimestamp(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Message saved!")),
      );
      _controller.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to save: $e")),
      );
    }
  }

  String _formatTimestamp(Timestamp? timestamp) {
    if (timestamp == null) return "N/A";
    final DateTime dateTime = timestamp.toDate();
    return DateFormat('yyyy/MM/dd').add_jm().format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Wishes for us 💕",
                      // suffixIcon: IconButton(
                      //   icon: Icon(Icons.send),
                      //   onPressed: () => _saveToFirestore(_controller.text),
                      // ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _saveToFirestore(_controller.text),
                  child: Center(child: Icon(Symbols.favorite,fill: 1,color: mainColor,)),
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          StreamBuilder<QuerySnapshot>(
            stream: _firestore
                .collection('messages')
                .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text("No messages found."));
              }

              final messages = snapshot.data!.docs;

              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: messages.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final content = message['content'] ?? "N/A";
                  final username = message['username'] ?? "Anonymous";
                  final timestamp = message['timestamp'] as Timestamp?;

                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 4),
                    title: Text("$username • ${_formatTimestamp(timestamp)}",
                        style: TextStyle(
                            fontSize: 14, color: Colors.black.withOpacity(.6))),
                    subtitle: Text(
                      content,
                      style: baseTextStyle.copyWith(fontSize: 18),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
