import 'package:flutter/widgets.dart';

class ProviderController extends ChangeNotifier {
  String name = 'None';
  String imgAvatar =
      'https://instagram.fcgh37-1.fna.fbcdn.net/v/t51.2885-19/67286120_428750781064954_3096915743925600256_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fcgh37-1.fna.fbcdn.net&_nc_cat=110&_nc_ohc=0g9WFn2U7QwAX8cVQMf&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfClUQvclPssAD03pcCeiXn8KxfEOYOX-fjBeBfK8MExBw&oe=63B47ECD&_nc_sid=8fd12b';
  String birthDate = '17/11/1988';

  void alterarDados(){
    name = 'Carlos Silva';
    imgAvatar =
        'https://instagram.fcgh37-1.fna.fbcdn.net/v/t51.2885-19/67286120_428750781064954_3096915743925600256_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fcgh37-1.fna.fbcdn.net&_nc_cat=110&_nc_ohc=0g9WFn2U7QwAX8cVQMf&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfClUQvclPssAD03pcCeiXn8KxfEOYOX-fjBeBfK8MExBw&oe=63B47ECD&_nc_sid=8fd12b';
    birthDate = '30/11/2022';
    notifyListeners();
  }

  void alterarNome(){
    name = 'Carlos César';
    notifyListeners();
  }
}
