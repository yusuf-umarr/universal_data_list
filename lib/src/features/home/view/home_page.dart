import 'package:flutter/material.dart';
import 'package:pro_a/src/core/utilities/size-config.dart';
import 'package:pro_a/src/widgets/product_widget.dart';

import '../../../core/constants/app_color.dart';
import 'package:intl/intl.dart';

import '../../../widgets/data_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List newData = DataList.productList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Universal Flow"),
          centerTitle: true,
          backgroundColor: AppColor.bgColor,
        ),
        body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal! * 4,
                vertical: SizeConfig.safeBlockVertical! * 4),
            child: Column(
              children: [
                TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal! * 4,
                      ),
                      hintText: "Search here",
                      suffixIcon: const Icon(Icons.search),
                      hintStyle: TextStyle(
                          color: Colors.black26,
                          fontSize: SizeConfig.safeBlockHorizontal! * 4.66),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: SearchData),
                showData()
              ],
            )));
  }

  void SearchData(String query) {
    final suggestions = DataList.productList.where((data) {
      final dataName = data['name'].toLowerCase();
      final input = query.toLowerCase();

      return dataName.contains(input);
    }).toList();

    setState(() {
      newData = suggestions;
    });
  }

  showData() {
    return Expanded(
      child: ListView.builder(
          itemCount: newData.length,
          itemBuilder: (_, index) {
            bool isSameDate = true;
            final String dateString = newData[index]['date'];
            final DateTime date = DateTime.parse(dateString);
            final item = newData[index];
            if (index == 0) {
              isSameDate = false;
            } else {
              final String prevDateString = newData[index - 1]['date'];
              final DateTime prevDate = DateTime.parse(prevDateString);
              isSameDate = date.isSameDate(prevDate);
            }
            if (index == 0 || !(isSameDate)) {
              return Column(children: [
                // Text(date.formatDate()),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.safeBlockVertical! * 1,
                      horizontal: SizeConfig.safeBlockHorizontal! * 2),
                  child: Row(
                    children: [
                      Text(item['date']),
                      const Spacer(),
                      const Text("-€47.33"),
                    ],
                  ),
                ),
                ProductWidget(item: item)
                // ListTile(title: Text('item $index'))
              ]);
            } else {
              return ProductWidget(item: item);
            }
          }),
    );
  }
}

//"time": "2020-06-16T10:31:12.000Z",

String dateFormatter = 'MMMM dd, y';

extension DateHelper on DateTime {
  String formatDate() {
    final formatter = DateFormat(dateFormatter);
    return formatter.format(DateTime.now());
    // return formatter.format(this);
  }

  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }
}
