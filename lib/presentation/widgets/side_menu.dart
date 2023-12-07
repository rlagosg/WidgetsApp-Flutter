import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    //si es mayor a 35 tenemos notch
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(

      selectedIndex: navDrawerIndex,
      onDestinationSelected: (index){
        setState((){
          navDrawerIndex = index;        
        });

        final menuItem = appMenuItems[index];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();

      },
      children: [

        Padding(padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 :20 , 16, 10)),

        ...appMenuItems
          .sublist(0,3)
          .map((item) => NavigationDrawerDestination(
            icon: Icon( item.icon ), 
            label: Text( item.title )
          ),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10 , 16, 10),
          child: Text('More options'),  
        ),

        ...appMenuItems
          .sublist(3,6)
          .map((item) => NavigationDrawerDestination(
            icon: Icon( item.icon ), 
            label: Text( item.title )
          ),
        ),


      ]
    );
  }
}