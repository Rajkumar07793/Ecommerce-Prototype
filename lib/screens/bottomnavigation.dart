import 'package:ecommerce/utils/index.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  Color color = Color(0xff000020);

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      // Transformation(),
      MyOrders(),
      Notifications(),
      HomeScreen(),
      SilverCard(),
      MyAccount()
    ];
    return WillPopScope(
      onWillPop: () {
        return onBackButtonPressed(context);
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: screens[index],
        bottomNavigationBar: CurvedNavigationBar(
          index: index,
          height: 75,
          animationCurve: Curves.easeIn,
          backgroundColor: Colors.transparent,
          // backgroundColor: Color(0xff303030),
          color: Color(0xffffffff),
          onTap: (i) {
            setState(() {
              // color = colors[i];
              index = i;
            });
          },
          items: [
            Icon(
              Icons.history,
              color: color,
            ),
            Icon(
              Icons.notifications_none_rounded,
              color: color,
            ),
            Icon(
              Icons.home_outlined,
              size: 40,
              color: color,
            ),
            Icon(
              Icons.shopping_cart_outlined,
              color: color,
            ),
            Icon(
              Icons.person_outline_rounded,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
