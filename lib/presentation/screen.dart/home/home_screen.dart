import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/model/user_model.dart';
import 'package:youtube_clone/presentation/screen.dart/home/widget/silverAppBar.dart';
import 'package:youtube_clone/presentation/screen.dart/shorts/shorts_screen.dart';
import 'package:youtube_clone/util/app_sizes.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? isVisible;
  void initState() {
    isVisible = false;
    super.initState();
  }

  void refress() {
    print('refress');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MiniplayerController miniplayerController = MiniplayerController();
    int n = 0;
    return Scaffold(
      body: MiniplayerWillPopScope(
        key: _navigatorKey,
        onWillPop: () async {
          final NavigatorState navigator = _navigatorKey.currentState!;
          if (!navigator.canPop()) {
            print('1-------------------');
            return true;
          } else {
            print('2-----------------------');
            navigator.pop();
          }
          print('3-----------------------');
          return false;
        },
        child: Stack(
          children: <Widget>[
            CustomScrollView(
              slivers: [
                const SilverAppBar(),
                RefreshIndicator(
                  onRefresh: () async {
                    return refress();
                  },
                  child: SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: videos.length, (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isVisible = true;
                                      n = index;
                                    });
                                  },
                                  child: Container(
                                    height: size.height * 3 / 10,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              videos[index].thumbnailUrl,
                                            ),
                                            fit: BoxFit.fill)),
                                  ),
                                ),
                                Positioned(
                                    right: Sizes.p8,
                                    bottom: Sizes.p8,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.4),
                                          borderRadius:
                                              BorderRadius.circular(Sizes.p4)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: Sizes.p4),
                                      child: Text(
                                        videos[index].duration.toString(),
                                        style: const TextStyle(
                                            fontFamily: 'Roboto-Medium',
                                            fontSize: Sizes.p10,
                                            color: Colors.white),
                                      ),
                                    ))
                              ],
                            ),
                            gapH10,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        videos[index].author.profileImageUrl),
                                  ),
                                ),
                                gapW10,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        videos[index].title.toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            height: 0,
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),
                                      // gapH4,
                                      Row(
                                        children: [
                                          Text(
                                            videos[index]
                                                .author
                                                .username
                                                .toString(),
                                            style: const TextStyle(
                                                fontFamily: 'Roboto-Light',
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                          gapW4,
                                          const CircleAvatar(
                                            radius: 1,
                                            backgroundColor: Colors.grey,
                                          ),
                                          gapW4,
                                          Text(
                                            '${videos[index].author.subscribers} views',
                                            style: const TextStyle(
                                                fontFamily: 'Roboto-Light',
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                          gapW4,
                                          const CircleAvatar(
                                            radius: 1,
                                            backgroundColor: Colors.grey,
                                          ),
                                          gapW4,
                                          const Text(
                                            '7 hours ago',
                                            style: TextStyle(
                                                fontFamily: 'Roboto-Light',
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.more_vert)
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })),
                )
              ],
            ),
            isVisible!
                ? Miniplayer(
                    controller: miniplayerController,
                    minHeight: 80,
                    maxHeight: size.height,
                    builder: (height, percentage) => height > 80
                        ? Container(
                            color: Colors.amber,
                            child: ShortScreen(
                              index: n,
                            ))
                        : Container(
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                    width: size.width / 2,
                                    child: ShortScreen(
                                      index: n,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isVisible = false;
                                      });
                                    },
                                    icon: Icon(Icons.clear))
                              ],
                            ),
                          ))
                : Container()
          ],
        ),
      ),
    );
  }
}
