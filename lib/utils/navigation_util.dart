import 'package:flutter/material.dart';

import '../route/routes.dart';

final List<String> backStack = [Routes.splash];

extension NavigationUtil on BuildContext {

  Future push(String name, [Object? args]){
    backStack.add(name);
    return Navigator.of(this).pushNamed(name, arguments: args);
  }

  Future pushPage(Widget page){
    return Navigator.of(this).push(MaterialPageRoute(builder: (context) => page));
  }

  Future pushAndRemoveUntil(String name, bool Function(Route) predicate, [Object? args]) => Navigator.of(this).pushNamedAndRemoveUntil(name, predicate, arguments: args);

  bool canPop(){
    return Navigator.of(this).canPop();
  }

  void pop([Object? result]){
    if(!canPop()){
      return;
    }
    if(backStack.isNotEmpty && ModalRoute.of(this)?.settings.name != null) {
      backStack.removeLast();
    }
    return Navigator.of(this).pop(result);
  }
}