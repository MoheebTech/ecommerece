// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Drawer7 extends StatefulWidget {
  @override
  Drawer7State createState() => Drawer7State();
}

class Drawer7State extends State<Drawer7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          color: Colors.amber,
        ),
        CollapsingNavigationDrawer()
      ]),
    );
  }
}

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  CollapsingNavigationDrawerState createState() =>
      CollapsingNavigationDrawerState();
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 290.0;
  double minWidth = 70.0;
  bool isCollpased = false;
  late AnimationController animationController;
  late Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) {
    return Material(
      elevation: 12.0,
      child: Container(
        width: widthAnimation.value,
        color: drawerBackgroundColor,
        child: Column(
          children: <Widget>[
            /// ---------------------------
            /// Building a Collapsing List Tile widget with Animated Builder.
            /// ---------------------------

            CollapsingListTile(
                onTap: () {},
                isSelected: false,
                title: 'Flutter',
                icon: Icons.person,
                animationController: animationController),

            const Divider(
              color: Colors.grey,
              height: 40.0,
            ),

            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return const Divider(
                    height: 12.0,
                  );
                },
                itemBuilder: (context, counter) {
                  return CollapsingListTile(
                      onTap: () {
                        setState(() {
                          currentSelectedIndex = counter;
                        });
                      },
                      isSelected: currentSelectedIndex == counter,
                      title: navigationItem[counter].title,
                      icon: navigationItem[counter].icon,
                      animationController: animationController);
                },
                itemCount: navigationItem.length,
              ),
            ),

            InkWell(
                onTap: () {
                  setState(() {
                    isCollpased = !isCollpased;
                    isCollpased
                        ? animationController.forward()
                        : animationController.reverse();
                  });
                },
                child: AnimatedIcon(
                  icon: AnimatedIcons.close_menu,
                  progress: animationController,
                  color: Colors.white,
                  size: 40.0,
                )),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}

class CollapsingListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController? animationController;
  final bool isSelected;
  Animation<double>? widthAnimation;

  final Function() onTap;
  Color selectedColor = const Color(0xFF4AC8EA);

  CollapsingListTile(
      {Key? key, required this.title,
      required this.icon,
      required this.animationController,
      required this.isSelected,
      required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          color: isSelected
              ? Colors.transparent.withOpacity(0.3)
              : Colors.transparent,
        ),
        width: widthAnimation?.value,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: isSelected ? selectedColor : Colors.white30,
              size: 38.0,
            ),
            SizedBox(
              width: widthAnimation?.value,
            ),
            (widthAnimation!.value >= 220)
                ? Text(
                    title,
                    style: isSelected
                        ? listTileSelectedStyle
                        : listTileDefaultStyle,
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class NavigationItem {
  String title;
  IconData icon;

  NavigationItem({
    required this.title,
    required this.icon,
  });
}

List<NavigationItem> navigationItem = [
  NavigationItem(title: 'Dashboard', icon: Icons.home),
  NavigationItem(title: 'Favorites', icon: Icons.favorite),
  NavigationItem(title: 'Music Videos', icon: Icons.music_video),
  NavigationItem(title: 'Notification', icon: Icons.notifications),
  NavigationItem(title: 'Settings', icon: Icons.settings)
];

TextStyle listTileDefaultStyle = const TextStyle(
    color: Colors.white70, fontSize: 20.0, fontWeight: FontWeight.w600);
TextStyle listTileSelectedStyle = const TextStyle(
    color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600);

Color selectedColor = const Color(0xFF4AC8EA);
Color drawerBackgroundColor = const Color(0xFF272D34);
