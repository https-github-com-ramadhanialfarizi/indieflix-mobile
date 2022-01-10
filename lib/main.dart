import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indieflix/screen/bottom_navigation.dart';
import 'package:indieflix/screen/landing.dart';
import 'package:indieflix/screen/login.dart';
import 'package:indieflix/screen/movie_detail.dart';
import 'package:indieflix/screen/movie_player.dart';
import 'package:indieflix/screen/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final bool isLoggedIn = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Indie Flix',
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      /* ThemeMode.system to follow system theme,
         ThemeMode.light for light theme,
         ThemeMode.dark for dark theme
      */
      home: isLoggedIn ? const BottomNavigation() : const Landing(),
      // initialRoute: '/landing',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return CupertinoPageRoute(
                builder: (_) => const BottomNavigation(), settings: settings);
          case '/landing':
            return CupertinoPageRoute(
                builder: (_) => const Landing(), settings: settings);
          case '/register':
            return CupertinoPageRoute(
                builder: (_) => const Register(), settings: settings);
          case '/login':
            return CupertinoPageRoute(
                builder: (_) => const Login(), settings: settings);
          case '/movie_detail':
            return CupertinoPageRoute(
                builder: (_) => const MovieDetail(), settings: settings);
          case '/movie_player':
            return CupertinoPageRoute(
                builder: (_) => const MoviePlayer(), settings: settings);
        }
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const title = 'Floating App Bar';

//     return MaterialApp(
//       title: title,
//       home: Scaffold(
//         // No appbar provided to the Scaffold, only a body with a
//         // CustomScrollView.
//         body: CustomScrollView(
//           slivers: [
//             // Add the app bar to the CustomScrollView.
//             const SliverAppBar(
//               // Provide a standard title.
//               title: Text(title),
//               // Allows the user to reveal the app bar if they begin scrolling
//               // back up the list of items.
//               floating: true,
//               pinned: true,
//             ),
//             // Next, create a SliverList
//             SliverList(
//               // Use a delegate to build items as they're scrolled on screen.
//               delegate: SliverChildBuilderDelegate(
//                 // The builder function returns a ListTile with a title that
//                 // displays the index of the current item.
//                 (context, index) => ListTile(title: Text('Item #$index')),
//                 // Builds 1000 ListTiles
//                 childCount: 1000,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
