import 'package:flutter/material.dart';





GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// Global.navigatorKey.currentContext;
BuildContext context = navigatorKey.currentState!.overlay!.context;

