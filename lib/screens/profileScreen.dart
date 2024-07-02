import 'package:PinkCity/screens/loginScreen.dart';
import 'package:PinkCity/screens/myOrderScreen.dart';
import 'package:PinkCity/screens/newPwScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const/colors.dart';
import 'changeAddressScreen.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "/profileScreen";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return 
        Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                  children: [
                     const Padding(
                       padding: EdgeInsets.only(left:28.0,top: 40),
                       child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("My Account",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w900,color: AppColor.darkPink),)),
                     ),
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          const ListTile(
                            isThreeLine: true,
                            leading: CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 252, 154, 255),
                              radius: 30,
                              backgroundImage: NetworkImage(
                                'https://cdn4.iconfinder.com/data/icons/e-commerce-181/512/477_profile__avatar__man_-512.png',
                              ),
                            ),
                            title: Text(
                              'Pink city user',
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '+1 204 590 7230',
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'Buyer@pinkcity.com',
                                ),
                              ],
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            leading: const Icon(Icons.edit),
                            title: const Text('Edit Account'),
                            trailing: const Icon(Icons.keyboard_arrow_right),
                          ),
                          const Divider(
                            height: 0,
                          ),
                          ListTile(
                            onTap: () {Get.to(const MyOrderScreen());},
                            leading: const Icon(Icons.shopping_bag_rounded),
                            title: const Text('My current Order'),
                            trailing: const Icon(Icons.keyboard_arrow_right),
                          ),
                          const Divider(
                            height: 0,
                          ),
                          ListTile(
                            onTap: () {Get.to(const NewPwScreen());},
                            leading: const Icon(Icons.lock),
                            title: const Text('Change Password'),
                            trailing: const Icon(Icons.keyboard_arrow_right),
                          ),
                          const Divider(
                            height: 0,
                          ),
                          ListTile(
                            onTap: () => Get.to( const ChangeAddressScreen()),
                            leading: const Icon(Icons.location_on),
                            title: const Text('Change Addresses'),
                            trailing: const Icon(Icons.keyboard_arrow_right),
                          ),
                          const Divider(
                            height: 0,
                          ),
                          ListTile(
                            onTap: () {},
                            leading: const Icon(Icons.credit_card),
                            title: const Text('Saved Cards'),
                            trailing: const Icon(Icons.keyboard_arrow_right),
                          ),
                          const Divider(
                            height: 0,
                          ),
                          ListTile(
                            onTap: (){Get.to(LoginScreen());},
                            leading: const Icon(Icons.power_settings_new),
                            title: const Text('Logout'),
                            trailing: const Icon(Icons.keyboard_arrow_right),
                          ),
                          const SizedBox(height: 100,),
                          const Center(child: Text("Pink City",style: TextStyle(fontSize: 32,color: AppColor.orange,fontWeight: FontWeight.w900),),),
                          const Center(child: Text("version 1.0.0",style: TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.w900),),)
                        ],
                      ),
                    ),
                  ],
            ),
          ),
        );
  }
}

class CustomFormImput extends StatelessWidget {
  const CustomFormImput({
    Key? key,
    required String label,
    required String value,
    bool isPassword = false,
  })  : _label = label,
        _value = value,
        _isPassword = isPassword,
        super(key: key);

  final String _label;
  final String _value;
  final bool _isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.only(left: 40),
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColor.placeholderBg,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: _label,
          contentPadding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
        ),
        obscureText: _isPassword,
        initialValue: _value,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
