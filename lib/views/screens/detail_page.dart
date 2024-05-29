import 'package:flutter/material.dart';
import 'package:valorant_app/services/api_service.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    int index = ModalRoute.of(context)!.settings.arguments as int;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biography",style: TextStyle(fontFamily: "Valorant"),),
      ),
      body: Padding(padding: const EdgeInsets.all(16),child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Transform.scale(
                  scale: 1.6,
                    child: Opacity(
                      opacity: 0.1,
                        child: Image.network("${APIService.apiService.allAgents[index]["background"]}"))),
                Column(
                  children: [
                    Text(
                      "${APIService.apiService.allAgents[index]["displayName"]}",
                      style: TextStyle(
                          fontFamily: 'Valorant', fontSize: 30),
                    ),
                    SizedBox(height: 100,),
                    Transform.scale(
                      scale: 1.4,
                        child: Hero(
                          transitionOnUserGestures: true,
                            tag: "${APIService.apiService.allAgents[index]}",
                            child: Image.network("${APIService.apiService.allAgents[index]["fullPortrait"]}"))),
                  ],
                ),
              ],
            ),
            SizedBox(height:50,),
            Row(
              children: [
                Text("Description",style: TextStyle(fontFamily: "Valorant",fontSize: 25,color: Colors.redAccent),),
              ],
            ),
            SizedBox(height:30,),
            Text(
              "${APIService.apiService.allAgents[index]["description"]}",
              style: TextStyle(
                  fontFamily: 'Valorant', fontSize: 14),
            ),
            SizedBox(height:50,),
            Row(
              children: [
                Text("Abilities",style: TextStyle(fontFamily: "Valorant",fontSize: 25,color: Colors.redAccent),),
              ],
            ),
            SizedBox(height:10,),
            ListView(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(4,(i) =>Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    leading: Image.network("${APIService.apiService.allAgents[index]["abilities"][i]["displayIcon"]}",width: 40,),
                    title: Text("${APIService.apiService.allAgents[index]["abilities"][i]["displayName"]}",style: TextStyle(fontFamily: "Valorant",color: Colors.redAccent),),
                    subtitle: Text("${APIService.apiService.allAgents[index]["abilities"][i]["description"]}",style: TextStyle(fontFamily: "Valorant"),),
                  ),
                ),
              ),),
            ),
          ],
        ),
      ),),
    );
  }
}
