import 'repository/repositories.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import './const/colors.dart';
import 'bloc/autocomplete/autocomplete_bloc.dart';
import 'bloc/location/location_bloc.dart';
import 'screens/spashScreen.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  
      runApp(MyApp());



}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
providers: [
         RepositoryProvider<GeolocationRepository>(
          create: (_) => GeolocationRepository(),
        ),
       RepositoryProvider<PlacesRepository>(
          create: (_) => PlacesRepository(),
        ),
        RepositoryProvider<LocalStorageRepository>(
          create: (_) => LocalStorageRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
           BlocProvider(
            create: (context) => AutocompleteBloc(
              placesRepository: context.read<PlacesRepository>(),
            )..add(LoadAutocomplete()),
          ),
        BlocProvider(
            create: (context) => LocationBloc(
              geolocationRepository: context.read<GeolocationRepository>(),
              placesRepository: context.read<PlacesRepository>(),
              localStorageRepository: context.read<LocalStorageRepository>(),
            )..add(LoadMap()),
          ),
        ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pink City',
        theme: ThemeData(
          fontFamily: "Metropolis",
          primarySwatch: Colors.red,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                AppColor.orange,
              ),
              shape: MaterialStateProperty.all(
                const StadiumBorder(),
              ),
              elevation: MaterialStateProperty.all(0),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                AppColor.orange,
              ),
            ),
          ),
          textTheme: const TextTheme(
            displaySmall: TextStyle(
              color: AppColor.primary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            headlineMedium: TextStyle(
              color: AppColor.secondary,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            headlineSmall: TextStyle(
              color: AppColor.primary,
              fontWeight: FontWeight.normal,
              fontSize: 25,
            ),
            titleLarge: TextStyle(
              color: AppColor.primary,
              fontSize: 25,
            ),
            bodyMedium: TextStyle(
              color: AppColor.secondary,
            ),
          ),
        ),
        home:  const SplashScreen(),
      ))
    );

  }
}
