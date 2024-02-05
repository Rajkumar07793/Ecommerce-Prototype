import 'package:ecommerce/utils/index.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  ScrollController scrollController = ScrollController();
  double value = 90;

  _listen() {
    // print(scrollController.offset);
    // setState(() {
    //   value = scrollController.offset.toDouble();
    // });
    setState(() {});
  }

  @override
  void initState() {
    scrollController.addListener(() {
      _listen();
    });
    // scrollController.animateTo(1000, duration: Duration(seconds: 2), curve: Curves.elasticInOut);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List notifications = [
      // for (int i = 0; i < 20; i++)
      {
        "image":
            "https://rukminim1.flixcart.com/flap/1000/1000/image/26c56a4fee725d5b.jpg",
        "title": "Realme 8",
        "subtitle": "Super hit Electronics Deal",
      },
      {
        "image":
            "https://rukminim1.flixcart.com/flap/1000/1000/image/1450ec91f45d72d8.jpg",
        "title": "TV Realme/Mi",
        "subtitle": "Super hit Electronics Deal",
      },
      {
        "image":
            "https://rukminim1.flixcart.com/flap/1000/1000/image/e15dec72a648ed51.jpg",
        "title": "Samsung F62",
        "subtitle": "Super hit Electronics Deal",
      },
      {
        "image":
            "https://rukminim1.flixcart.com/flap/1000/1000/image/084789479074d2b2.jpg",
        "title": "Furniture",
        "subtitle": "Super hit Electronics Deal",
      },
      {
        "image":
            "https://rukminim1.flixcart.com/flap/1000/1000/image/1ce0c4c1fb501b45.jpg",
        "title": "Washing Machine",
        "subtitle": "Super hit Electronics Deal",
      },
      {
        "image":
            "https://rukminim1.flixcart.com/image/800/960/jvif0y80/watch/v/h/a/ddblk-27blu-youth-club-original-imafged8n54ghm3d.jpeg?q=50",
        "title": "Watch",
        "subtitle": "Super hit Electronics Deal",
      },
      {
        "image":
            "https://rukminim1.flixcart.com/image/800/960/kosxzm80/trouser/t/4/z/28-pctfossp310036-peter-england-original-imag35v37gqjcgmd.jpeg?q=50",
        "title": "Trouser",
        "subtitle": "Super hit Electronics Deal",
      },
      {
        "image":
            "https://rukminim1.flixcart.com/image/416/416/jh0vb0w0/headphone/t/7/6/sony-mdr-zx110-a-original-imaf553gdwgxbetq.jpeg?q=70",
        "title": "Headphone",
        "subtitle": "Super hit Electronics Deal",
      },
      {
        "image":
            "https://rukminim1.flixcart.com/image/416/416/jh6l2fk0/headphone/c/a/g/sony-mdr-zx310ap-original-imaf59ebtsdeaypz.jpeg?q=70",
        "title": "Headphone",
        "subtitle": "Super hit Electronics Deal",
      },
    ];
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        controller: scrollController,
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          double itemPositionOffset = index * value;
          double difference = scrollController.offset - itemPositionOffset;
          double percent = 1 - (difference / value);
          if (percent > 1.0) percent = 1.0;
          if (percent < 0.0) percent = 0.0;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..scale(percent),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: scrollController.offset.abs(),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 0),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      createRoute(
                        NotificationDetail(
                          title: notifications[index]["title"],
                          subtitle: notifications[index]["subtitle"],
                          image: notifications[index]["image"],
                        ),
                      ),
                    );
                  },
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  // tileColor: Colors.white,
                  leading: SizedBox(
                    height: 100,
                    width: 100,
                    child: Hero(
                      tag: notifications[index]["image"],
                      child: Image.network(
                        notifications[index]["image"],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(notifications[index]["title"]),
                  subtitle: Text(notifications[index]["subtitle"]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NotificationDetail extends StatefulWidget {
  final String subtitle;
  final String title;
  final String image;

  const NotificationDetail(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.image})
      : super(key: key);

  @override
  _NotificationDetailState createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? animation;

  @override
  void initState() {
    animate();
    super.initState();
  }

  animate() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    CurvedAnimation curve =
        CurvedAnimation(parent: animationController!, curve: Curves.bounceIn);
    animation = Tween<double>(begin: 1, end: 0.9).animate(curve)
      ..addListener(() {
        setState(() {});
      });
    animationController!.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: backButton(context, margin: 8),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      //   child: Icon(Icons.arrow_back_ios),
      // ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Text(
            widget.subtitle,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black.withOpacity(0.4)),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Transform.scale(
            scale: animation!.value,
            child: Hero(
              tag: widget.image,
              child: Image.network(
                widget.image,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }
}
