// import 'package:flutter/material.dart';
// import 'package:mahindra_bricks/homepage.dart';
// import 'package:provider/provider.dart';
// import 'Constant/Sizes.dart';
// import 'Splashscreen.dart';
// import 'addproduction.dart';
// import 'labourmanagement.dart';
//
// void main() {
//   runApp();
//
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Mahindra Bricks',
//         theme: ThemeData(),
//         builder: (context, child) {
//           Sizes.init(context);
//           return MediaQuery(
//             data: MediaQuery.of(context).copyWith(
//               textScaler: MediaQuery.textScalerOf(context).clamp(
//                 minScaleFactor: 0.8,
//                 maxScaleFactor: 1.3,
//               ),
//             ),
//             child: child!,
//           );
//         },
//         home: MahindraSplashScreen(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:mahindra_bricks/Splashscreen.dart';
import 'package:mahindra_bricks/viewmodel/addcategoryview_model.dart';
import 'package:mahindra_bricks/viewmodel/addcementstock_viewmodel.dart';
import 'package:mahindra_bricks/viewmodel/addclientview_model.dart';
import 'package:mahindra_bricks/viewmodel/addlabourview_model.dart';
import 'package:mahindra_bricks/viewmodel/addproductionview_model.dart';
import 'package:mahindra_bricks/viewmodel/addvehicleview_model.dart';
import 'package:mahindra_bricks/viewmodel/categoryview_model.dart';
import 'package:mahindra_bricks/viewmodel/cementstockview_model.dart';
import 'package:mahindra_bricks/viewmodel/clientview_model.dart';
import 'package:mahindra_bricks/viewmodel/dailyattendenceview_model.dart';
import 'package:mahindra_bricks/viewmodel/labour_viewmodel.dart';
import 'package:mahindra_bricks/viewmodel/labourpayoutview_model.dart';
import 'package:mahindra_bricks/viewmodel/loginview_model.dart';
import 'package:mahindra_bricks/viewmodel/ordersListviewmodel.dart';
import 'package:mahindra_bricks/viewmodel/profile_viewmodel.dart';
import 'package:mahindra_bricks/viewmodel/recordcementview_model.dart';
import 'package:mahindra_bricks/viewmodel/reportsview_model.dart';
import 'package:mahindra_bricks/viewmodel/stocklist_viewmodel.dart';
import 'package:mahindra_bricks/viewmodel/vehicle_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constant/Sizes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? accessToken = prefs.getString('acess_token');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileViewModel(),
        ),

        ChangeNotifierProvider(
          create: (context) => CategoryViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddcategoryviewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => VehicleViewmodel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddvehicleviewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CementStockViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddcementstockViewmodel(),
        ),
        ChangeNotifierProvider(
          create: (_) => RecordCementViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ClientListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddclientviewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrdersListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => StocklistViewmodel(),
        ),
        ChangeNotifierProvider(
          create: (_) => LabourListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => DailyattendenceViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddlabourviewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => LabourpayoutViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ReportsviewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddproductionviewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        Sizes.init(context);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: MediaQuery.textScalerOf(context).clamp(
              minScaleFactor: 0.8,
              maxScaleFactor: 1.3,
            ),
          ),
          child: child!,
        );
      },

      debugShowCheckedModeBanner: false,
      home:  MahindraSplashScreen(),
    );
  }
}

