import 'package:flutter/material.dart';
import 'package:flutterblognew/widgets/loader.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State createState() {
    return _MyProfileState();
  }
}

class _MyProfileState extends State<MyProfile> {
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool hasImage = true;
    bool isLoading = false;

    Widget content = Stack(
      clipBehavior: Clip.none, // allows the icon to overflow the circle
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.amber,
          child: Text(
            'JA',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        Positioned(
          bottom: -2, // slightly outside the CircleAvatar
          right: -2, // slightly outside the CircleAvatar
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue, // background of the camera icon
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ), // optional white border
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0), // smaller padding for icon
              child: Icon(Icons.camera_alt, size: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );

    if (hasImage) {
      content = CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage('https://placehold.co/600x400'),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 15),
            content,
            const SizedBox(height: 15),
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name is required';
                }

                return null;
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? () {} : () {},
                child: isLoading
                    ? Loader(message: 'Submitting ...')
                    : Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
