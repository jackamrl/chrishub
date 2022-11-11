import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers.dart';
import '../theme/theme.dart';

class Wallpaper extends StatefulWidget {
  const Wallpaper({Key? key}) : super(key: key);

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {

  late WallData wallpaper;
  bool darkTheme=true;
  List<WallData> wallData=[
    WallData(name: "Big Sur", location: "assets/wallpapers/bigsur_dark.jpg"),
    WallData(name: "Big Sur", location: "assets/wallpapers/bigsur_dark.jpg"),
    WallData(name: "Big Sur", location: "assets/wallpapers/bigsur_dark.jpg"),
    WallData(name: "Big Sur", location: "assets/wallpapers/bigsur_dark.jpg"),
    WallData(name: "Big Sur", location: "assets/wallpapers/bigsur_dark.jpg"),
    WallData(name: "Big Sur", location: "assets/wallpapers/bigsur_dark.jpg"),
    WallData(name: "Big Sur", location: "assets/wallpapers/bigsur_dark.jpg"),

   // WallData(name: "Big Sur", location: "assets/wallpapers/bigsur_${darkTheme?"dark":"light"}.jpg"),

  ];


  @override
  Widget build(BuildContext context) {
     darkTheme= Provider.of<ThemeNotifier>(context).isDark();
    wallpaper=Provider.of<DataBus>(context, listen: true).getWallpaper;
    log(wallData[0].location);
    return Container(
      decoration: BoxDecoration(
        color:
        Theme.of(context).colorScheme.onError,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15)),
      ),
      padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 30,
          bottom: 10
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .errorContainer,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 0.3
            )
        ),
        padding: EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 20
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 40,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.4),
                          width: 1.2
                      )
                  ),
                  height: 90,
                  width: 130,
                  child: Image.asset(
                    wallpaper.location,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                RichText(
                 text: TextSpan(
                   text: "\n${wallpaper.name}\n",
                   children: [
                     TextSpan(
                       text: wallpaper.location.contains("_")?"This desktop picture changes with your current theme.":"",
                       style: TextStyle(
                         fontSize: 11,
                         fontWeight: FontWeight.w300,
                         letterSpacing: .5
                       )
                     )
                   ],
                   style: TextStyle(
                     fontSize: 14,
                     color: Theme.of(context).cardColor.withOpacity(1),
                     fontWeight: Theme.of(context)
                         .textTheme
                         .headline3!
                         .fontWeight,
                     fontFamily: "SF",
                   ),
                 ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color:
                    Theme.of(context).colorScheme.onError,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                        width: 0.3
                    )
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.6,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10
                  ),
                  itemCount: wallData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Provider.of<DataBus>(context,
                            listen: false)
                            .setWallpaper(wallData[index],);
                      },
                      child: Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                                color: wallpaper.location==wallData[index].location?Colors.blueAccent:Colors.grey.withOpacity(0.4),
                                width: 1.2
                            )
                        ),
                        child: Image.asset(
                          wallData[index].location,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                },),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WallData{
  String name="", location="";
  WallData({required this.name, required this.location});
}


class ViewWallpaper extends StatelessWidget {
  const ViewWallpaper({Key? key, required this.location}) : super(key: key);

  final String location;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      location.contains("_") ?
      location.splitMapJoin("_",
          onMatch: (a){
            return Provider.of<ThemeNotifier>(context).isDark()?"_dark":"_light";
          })
          :location,
      fit: BoxFit.cover,
    );
  }
}
