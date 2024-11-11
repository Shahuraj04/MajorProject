import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool showBottomNavBar = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 100) {
        // Show BottomNavigationBar after scrolling 100 pixels
        setState(() {
          showBottomNavBar = true;
        });
      } else {
        setState(() {
          showBottomNavBar = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249,249,249, 1),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 20,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Welcome to Our App'),
              background: Container(
                color: Colors.white,
              ),
            ),
            bottom: showBottomNavBar
                ? null
                : PreferredSize(
                    preferredSize: const Size.fromHeight(50),
                    child: buildAppBarNavBar(),
                  ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                buildPageContent(
                  context,
                  'On your way...',
                  'to find the perfect looking Onboarding for your app?',
                  Icons.explore,
                ),
                buildPageContent(
                  context,
                  'You’ve reached your destination.',
                  'Sliding with animation',
                  Icons.location_on,
                ),
                buildPageContent(
                  context,
                  'Start now!',
                  'Where everything is possible and customize your onboarding.',
                  Icons.star,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                      ),
                      onPressed: () {
                        // Handle button tap to navigate to registration page
                      },
                      child: const Text(
                        'Get Started',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: showBottomNavBar ? buildBottomNavBar() : null,
    );
  }

  Widget buildAppBarNavBar() {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 24,
              width: 24,
              child: const Image(image: AssetImage("assets/assets/Home.png")),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 24,
              width: 24,
              child: const Image(image: AssetImage("assets/assets/Icon- Outline.png")),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 24,
              width: 24,
              child: const Image(image: AssetImage("assets/assets/Notification.png")),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 24,
              width: 24,
              child: const Image(image: AssetImage("assets/assets/Menu.png")),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomNavBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: new Image.asset("assets/assets/Home.png"),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: new Image.asset("assets/assets/Icon- Outline.png"),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: new Image.asset('assets/assets/Notification.png'),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: new Image.asset("assets/assets/Menu.png"),
          label: 'Profile',
        )
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black45,
      onTap: (index) {
        // Handle BottomNavigationBar item tap
      },
    );
  }

  Widget buildPageContent(
      BuildContext context, String title, String subtitle, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: MediaQuery.of(context).size.height * 0.2,
            color: Colors.blue,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
