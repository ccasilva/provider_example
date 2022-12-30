import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/change_notifier/change_notifier_page.dart';
import 'package:provider_example/change_notifier/provider_controller.dart';
import 'package:provider_example/provider/provider_page.dart';
import 'package:provider_example/provider/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) {
            return UserModel(
              name: 'Carlos Silva',
              imgAvatar:
                  'https://instagram.fcgh37-1.fna.fbcdn.net/v/t51.2885-19/67286120_428750781064954_3096915743925600256_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fcgh37-1.fna.fbcdn.net&_nc_cat=110&_nc_ohc=0g9WFn2U7QwAX8cVQMf&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfClUQvclPssAD03pcCeiXn8KxfEOYOX-fjBeBfK8MExBw&oe=63B47ECD&_nc_sid=8fd12b',
              birthDate: '17/11/1988',
            );
          },
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderController(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/provider': (_) => const ProviderPage(),
          '/change': (_) => const ChangeNotifierPage(),
        },
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/provider');
                      },
                      child: const Text('Provider'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/change');
                      },
                      child: const Text('Change Notifier'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
