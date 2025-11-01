import 'package:evently/routes.dart';
import 'package:evently/ui/design/design.dart';
import 'package:evently/ui/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppAuthProvider provider = Provider.of<AppAuthProvider>(context);
    var user = provider.getUser();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          InkWell(
            onTap: (){
              provider.logout();
              Navigator.pushReplacementNamed(context, AppRoutes.LoginScreen.route);
            },
            child: Icon(Icons.logout_outlined,
            color: AppColors.backgroundColor,
            ),
          ),

        ],
        title: Row(
          children: [
            user?.name?.isEmpty == false ?
            Text(user?.name??"",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.backgroundColor,
            ),) : CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
