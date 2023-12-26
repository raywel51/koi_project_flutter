import 'package:flutter/material.dart';
import 'package:koi_project/pages/profile_setting_page.dart';

import '../widget/AvatarWithEditIcon.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          const Column(
            children: [
              Stack(
                children: [
                  AvatarWithEditIcon(
                    imageUrl:
                    "https://cdn.discordapp.com/attachments/750292077983563778/1188852907538399232/Screenshot_2023-12-25-21-34-47-821_jp.naver.line.android.jpg?ex=659c088c&is=6589938c&hm=e77c8bb74bb4e6de54f9ae13452d62d849bbcf013774e8334cefd48532c5c3da&",
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Column(
            children: [
              Stack(
                children: [
                  Text(
                    'Kotchakorn Sangkawud',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(right: 20.0), // Set the right margin here
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF800080)),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(150.0, 50.0), // Set the width and height of the button
                  ),
                ),
                onPressed: () {
                  const snackBar = SnackBar(
                    content: Text('Yay! A SnackBar!'),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text('345Pt.'),
              ),
            ),
          ),
          const SizedBox(height: 40),
          ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.edit_rounded, color: Colors.purple),
                SizedBox(width: 8),
                Text('Edit Profile'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileSettingPage()),
              );
            },
            tileColor: Colors
                .transparent, // Set the background color to your preference
          ),
          ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock, color: Colors.purple),
                SizedBox(width: 8),
                Text('Change Password'),
              ],
            ),
            onTap: () {
              // Action for Change Password
            },
            tileColor: Colors
                .transparent, // Set the background color to your preference
          ),
          ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.info, color: Colors.purple),
                SizedBox(width: 8),
                Text('Information'),
              ],
            ),
            onTap: () {

            },
            tileColor: Colors
                .transparent, // Set the background color to your preference
          ),
          ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.update,
                    color: Colors.purple), // Changing icon color to purple
                SizedBox(width: 8),
                Text('Update'),
              ],
            ),
            onTap: () {
              // Action for Update
            },
            tileColor: Colors
                .transparent, // Set the background color to your preference
          ),
          ListTileTheme(
            selectedColor: Colors.blue, // Highlight color when selected
            child: ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 8),
                  Text('Logout', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              onTap: () {
                // Action for Logout
              },
              tileColor: Colors.transparent,
              selected: true, // Set this to true to make it highlighted
            ),
          ),
        ],
      ),
    );
  }
}
