import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/myobserver.dart';
import 'package:you_can/provider/auth_cubit/auth_cubit.dart';
import 'package:you_can/provider/levelsCubit/levelsCubit.dart';
import 'package:you_can/provider/profile_cubit/profile_cubit.dart';
// import 'package:flutter_zoom_sdk/zoom_view.dart';
// import 'package:flutter_zoom_sdk/zoom_options.dart';
import 'package:you_can/view/pages/auth/sign_up/sign_up.dart';
import 'package:you_can/view/pages/auth/welcomeScreen/selectAccountType.dart';
import 'package:you_can/view/pages/auth/welcomeScreen/welcomAuth.dart';
import 'package:you_can/view/pages/home/lectures/lessonsScreen/inside_screens/lessonVideo/lessonVideo.dart';
import 'package:you_can/view/pages/home/sessions/sessionsScreen/inside_screens/sessionVideo/sessionVideo.dart';
import 'package:you_can/view/pages/home/zoom2.dart';
import 'package:you_can/view/pages/home/zoomMeeting.dart';
import 'package:you_can/view/pages/splash_screen/splash_screen.dart';
import 'core/localization/language_cubit.dart';
import 'core/size_config/size_config.dart';
import 'core/style/style.dart';

import 'data/local/hiva_helper.dart';
import 'injection_container.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'view/pages/auth/sign_up/success_create_Account.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  ///------------injection Container & HIVHELPER----------
  await init();
  await HiveHelper.init();
  Bloc.observer = MyObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,widget){
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthCubit>(create: (context) => getIt<AuthCubit>()),
            BlocProvider<LanguageCubit>(create: (context) => getIt<LanguageCubit>()),
            BlocProvider<ProfileCubit>(create: (context) => getIt<ProfileCubit>()..getProfileData()),
            BlocProvider<AllLevelsCubit>(create: (context) => getIt<AllLevelsCubit>()..getAllLevels()),

          ],
          child: BlocBuilder<LanguageCubit, Locale>(
            builder: (_, locale) {
              return MaterialApp(
                localizationsDelegates: [
                  const AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: const [Locale('en'), Locale('ar')],
                locale: locale,
                theme: lightTheme(),
                themeMode: ThemeMode.system,
                 // home: ZoomMeetingPage(meetingLink:'https://us05web.zoom.us/j/86954694052?pwd=V6ForYywdaici6BLzyeaorxe1qDoai.1'),
                 home: SplashScreen(),
                  debugShowCheckedModeBanner: false,
              );
            },
          ),
        );
      },

    );
  }
}

