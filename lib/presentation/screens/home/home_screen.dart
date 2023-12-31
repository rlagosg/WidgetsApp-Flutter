import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(        
        title: const Text('My App'),
      ),
      body: _HomeView(),
      drawer: SideMenu( scaffoldKey: scaffoldKey), //menu del lado derecho
      //endDrawer: Placeholder(), //menu del lado izquierdo
    );
  }
}

class _HomeView extends StatelessWidget {
  //const _HomeView({ super.key,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        //physics: const BouncingScrollPhysics(),
        itemCount: appMenuItems.length,
        itemBuilder: (contex, index){
          final menuItem = appMenuItems[index];
          return _CustomListTitle(menuItem: menuItem);
        }
      );
  }
}

class _CustomListTitle extends StatelessWidget {

  const _CustomListTitle({ required this.menuItem, });
  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary,),
      trailing: Icon( Icons.arrow_forward_ios_outlined, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: (){ 
        context.push(menuItem.link);
      },
    );
  }
}