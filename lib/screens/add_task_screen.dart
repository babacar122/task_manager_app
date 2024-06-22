import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';


class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedStatus = 'To Do';

  final List<String> _statuses = ['To Do', 'In Progress', 'Done', 'Bug'];
  final Map<String, Color> _statusColors = {
    'To Do': Colors.grey,
    'In Progress': Colors.blue,
    'Done': Colors.green,
    'Bug': Colors.red,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter Tache'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              maxLines: null, // Allows the TextField to expand vertically
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedStatus,
              items: _statuses.map((String status) {
                return DropdownMenuItem<String>(
                  value: status,
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: _statusColors[status],
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(status),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedStatus = newValue!;
                  print(_selectedStatus);
                });
              },
              decoration: const InputDecoration(labelText: 'Status'),
            ),
            const SizedBox(height: 20),
          Container(
  width: double.infinity,
  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
  decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(12),
  ),
  child: ElevatedButton(
    onPressed: () async {
      final title = _titleController.text;
      final description = _descriptionController.text;
      final task = Task(
        id: FirebaseFirestore.instance.collection('tasks').doc().id,
        title: title,
        description: description,
        status: _selectedStatus,
      );
      await FirebaseFirestore.instance
          .collection('tasks')
          .doc(task.id)
          .set(task.toMap());
      Navigator.of(context).pop();
    },
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: const Text(
        'Enregistrer tache',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    ),
  ),
)

,
          ],
        ),
      ),
    );
  }
}