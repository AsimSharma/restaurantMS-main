import 'package:flutter/material.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/widgets/notification/notification_button.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kbgColor,
        iconTheme: const IconThemeData.fallback(),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          'Personal Information',
          style: TextStyle(
            fontSize: 0.019.res(),
            color: kblackColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: const [NotificationButton()],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.radio_button_checked,
                        color: kblueColor,
                      ),
                    ),
                    title: Text(
                      'Male',
                      style: TextStyle(
                        fontSize: 0.018.res(),
                        fontWeight: FontWeight.w700,
                        color: kblueColor,
                      ),
                    ),
                  ),

                  //Full Name
                  Text(
                    'Full Name*',
                    style: TextStyle(
                      fontSize: 0.012.res(),
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  texField(
                    name: 'Full Name',
                    controller:
                        TextEditingController(text: 'Hari Bahadur Karki'),
                    width: size.width,
                  ),

                  //Phone Number and Date of Birth
                  SizedBox(height: 0.01.h()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phone Number*',
                            style: TextStyle(
                              fontSize: 0.012.res(),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          texField(
                            name: 'Full Name',
                            controller:
                                TextEditingController(text: '9812345643'),
                            width: size.width * 0.37,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date of Birth',
                            style: TextStyle(
                              fontSize: 0.012.res(),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          texField(
                            name: 'Date of Birth',
                            controller:
                                TextEditingController(text: '22/05/2011'),
                            width: size.width * 0.37,
                          ),
                        ],
                      ),
                    ],
                  ),

                  //Email
                  SizedBox(height: 0.01.h()),
                  Text(
                    'Email*',
                    style: TextStyle(
                      fontSize: 0.012.res(),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  texField(
                    name: 'Email',
                    controller: TextEditingController(text: 'hari12@gmail.com'),
                  ),

                  //Start date and position
                  SizedBox(height: 0.01.h()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Date*',
                            style: TextStyle(
                              fontSize: 0.012.res(),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          texField(
                            name: 'Start Date',
                            controller:
                                TextEditingController(text: '22/04/2021'),
                            width: size.width * 0.37,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Position*',
                            style: TextStyle(
                              fontSize: 0.012.res(),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          texField(
                            name: 'Position',
                            controller: TextEditingController(text: 'Waiter'),
                            width: size.width * 0.37,
                          ),
                        ],
                      ),
                    ],
                  ),

                  //Address
                  SizedBox(height: 0.01.h()),
                  Text(
                    'Address*',
                    style: TextStyle(
                      fontSize: 0.012.res(),
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  texField(
                    name: 'Address',
                    controller: TextEditingController(
                        text: 'Sikles-4, vodetar pokhara'),
                    width: size.width,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget texField(
      {required String name,
      required TextEditingController controller,
      double? width = double.infinity}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: width,
        child: TextField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: kblackColor.withOpacity(0.2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
