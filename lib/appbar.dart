import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triathlon/settings.dart';
import 'package:badges/badges.dart' as badges;
import 'home.dart';
import 'notifications.dart';

enum MenuItem{
  item1,
  item2,
  item3,
  item4,
}
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key? key,required this.title}) :super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Text(widget.title,style: TextStyle(),),
      leading:IconButton(
        splashColor: Colors.red,
        icon:Icon(Icons.arrow_back_ios),
        onPressed: (){
          Navigator.pop(context);
        },
      ) ,

      actions: [
        badges.Badge(
          position: badges.BadgePosition.topEnd(top: 5, end: 0),
          showBadge: (true),
          badgeContent: Text('5',style: TextStyle(color: Colors.purpleAccent),),
          badgeAnimation: badges.BadgeAnimation.rotation(
            animationDuration: Duration(seconds: 1),
            colorChangeAnimationDuration: Duration(seconds: 1),
            loopAnimation: false,
            curve: Curves.fastOutSlowIn,
            colorChangeAnimationCurve: Curves.easeInCubic,
          ),
          badgeStyle: badges.BadgeStyle(
            shape: badges.BadgeShape.circle,
            badgeColor: Colors.purpleAccent,
            borderRadius: BorderRadius.circular(4),

            elevation: 0,
          ),

          child: IconButton(
            icon: Icon(Icons.notifications,color: Colors.purpleAccent,size: 40,),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context){
                    return NotificationPage();
                  }));
            },

          ),
        ),

      ],
    );
  }
}
