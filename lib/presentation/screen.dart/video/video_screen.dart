// import 'package:flutter/material.dart';
// import 'package:miniplayer/miniplayer.dart';
// import 'package:youtube_clone/presentation/screen.dart/shorts/shorts_screen.dart';

// final _navigatorKey = GlobalKey<NavigatorState>();

// class VideoScreen extends StatelessWidget {
//   const VideoScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: MiniplayerWillPopScope(
//         key: _navigatorKey,
//         onWillPop: () async {
//           final NavigatorState navigator = _navigatorKey.currentState!;
//           if (!navigator.canPop()) {
//             print('1-------------------');
//             return true;
//           } else {
//             print('2-----------------------');
//             navigator.pop();
//           }
//           print('3-----------------------');
//           return false;
//         },
//         child: Stack(
//           children: <Widget>[
//             Miniplayer(
//               minHeight: 80,
//               maxHeight: size.height,
//               builder: (height, percentage) =>
//                   Container(color: Colors.amber, child: ShortScreen(index: index,)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
