import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/profile';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final User user = User.user[0];
    return Scaffold(
      appBar: CustomAppbar(
        title: "Profile",
        action: Container(),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(3, 3),
                        blurRadius: 3,
                        spreadRadius: 3)
                  ],
                  image: DecorationImage(
                      image: NetworkImage(user.pic), fit: BoxFit.cover),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.1),
                      Theme.of(context).primaryColor.withOpacity(0.9),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Text(
                      user.fullName,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const TitleWithIcon(title: "Email", icon: Icons.edit),
                Text(
                  user.email,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(height: 1.5),
                ),
                const TitleWithIcon(title: "Pictures", icon: Icons.edit),
                SizedBox(
                  height: 125,
                  child: Container(
                    height: 125,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(user.pic)),
                    ),
                  ),
                ),
                const TitleWithIcon(title: "Locations", icon: Icons.edit),
                Text(
                  "${user.address}, ${user.city}, ${user.country}",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(height: 1.5),
                ),
                const TitleWithIcon(title: "ZipCode", icon: Icons.edit),
                Text(
                  user.zipCode,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(height: 1.5),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
