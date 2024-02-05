import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/utils/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:folding_cell/folding_cell/widget.dart';

class Transformation extends StatefulWidget {
  const Transformation({Key? key}) : super(key: key);

  @override
  _TransformationState createState() => _TransformationState();
}

class _TransformationState extends State<Transformation>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;
  GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();
  List list = [];
  int number = 0;

  @override
  void initState() {
    // animate();
    super.initState();
  }

  animate() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    CurvedAnimation curve = CurvedAnimation(
        parent: animationController!, curve: Curves.bounceInOut);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });

    animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController!.stop(canceled: false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   elevation: 1,
      //   backgroundColor: Colors.transparent,
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         _listKey.currentState
      //             .insertItem(0, duration: Duration(seconds: 1));
      //         list.add(number++);
      //         setState(() {});
      //         // animationController.forward();
      //       },
      //       icon: Icon(CupertinoIcons.add),
      //     ),
      //     SizedBox(
      //       width: 10,
      //     ),
      //     IconButton(
      //       onPressed: (list.length < 1)
      //           ? null
      //           : () {
      //               list.remove(list[0]);
      //               // animationController.reverse();
      //               _listKey.currentState.removeItem(0, (context, animation) {
      //                 // print(animation.value);
      //                 animation.addListener(() {
      //                   setState(() {});
      //                 });
      //                 return Container(
      //                   height: Tween(begin: 0.0, end: 40.0)
      //                       .animate(animation)
      //                       .value,
      //                   child: Transform.scale(
      //                     scale: Tween(begin: 0.0, end: 1.0)
      //                         .animate(animation)
      //                         .value,
      //                     child: Icon(
      //                       CupertinoIcons.delete,
      //                       size: 30,
      //                       color: Colors.red,
      //                     ),
      //                   ),
      //                 );
      //               }, duration: Duration(seconds: 1));
      //             },
      //       icon: Icon(CupertinoIcons.minus),
      //     ),
      //   ],
      // ),
      floatingActionButton: Align(
        alignment: Alignment(1, 0.8),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            CupertinoIcons.book,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).push(createRoute(TransitionEffect()));
            // _listKey.currentState.insertItem(0, duration: Duration(seconds: 1));
            // list.add(number++);
            // list.add(1);
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 1,
            backgroundColor: Colors.brown,
            actions: [
              IconButton(
                onPressed: () {
                  _listKey.currentState!
                      .insertItem(0, duration: Duration(seconds: 1));
                  list.add(number++);
                  setState(() {});
                  // animationController.forward();
                },
                icon: Icon(CupertinoIcons.add),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: (list.length < 1)
                    ? null
                    : () {
                        list.remove(list[0]);
                        // animationController.reverse();
                        _listKey.currentState!.removeItem(0,
                            (context, animation) {
                          // print(animation.value);
                          animation.addListener(() {
                            setState(() {});
                          });
                          return Container(
                            height: Tween(begin: 0.0, end: 40.0)
                                .animate(animation)
                                .value,
                            child: Transform.scale(
                              scale: Tween(begin: 0.0, end: 1.0)
                                  .animate(animation)
                                  .value,
                              child: Icon(
                                CupertinoIcons.delete,
                                size: 30,
                                color: Colors.red,
                              ),
                            ),
                          );
                        }, duration: Duration(seconds: 1));
                      },
                icon: Icon(CupertinoIcons.minus),
              ),
            ],
          ),
          SliverAnimatedList(
            key: _listKey,
            initialItemCount: (list).length,
            // physics: BouncingScrollPhysics(),
            itemBuilder: (context, index, animation) {
              print(list.toString());
              // animation = this.animation;
              // print(animation.value);
              return SizeTransition(
                sizeFactor: animation,
                axis: Axis.vertical,
                axisAlignment: 10,
                child: SizedBox(
                  // height: 50,
                  width: 200,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      index.toString(),
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class TransitionEffect extends StatefulWidget {
  @override
  _TransitionEffectState createState() => _TransitionEffectState();
}

class _TransitionEffectState extends State<TransitionEffect>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  double dist = 0;
  bool isOpen = false;
  AnimationController? animationController;
  Animation? animation;

  @override
  void initState() {
    animate();
    super.initState();
  }

  animate() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    CurvedAnimation curve =
        CurvedAnimation(parent: animationController!, curve: Curves.linear);
    animation = Tween<double>(begin: 0, end: 200).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          setState(() {
            // dist = isOpen ? 300 : 0;
            isOpen
                ? animationController!.reverse()
                : animationController!.forward();
            isOpen = !isOpen;
          });
        },
        child: AnimatedIcon(
          progress: animationController!,
          icon: AnimatedIcons.menu_arrow,
          color: Colors.black,
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xffFF9933),
              Color(0xff000080).withOpacity(0.1),
              Color(0xff138808)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                DrawerHeader(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/images/Rknew.jpg"),
                  ),
                ),
                ListTile(
                  title: Text("carousel_slider: ^4.0.0"),
                  onTap: () {
                    Navigator.of(context).push(createRoute(ImageSlider()));
                  },
                ),
                ListTile(
                  title: Text("Login 2"),
                  onTap: () {
                    Navigator.of(context).push(createRoute(Login2()));
                  },
                ),
                ListTile(
                  title: Text("Foldable"),
                  onTap: () {
                    Navigator.of(context)
                        .push(createRoute(FoldingCellSimpleDemo()));
                  },
                ),
                ListTile(
                  title: Text("Anim"),
                  onTap: () {
                    Navigator.of(context).push(createRoute(Anim()));
                  },
                ),
                ListTile(
                  title: Text("Custom Scroll View"),
                  onTap: () {
                    Navigator.of(context).push(createRoute(SilverCard()));
                  },
                ),
              ],
            ),
          ),
          Positioned(
            left: animation!.value,
            top: animation!.value,
            bottom: animation!.value,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(animation!.value)),
              child: FittedBox(
                fit: BoxFit.fill,
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(animation!.value)),
                  // duration: Duration(seconds: 2),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: HomeScreen(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  List categories = [
    {
      "name": "Mobiles",
      "image":
          "https://i2.wp.com/maplestore.in/wp-content/uploads/2020/10/IN_r1309_Graphite_PDP_Image_Position_2.jpg?fit=2048%2C2048&ssl=1"
    },
    {
      "name": "Bag",
      "image":
          "https://image.shutterstock.com/image-photo/red-elegant-female-bag-two-260nw-1032419707.jpg"
    },
    {
      "name": "Flat Shoes",
      "image":
          "https://in.ecco.com/dw/image/v2/BCNL_PRD/on/demandware.static/-/Sites-ecco/default/dw2ab02d0a/productimages/208043-01378-outside.jpg"
    },
    {
      "name": "Watches",
      "image":
          "https://img.pngio.com/smart-watches-png-image-digital-wrist-watch-png-1063_1160.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
              disableCenter: true,
              autoPlay: true,
              enlargeCenterPage: true,
              scrollPhysics: BouncingScrollPhysics(),
              // enlargeStrategy: CenterPageEnlargeStrategy.scale,
              height: 150,
              // aspectRatio: 1.5,
              viewportFraction: 0.4),
          items: [
            for (Map data in categories)
              Container(
                height: 50,
                width: 120,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    // color: Color(0xff424242),
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Icon(
                    //   Icons.shopping_bag,
                    //   color: Color(0xffCB9495),
                    //   size: 50,
                    // ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                          height: 100,
                          width: 100,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                data["image"],
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext? context,
                                    Widget? child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null)
                                    return Center(child: child);
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                              ))),
                    ),
                    Align(
                      // bottom:0,
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        data["name"],
                        style: TextStyle(
                            // backgroundColor: Colors.white24,
                            // color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}

class FoldingCellSimpleDemo extends StatelessWidget {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foldable widget example"),
      ),
      body: Container(
        color: Color(0xFF2e282a),
        alignment: Alignment.topCenter,
        child: SimpleFoldingCell.create(
          key: _foldingCellKey,
          frontWidget: _buildFrontWidget(),
          innerWidget: _buildInnerWidget(),
          cellSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height / 3),
          padding: EdgeInsets.all(15),
          animationDuration: Duration(seconds: 1),
          borderRadius: 40,
          onOpen: () => print('cell opened'),
          onClose: () => print('cell closed'),
        ),
      ),
    );
  }

  Widget _buildFrontWidget() {
    return Container(
      color: Color(0xFFffcd3c),
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              "Welcome",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                leadingDistribution: TextLeadingDistribution.proportional,
                // decorationColor: Color(0xffff0000),
              ),
              // style: GoogleFonts.aldrich(
              //   color: Color(0xFF2e282a),
              //   fontSize: 20.0,
              //   fontWeight: FontWeight.bold,
              // ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: TextButton(
              onPressed: () => _foldingCellKey.currentState?.toggleFold(),
              child: Text(
                "OPEN",
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(80, 40),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 30,
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/images/Rknew.jpg"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInnerWidget() {
    return Container(
      color: Color(0xFFecf2f9),
      padding: EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "CARD TITLE",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              // style: GoogleFonts.aldrich(
              //   color: Color(0xFF2e282a),
              //   fontSize: 22.0,
              //   fontWeight: FontWeight.bold,
              // ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.2),
            child: Text(
              "CARD DETAIL",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              // style: GoogleFonts.aldrich(
              //   color: Color(0xFF2e282a),
              //   fontSize: 40.0,
              // ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: TextButton(
              onPressed: () => _foldingCellKey.currentState?.toggleFold(),
              child: Text(
                "Close",
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(80, 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Anim extends StatefulWidget {
  const Anim({Key? key}) : super(key: key);

  @override
  _AnimState createState() => _AnimState();
}

class _AnimState extends State<Anim> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? animation;

  @override
  void initState() {
    animate();
    super.initState();
  }

  animate() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..addListener(() {
            setState(() {
              // print(animationController.value);
            });
          });
    animationController!.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 50.0,
      fontFamily: 'Horizon',
    );
    return Scaffold(
      body: SizedBox.expand(
        child: InteractiveViewer(
          minScale: 0.5,
          maxScale: 5.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   height: animationController.value * pi * 100,
              //   width: animationController.value * pi * 100,
              //   color: Colors.amberAccent,
              //   child: Text(
              //     animationController.value.toString(),
              //   ),
              // ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText("Hey! this is Raj....",
                      textStyle: TextStyle(color: Colors.black)),
                  FlickerAnimatedText("FlickerAnimatedText"),
                  ColorizeAnimatedText("ColorizeAnimatedText",
                      textStyle: colorizeTextStyle, colors: colorizeColors),
                  TyperAnimatedText("TyperAnimatedText"),
                ],
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Hello world!',
                    curve: Curves.bounceIn,
                    textStyle: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 500),
                  ),
                  FadeAnimatedText(
                    'Fade First',
                    duration: Duration(microseconds: 500),
                    textStyle: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ScaleAnimatedText(
                    'Then Scale',
                    duration: Duration(microseconds: 500),
                    textStyle:
                        TextStyle(fontSize: 70.0, fontFamily: 'Canterbury'),
                  ),
                  RotateAnimatedText('AWESOME'),
                  RotateAnimatedText('OPTIMISTIC'),
                  RotateAnimatedText('DIFFERENT'),
                  ColorizeAnimatedText(
                    'Larry Page',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                  ColorizeAnimatedText(
                    'Bill Gates',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                  ColorizeAnimatedText(
                    'Steve Jobs',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                ],
                // totalRepeatCount: 4,
                repeatForever: true,
                isRepeatingAnimation: true,
                // pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                // stopPauseOnTap: true,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Hello World'),
                  WavyAnimatedText('Look at the waves'),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
                onTap: () {
                  print("Tap Event");
                },
              ),
              PhysicalModel(
                color: Colors.yellowAccent,
                shape: BoxShape.circle,
                elevation: 5,
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Center(
                      child: Text(
                    "Welcome! this is a Physical Model",
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
              Card(
                elevation: 5,
                color: Colors.yellowAccent,
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Center(
                      child: Text("Welcome! this is a card",
                          textAlign: TextAlign.center)),
                ),
              ),
              CarouselSlider(
                items: [Text("this is music text slider")],
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 15),
                  // autoPlayInterval: Duration(seconds: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
