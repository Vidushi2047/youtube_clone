import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_clone/util/app_sizes.dart';

class SilverAppBar extends StatelessWidget {
  const SilverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: const Row(
        children: [
          FaIcon(
            FontAwesomeIcons.youtube,
            color: Colors.purple,
            size: 25,
          ),
          gapW4,
          Text(
            'YouTube',
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Roboto-Bold",
              fontSize: 20,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.cast,
              color: Colors.black,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.black,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ))
      ],
    );
  }
}
