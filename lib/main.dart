import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_clinic_for_psychiatry/data/API/CasheHelper.dart';
import 'package:smart_clinic_for_psychiatry/di/di.dart';
import 'package:smart_clinic_for_psychiatry/ui/MyBlocObserver.dart';
import 'package:smart_clinic_for_psychiatry/ui/common/components/appTheme/my_theme.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/authentication/registerScreen/RegisterScreen.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/homeScreen/HomeScreen.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/newsScreen/screens/NewsScreen.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/newsScreen/logic/Cubit/NewCubit.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/newsScreen/logic/Cubit/SearchCubit.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/onBoardScreen/onBoardScreen.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/splashScreen/SplashScreen.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/userRoleScreen/UserRoleScreen.dart';
import 'firebase_options.dart';
import 'ui/screens/assessmentScreen/AssessmentScreen.dart';
import 'ui/screens/authentication/loginScreen/LoginScreen.dart';
import 'ui/screens/chatScreen/ChatScreen.dart';
import 'ui/screens/settingsScreen/SettingsScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CasheHelper.init();

  String? cache = CasheHelper.getData('news');
  String startWidget =
      cache != null ? HomeScreen.routeName : HomeScreen.routeName;

  runApp(
    MyApp(
      startWidget: startWidget,
    ),
  );
  configureDependencies();
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  final String startWidget;

  const MyApp({super.key, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(),
        ),
        BlocProvider(
          create: (context) => NewsCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Smart Clinic For Psychiatry',
          theme: MyTheme.LightTheme,
          routes: {
            SplashScreen.routeName: (_) => SplashScreen(),
            OnBoardingScreen.routeName: (_) => const OnBoardingScreen(),
            LoginScreen.routeName: (_) => LoginScreen(),
            RegisterScreen.routeName: (_) => RegisterScreen(),
            UserRoleScreen.routeName: (_) => UserRoleScreen(),
            HomeScreen.routeName: (_) => HomeScreen(),
            NewsScreen.routeName: (_) => const NewsScreen(),
            SettingsScreen.routeName: (context) => SettingsScreen(),
            AssessmentScreen.routeName: (context) => const AssessmentScreen(),
            ChatScreen.routeName: (context) => const ChatScreen(),
          },
          initialRoute: startWidget,
        ),
      ),
    );
  }
}
