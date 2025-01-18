import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:lab2_mis/providers/joke_provider.dart';
import 'package:lab2_mis/screens/home.dart';
import 'package:lab2_mis/screens/jokes.dart';
import 'package:lab2_mis/screens/login_page.dart';
import 'package:lab2_mis/screens/profile.dart';
import 'package:lab2_mis/screens/register_page.dart';
import 'package:lab2_mis/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  print('Background message: ${message.messageId}');
}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  _setupFirebaseMessaging();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => JokesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
void _setupFirebaseMessaging() {
  FirebaseMessaging messaging = FirebaseMessaging.instance;


  messaging.getToken().then((token) {
    print('FCM Token: $token');
  });


  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Message received: ${message.notification?.title}');
  });


  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('Notification clicked!');
  });
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "/jokes": (context) => const JokesListScreen(jokeType: ''),
        "/login": (context) => const LoginPage(),
        "/register": (context) => const RegisterPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final favoriteCount = context
        .watch<JokesProvider>()
        .jokes
        .where((p) => p.isFavorite)
        .length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Joke Demo"),
        actions: [
          IconButton(
            onPressed: () {
              AuthService().logout(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: [
          const NavigationDestination(icon: Icon(Icons.home), label: 'Joke'),
          NavigationDestination(
              icon: Badge(label: Text("$favoriteCount"), child: const Icon(Icons.favorite)),
              label: 'Favorites'),
          const NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedIndex: currentPageIndex,
      ),
      body: [
        const Home(),

        const ProfilePage(),
      ][currentPageIndex],
    );
  }
}


