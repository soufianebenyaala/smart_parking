import 'package:flutter/material.dart';
import 'package:smartparkingv2/Screens/Resarvation/resevation_panier_screen.dart';
import 'package:smartparkingv2/Screens/Parkings/parkings_screen.dart';
import 'package:smartparkingv2/components/menu_item.dart';
import 'package:smartparkingv2/constants.dart';
import 'package:smartparkingv2/main.dart';
import 'package:smartparkingv2/services/shared_prefes_manager.dart';
import 'package:smartparkingv2/services/user_manager.dart';

class SideMenuBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _user = UserManager.currentUser;
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: kPrimaryColor,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                _user != null ?
                ListTile(
                  title: Text(
                    _user.name ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  subtitle: Text(
                    _user.email ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.perm_identity,
                      color: kPrimaryColor,
                    ),
                    radius: 20,
                  ),
                ):Container(),
                /*MenuItem(
                  icon: Icons.home,
                  title: 'Home',
                  onTap: () {
                    //onIconPressed();
                    //BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                  },
                ),
                MenuItem(
                  icon: Icons.person,
                  title: 'My Account',
                  onTap: () {
                    //onIconPressed();
                    // BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyAccountClickedEvent);
                  },
                ),
                MenuItem(
                  icon: Icons.shopping_basket,
                  title: 'My Orders',
                  onTap: () {
                    //onIconPressed();
                    //BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyOrdersClickedEvent);
                  },
                ),
                MenuItem(
                  icon: Icons.card_giftcard,
                  title: 'Wishlist',
                ),
                Divider(
                  height: 64,
                  thickness: 0.5,
                  color: Colors.grey,
                  indent: 32,
                  endIndent: 32,
                ),
                MenuItem(
                  icon: Icons.settings,
                  title: 'Settings',
                ),*/
                MenuItem(
                  icon: Icons.card_travel,
                  title: 'Panier',
                  onTap: (context) async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ReservationPanierScreen();
                        },
                      ),
                    );
                  },
                ),
                MenuItem(
                  icon: Icons.exit_to_app,
                  title: 'Log Out',
                  onTap: (context) async  {
                    SharedPrefsManager.setUser("none");
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyApp();
                        },
                      ),
                    );
                  },
                ),

                
              ],
            ),
          ),
        ),
      ],
    );
  }
}
