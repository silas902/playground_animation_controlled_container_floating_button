import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> animationIndex0;
  late final Animation<double> animationIndex1;
  late final Animation<double> animationIndex2;
  late final Animation<double> animationIndex3;
  final menuIsOpen = ValueNotifier<bool>(false);
  final double dd = 411;
   

  BuildContext ss (BuildContext context){
    return context;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
    
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 01));
    animationController.addListener(() {
      setState(() {
        
      });
    });
    
    
  

    animationIndex0 = Tween<double>(begin: 10, end: 350 ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInBack,
      reverseCurve: Curves.bounceIn
    ));
    animationIndex1 = Tween<double>(begin: 10, end: 240).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInBack,
    ));
    animationIndex2 = Tween<double>(begin: 10, end: 120).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInBack,
    ));
    animationIndex3 = Tween<double>(begin: 10, end: 10).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInBack,

    ));
  }

  @override
  void dispose() {
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
  
    //@override
    //void initstate () {
    //  super.initState();
    //   setState(() {
    //  withPage = MediaQuery.of(context).size.width;
    //});
    //}
   
    

    toggleMenu() {
      menuIsOpen.value ? animationController.reverse() : animationController.forward();
      menuIsOpen.value = !menuIsOpen.value;
    }

    return Scaffold( appBar: AppBar(),
      body: Flow(
        delegate: DelegateContainer(animationIndex0: animationIndex0, animationIndex1: animationIndex1, animationIndex2: animationIndex2, animationIndex3: animationIndex3),
        children: [
          GestureDetector(
            onTap: () {
              toggleMenu();
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Icon(Icons.menu),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print(MediaQuery.of(context).size.width);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Icon(Icons.access_alarm_sharp),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              toggleMenu();
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Icon(Icons.accessibility_new_outlined),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              toggleMenu();
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Icon(Icons.account_balance),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DelegateContainer extends FlowDelegate {
  final Animation<double> animationIndex0;
  final Animation<double> animationIndex1;
  final Animation<double> animationIndex2;
  final Animation<double> animationIndex3;

  DelegateContainer({required this.animationIndex0,required this.animationIndex1,required this.animationIndex2,required this.animationIndex3,}):super(repaint: animationIndex0);

  @override
  void paintChildren(FlowPaintingContext context) {
    final lastIndex = context.childCount;
    final positioX = context.size.width;

    for (var i = lastIndex; i >= 0; i--) {
      final size = (i != 0) ? animationIndex0.value : 1.0;
      final y = positioX - ((45 + 45) * i * animationIndex0.value);
      if (i == 0) {
        context.paintChild(i, transform: Matrix4.translationValues(animationIndex0.value, 550, 0)
            //..translate(38, 3)
            //..scale(size)
            //..translate(-23, -12)

            );
      }if (i == 1) {
        context.paintChild(i, transform: Matrix4.translationValues(animationIndex1.value, 550, 0)
            //..translate(38, 3)
            //..scale(size)
            //..translate(-23, -12)

            );
      }if (i == 2) {
        context.paintChild(i, transform: Matrix4.translationValues(animationIndex2.value, 550, 0)
            //..translate(38, 3)
            //..scale(size)
            //..translate(-23, -12)

            );
      }if (i == 3) {
        context.paintChild(i, transform: Matrix4.translationValues(animationIndex3.value, 550, 0)
            //..translate(38, 3)
            //..scale(size)
            //..translate(-23, -12)

            );
      }
    }
    // TODO: implement paintChildren
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}
