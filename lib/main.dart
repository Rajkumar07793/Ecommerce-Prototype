import 'package:ecommerce/screens/splash.dart';
import 'package:ecommerce/utils/index.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductModel()),
        ChangeNotifierProvider(create: (_) => OrderedModel()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce App',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Poppins"),
        home: Splash(),
      ),
    );
  }
}
