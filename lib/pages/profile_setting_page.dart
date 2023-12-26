import 'package:flutter/material.dart';
import 'package:koi_project/helper/SharedPreferencesHelper.dart';

import '../model/user_data_model.dart';
import '../services/api_service.dart';
import '../widget/AvatarWithEditIcon.dart';
import '../widget/DateInputWidget.dart';

class ProfileSettingPage extends StatefulWidget {
  const ProfileSettingPage({Key? key}) : super(key: key);

  @override
  _ProfileSettingPageState createState() => _ProfileSettingPageState();
}

class _ProfileSettingPageState extends State<ProfileSettingPage> {

  final ApiService _apiService = ApiService();

  final SharedPreferencesHelper helper = SharedPreferencesHelper();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {

    await helper.initSharedPreferences();

    // Save values
    await helper.saveValues('Koi Kotchakorn', 'koik@gmail.com', 'Asia', '14/05/2001');

    UserData userData = await helper.loadStoredValues();
    setState(() {
      _nameController.text = userData.name;
      _emailController.text = userData.email;
      _regionController.text = userData.image;
      _selectedRegion = userData.image;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _regionController.dispose();
    super.dispose();
  }

  String? _selectedRegion;
  List<String> regions = [
    'Africa',
    'Asia',
    'Europe',
    'North America',
    'Oceania',
    'South America',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
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
            const SizedBox(height: 20), // Adding space between columns
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Stack(
                  children: [
                    // Your existing avatar and edit icon code here
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Your Name',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        value: _selectedRegion,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedRegion = newValue;
                          });
                        },
                        items: regions.map((String region) {
                          return DropdownMenuItem<String>(
                            value: region,
                            child: Text(region),
                          );
                        }).toList(),
                        decoration: const InputDecoration(
                          labelText: 'Region',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Add the DateInputWidget here
                      const DateInputWidget(initialDate: '14/05/2001'),
                      const SizedBox(height: 20),
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
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

                    Navigator.pop(context);

                  },
                  child: const Text('Save'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}