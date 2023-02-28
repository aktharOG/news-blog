import 'package:flutter/material.dart';
import 'package:news_and_blogs/view/screens/home_screen.dart';
import 'package:news_and_blogs/viewModel/common_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: ((context) => CommonViewModel())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(
          
        )
      ),
    );
  }
}
