import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_clinic_for_psychiatry/data/API/CasheHelper.dart';
import 'package:smart_clinic_for_psychiatry/di/di.dart';
import 'package:smart_clinic_for_psychiatry/presentation/MyBlocObserver.dart';
import 'package:smart_clinic_for_psychiatry/presentation/authentication/loginScreen/LoginScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/authentication/registerScreen/RegisterScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/appTheme/my_theme.dart';
import 'package:smart_clinic_for_psychiatry/presentation/doctorSide/chatScreen/ChatScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/doctorSide/homeScreen/HomeScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/doctorSide/settingsScreen/SettingsScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/newsScreen/logic/cubit/NewCubit.dart';
import 'package:smart_clinic_for_psychiatry/presentation/newsScreen/screens/NewsScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/onBoardScreen/onBoardScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/patientSide/assessmentScreen/AssessmentScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/patientSide/chatScreen/ChatScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/patientSide/homeScreen/HomeScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/patientSide/settingsScreen/SettingsScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/splashScreen/SplashScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/userRoleScreen/UserRoleScreen.dart';
import 'firebase_options.dart';
import 'presentation/newsScreen/logic/cubit/SearchCubit.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CasheHelper.init();

  String? cache = CasheHelper.getData('news');
  String startWidget =
      cache != null ? LoginScreen.routeName : LoginScreen.routeName;

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
            /*UserRoleScreen.routeName: (_) => const UserRoleScreen(),*/
            HomeScreen.routeName: (_) => HomeScreen(),
            HomeScreenDoctor.routeName: (_) => const HomeScreenDoctor(),
            NewsScreen.routeName: (_) => const NewsScreen(),
            SettingsScreen.routeName: (context) => SettingsScreen(),
            SettingsScreenDoctor.routeName: (context) => SettingsScreenDoctor(),
            AssessmentScreen.routeName: (context) => const AssessmentScreen(),
            ChatScreen.routeName: (context) => const ChatScreen(),
            ChatScreenDoctor.routeName: (context) => const ChatScreenDoctor(),
            RegisterScreen.routeName: (context) => const RegisterScreen(),
            LoginScreen.routeName:(context) => const LoginScreen(userRole: ''),

          },
          initialRoute: startWidget,
        ),
      ),
    );
  }
}
