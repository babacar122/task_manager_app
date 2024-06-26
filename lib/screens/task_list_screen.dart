import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  String _selectedStatus = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste de tache',
          style:  TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      actions: [
  PopupMenuButton<String>(
    onSelected: (String value) {
      setState(() {
        _selectedStatus = value;
      });
    },
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
      const PopupMenuItem<String>(
        value: 'All',
        child: Text(
          'All',
          style: TextStyle(color: Colors.white),
        ),
      ),
      const PopupMenuItem<String>(
        value: 'To do',
        child: Text(
          'To do',
          style: TextStyle(color: Colors.white),
        ),
      ),
      const PopupMenuItem<String>(
        value: 'In Progress',
        child: Text(
          'In Progress',
          style: TextStyle(color: Colors.white),
        ),
      ),
      const PopupMenuItem<String>(
        value: 'Done',
        child: Text(
          'Done',
          style: TextStyle(color: Colors.white), 
        ),
      ),
       const PopupMenuItem<String>(
        value: 'Bug',
        child: Text(
          'Bug',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
    icon: const Icon(Icons.more_vert, color: Colors.white),
    color: Colors.black, 
  ),
],

      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final tasks = snapshot.data!.docs.map((doc) {
            return Task.fromMap(doc.data() as Map<String, dynamic>);
          }).toList();

          List<Task> filteredTasks = tasks;
          if (_selectedStatus != 'All') {
            print(_selectedStatus);
            filteredTasks = tasks.where((task) => task.status == _selectedStatus).toList();
          }

          return ListView.builder(
            itemCount: filteredTasks.length,
            itemBuilder: (context, index) {
              return TaskItem(task: filteredTasks[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}