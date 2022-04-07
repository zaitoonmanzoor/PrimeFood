
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../responsive.dart';
import 'components/Balance_Box.dart';
import 'components/Pie_chart.dart';
import 'components/header.dart';
import 'components/line_chart.dart';
import 'components/monthly_invoice_box.dart';
import 'components/my_fields.dart';
import 'components/recent_files.dart';
import 'components/stock_alert.dart';
import 'components/storage_details.dart';




class DashboardScreen extends StatelessWidget {
  final String ? email, name;
  DashboardScreen({this.email, this.name});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Center(
            child: Column(
              children: [
                Header(email: email, name: name,),
                SizedBox(height: defaultHeight),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          BalanceWidget(text:'Total Balance' ,text2: 23456.56, svg: 'assets/icons/menu_tran.svg',),
                          SizedBox(height: defaultPadding),
                          MyFiles(),
                          SizedBox(height: defaultPadding),
                          MonthlyWidget(text:'This Month Invoice' ,text2: 23,svg: 'assets/icons/menu_doc.svg',),
                          SizedBox(height: defaultPadding),
                          LineChartSample2(),
                          SizedBox(height: defaultPadding),
                         Padding(
                           padding: const EdgeInsets.only(left: 6.0),
                           child: Align(
                             alignment: Alignment.topLeft,
                             child: Text('Product Categories' , style:
                             Theme.of(context)
                                 .textTheme.headline6!
                                 .copyWith(color: Colors.white, fontSize: 15,),
                             ),
                           ),
                         ),
                          PieChartSample2(),
                          SizedBox(height: defaultPadding),
                          RecentFiles(),
                          if (Responsive.isMobile(context))
                            SizedBox(height: defaultPadding),
                          if (Responsive.isMobile(context)) StorageDetails(),
                          SizedBox(height: defaultPadding),
                          StockAlert(),

                        ],
                      ),
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(width: defaultPadding),
                    // On Mobile means if the screen is less than 850 we dont want to show it
                    if (!Responsive.isMobile(context))
                      Expanded(
                        flex: 2,
                        child: StorageDetails(),
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}
