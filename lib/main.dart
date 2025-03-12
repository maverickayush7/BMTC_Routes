import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

void main() {
  runApp(const BmtcApp());
}

class BmtcApp extends StatelessWidget {
  const BmtcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.orangeAccent,
        ),
      ),
      home: const BmtcHomepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BmtcHomepage extends StatefulWidget {
  const BmtcHomepage({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<BmtcHomepage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset('opening.png');
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();

  TextFormField passwordField = TextFormField(
    obscureText: true,
    decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Password',
        labelStyle: TextStyle(fontSize: 20)),
    validator: (input) {
      if (input == "") {
        return "Can't be null mate :)";
      } else if (input == "password" || input == "Password") {
        return "Bruh, you serious?";
      } else if (input != "losers:)") {
        return "Wrong Password!";
      }
      return null;
    },
  );
  TextFormField usernameField = TextFormField(
    decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Username',
        labelStyle: TextStyle(fontSize: 20)),
    validator: (input) {
      if (input == "") {
        return "You Sure you don't have a name?";
      } else if (input != "MaverickLegends") {
        return "Incorrect Username";
      }
      return null;
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMTC Route Finder')),
      body: Form(
        key: _formkey,
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Container(
                constraints: const BoxConstraints(maxWidth: 300),
                child: usernameField),
            Container(
                constraints: const BoxConstraints(maxWidth: 300),
                child: passwordField),
            SizedBox(
              height: 70,
              width: 200,
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 15),
                    ),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const homeScreen = <Tuple3<String, String, StatelessWidget>>[
      Tuple3("TripPlanner.jpeg", "Trip Planner", TripPlanner()),
      Tuple3("RouteMap.jpeg", "Route Map", RouteFinder()),
      Tuple3("fare.jpeg", "Fare", Fare()),
      Tuple3("bus.jpeg", "Nearby Bus Stop", BusStop()),
      Tuple3("live.jpeg", "Live Tracking", Live()),
      Tuple3("recharge.jpeg", "Recharge/Bus Pass", Recharge())
    ];
    List<Padding> icons = <Padding>[];
    List<Padding> buttons = <Padding>[];
    for (final iButton in homeScreen) {
      icons.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Image.asset(iButton.item1, width: 75, height: 75)));
      buttons.add(Padding(
        padding: const EdgeInsets.all(25),
        child: SizedBox(
            height: 50,
            child: ElevatedButton(
                child: Text(
                  iButton.item2,
                  style: const TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => iButton.item3));
                })),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMTC Route Finder'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Center(
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: icons,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: buttons,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Catto extends StatelessWidget {
  const Catto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("TODO")),
        body: Center(child: Image.asset('opening.png')));
  }
}

class TripPlanner extends StatelessWidget {
  const TripPlanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("TripPlanner")),
        body: Center(child: Image.asset('TripPlannerWidget.png')));
  }
}

class RouteFinder extends StatelessWidget {
  const RouteFinder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("RouteFinder")),
        body: Center(child: Image.asset('RouteFinderWidget.png')));
  }
}

class Fare extends StatelessWidget {
  const Fare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Fare")),
        body: Center(child: Image.asset('FareWidget.png')));
  }
}

class BusStop extends StatelessWidget {
  const BusStop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Nearby Bus Stops")),
        body: Center(child: Image.asset('BusStopWidget.png')));
  }
}

class Live extends StatelessWidget {
  const Live({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Live Tracking")),
        body: Center(child: Image.asset('LiveWidget.png')));
  }
}

class Recharge extends StatelessWidget {
  const Recharge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Recharge and Bus Passes")),
        body: Center(child: Image.asset('RechargeWidget.png')));
  }
}
