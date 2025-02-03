import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:snag_application_1/adapters/xfile_adapter.dart';

import 'package:snag_application_1/l10n/app_localizations.dart';
import 'package:snag_application_1/models/priority_enum_adapter.dart';
import 'package:snag_application_1/models/project.dart';
import 'package:snag_application_1/models/snag.dart';
import 'package:snag_application_1/models/status.dart';
import 'package:snag_application_1/ui/screens/main_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(XFileAdapter());
  Hive.registerAdapter(PriorityAdapter());
  Hive.registerAdapter(StatusAdapter());
  Hive.registerAdapter(SnagAdapter());
  Hive.registerAdapter(ProjectAdapter());

  await Hive.openBox<Snag>('snags');
  await Hive.openBox<Project>('projects');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snag Application',
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      home: const MainScreen(),
    );
  }
}
