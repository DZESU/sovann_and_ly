import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:sovann_and_ly/app.dart';
import 'package:sovann_and_ly/firebase_options.dart'; // For date formatting

class MessageSection extends StatefulWidget {
  final String? username;

  const MessageSection({Key? key, this.username}) : super(key: key);

  @override
  _MessageSectionState createState() => _MessageSectionState();
}

class _MessageSectionState extends State<MessageSection> {
  final TextEditingController _controller = TextEditingController();
  final Client _client = Client();
  late final Databases _databases;

  // Replace these with your AppWrite details
  final String _endpoint = 'https://cloud.appwrite.io/v1';
  final String _projectId = '674b3cc10020b36635dc';
  final String _databaseId = '674b3d0b001f90145af7';
  final String _collectionId = '674b3dc40003c72fd5e3';
  List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();
    _client
        .setEndpoint(_endpoint) // Set your API Endpoint
        .setProject(_projectId); // Set your project ID
    _databases = Databases(_client);
    _fetchMessages();
  }

  Future<void> _saveData(String text) async {
    try {
      await _databases.createDocument(
        databaseId: _databaseId,
        collectionId: _collectionId,
        documentId: 'unique()', // Use 'unique()' to generate an ID
        data: {
          'message': text,
          'name': widget.username,
          'timestamp': _formatTimestamp(DateTime.now())
        }, // The data to save
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data saved successfully!')),
      );
      _fetchMessages();
      _controller.clear(); // Clear the input field
    } catch (e, s) {
      print(e);
      debugPrintStack(stackTrace: s);

    }
  }

  String _formatTimestamp(DateTime? dateTime) {
    if (dateTime == null) return "N/A";
    return DateFormat('yyyy/MM/dd').add_jm().format(dateTime);
  }

  Future<void> _fetchMessages() async {
    try {
      final response = await _databases.listDocuments(
        databaseId: _databaseId,
        collectionId: _collectionId,
      );
      setState(() {
        _messages = response.documents.map((doc) => doc.data).toList();
      });
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Failed to fetch messages: $e')),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          if(widget.username != null)
          IntrinsicHeight(
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Wishes for us 💕",
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _saveData(_controller.text),
                  child: Center(
                      child: Icon(
                    Symbols.favorite,
                    fill: 1,
                    color: mainColor,
                  )),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          if(_messages.isEmpty)
            Text("Be the first to send us your message 🥰", style: baseTextStyle,),
          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _messages.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final message = _messages[index];
              final content = message['message'] ?? "N/A";
              final username = message['name'] ?? "Anonymous";
              final timestamp = message['timestamp'];

              return ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 4),
                title: Text("$username • ${(timestamp)}",
                    style: TextStyle(
                        fontSize: 14, color: Colors.black.withOpacity(.6))),
                subtitle: Text(
                  content,
                  style: baseTextStyle.copyWith(fontSize: 18),
                ),
              );
            },
          )
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
