import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/view/pages/home/home/home_screen.dart';
import 'package:you_can/view/pages/home/practice/practice_screen.dart';
import 'package:you_can/view/pages/home/sessions/sessions_screen.dart';
import '../../../provider/profile_cubit/profile_cubit.dart';
import 'exams/Exams_screen.dart.dart';
import 'lectures/lectures_screen.dart';
import 'myAccount/myaccount_screen.dart';



class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {

  int _page = 0;
  List<Widget> _buildScreens() =>[
    HomeScreen(),
    LecturesScreen(),
    PracticeScreen(),
    ExamsScreen(),
    MyAccountScreen(),
  ];
  late PersistentTabController _controller;
  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    BlocProvider.of<ProfileCubit>(context).getProfileData();
    super.initState();
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    return [
      PersistentBottomNavBarItem(
        icon: FittedBox(
          fit: BoxFit.none,
          clipBehavior: Clip.none,
          child:  Padding(
            padding:  EdgeInsets.only( top: size.height * 0.018,),
            child:const Icon(Icons.home,size: 25,),
          ),
        ),
        title:locale!.home.toString(),
        textStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize:10.sp, fontWeight: FontWeight.w500),
        activeColorPrimary: Theme.of(context).colorScheme.onPrimary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: FittedBox(
          fit: BoxFit.none,
          clipBehavior: Clip.none,
          child:  Padding(
            padding:  EdgeInsets.only( top: size.height * 0.018,),
            child:const Icon(Icons.video_collection,size: 25,),
          ),
        ),
        title: "Lectures",
        textStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w500),
        activeColorPrimary: Theme.of(context).colorScheme.onPrimary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: FittedBox(
          fit: BoxFit.none,
          clipBehavior: Clip.none,
          child:  Padding(
            padding:  EdgeInsets.only( top: size.height * 0.018,),
            child:const Icon(Icons.messenger_outlined,size: 25,),
          ),
        ),
        title: 'Practice',
        textStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w500),
        activeColorPrimary: Theme.of(context).colorScheme.onPrimary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: FittedBox(
          fit: BoxFit.none,
          clipBehavior: Clip.none,
          child:  Padding(
            padding:  EdgeInsets.only( top: size.height * 0.018,),
            child:const Icon(Icons.assignment,size: 25,),
          ),
        ),
        // textStyle: TextStyle(fontSize: 10,),
        title: 'Exams',
        textStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w500),
        activeColorPrimary: Theme.of(context).colorScheme.onPrimary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: FittedBox(
          fit: BoxFit.none,
          clipBehavior: Clip.none,
          child:  Padding(
            padding:  EdgeInsets.only( top: size.height * 0.018,),
            child:const Icon(Icons.person,size: 25,),
          ),
        ),
        textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 10.sp, fontWeight: FontWeight.w500),
        title: 'My account',
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: PersistentTabView(
        context,
        controller: _controller,
        onItemSelected: (index) => setState(() => _page = index),
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Theme.of(context).brightness==Brightness.light?Colors.white:Color(0xff222249),
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        //navBarHeight: Platform.isIOS?MediaQuery.of(context).size.height * 0.060:MediaQuery.of(context).size.height * 0.080,
        hideNavigationBarWhenKeyboardShows: true,
        //margin: Platform.isIOS ? EdgeInsets.all(0) : EdgeInsets.all(20.0),
        padding: const NavBarPadding.only(top: 0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,
        selectedTabScreenContext: (context) {},
        hideNavigationBar: false,
        decoration:const NavBarDecoration(),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties:const ItemAnimationProperties(
          duration: Duration(milliseconds: 100),
          // curve: Curves.fastOutSlowIn,
        ),
        screenTransitionAnimation:const ScreenTransitionAnimation(
          animateTabTransition: true,
          // curve: Curves.linear,
          duration: Duration(milliseconds: 100),
        ),
        navBarStyle: NavBarStyle.style8,
      ),
    );
  }


}