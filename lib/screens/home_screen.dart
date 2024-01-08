import 'package:flutter/material.dart';
import 'package:restaurantmanagementsystem/constants/colors.dart';
import 'package:restaurantmanagementsystem/models/table/tab_bar.dart';
import 'package:restaurantmanagementsystem/widgets/custom_box.dart';
import 'package:restaurantmanagementsystem/widgets/notification/notification_button.dart';
import 'package:restaurantmanagementsystem/widgets/shared/search_box.dart';
import 'package:restaurantmanagementsystem/constants/extensions.dart';
import 'package:restaurantmanagementsystem/widgets/table_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ListTile(
          title: Text(
            'Bro Restaurant & Bar',
            style: TextStyle(
              color: kblackColor,
              fontSize: 0.026.h(),
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            'Bharatpur-4, Lanku Chitwan',
            style: TextStyle(
              color: kblackColor,
              fontSize: 0.018.h(),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.all(0.005.res()),
          child: Image.asset('assets/logo1.png'),
        ),
        actions: const [NotificationButton()],
        iconTheme: const IconThemeData(color: kblackColor),
        backgroundColor: kbgColor,
      ),
      backgroundColor: kbgColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.015.res()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Search Box
            SizedBox(height: 0.021.h()),
            const SearchBox(label: 'Search by table number or categories'),

            //Categories Tab
            SizedBox(height: 0.012.h()),
            SizedBox(
              height: 0.057.h(),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: tabData.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    child: CustomBox(
                      name: tabData[index].name!,
                      isSelected: _currentIndex == index,
                    ),
                  );
                },
              ),
            ),

            //Table information
            TableGrid(selectedIndex: _currentIndex)
          ],
        ),
      ),
    );
  }
}
