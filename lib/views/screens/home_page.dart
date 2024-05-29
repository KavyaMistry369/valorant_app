import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:valorant_app/services/api_service.dart';
import 'package:valorant_app/utils/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isWheel = false;

  void toggle() {
    isWheel = !isWheel;
  }

  @override
  void initState() {
    // TODO: implement initState
    toggle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        actions: [
          IconButton(onPressed: (){
            setState(() {
              toggle();
            });
          }, icon: (isWheel)?Icon(Icons.list):Icon(Icons.list_alt))
        ],
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo.png",
          width: 80,
        ),
      ),
      body: Center(
        child: (isWheel)
            ? CarouselSlider(
                items: List.generate(
                  APIService.apiService.allAgents.length,
                  (index) => GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context,Routes.detailPage,arguments: index);
                    },
                    child: Card(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Stack(
                            children: [
                              Text(
                                "${APIService.apiService.allAgents[index]["displayName"]}",
                                style: TextStyle(
                                    fontFamily: 'Valorant', fontSize: 30),
                              ),
                              Center(
                                  child: Opacity(
                                      opacity: 0.1,
                                      child: Transform.scale(
                                          scale: 1.3,
                                          child: Image.network(
                                              "${APIService.apiService.allAgents[index]["background"]}")))),
                              Center(
                                child: Transform.scale(
                                    scale: 1.6,
                                    child: Hero(
                                      transitionOnUserGestures: true,
                                      tag: "${APIService.apiService.allAgents[index]}",
                                      child: Image.network(
                                        "${APIService.apiService.allAgents[index]["fullPortrait"]}",
                                        width: 500,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  aspectRatio: 2 / 3,
                  autoPlay: true,
                ))
            : ListWheelScrollView(
          physics: const BouncingScrollPhysics(),
            itemExtent:550, children: List.generate(
          APIService.apiService.allAgents.length,
              (index) => GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context,Routes.detailPage,arguments: index);
                },
                child: Card(
                            child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Text(
                        "${APIService.apiService.allAgents[index]["displayName"]}",
                        style: TextStyle(
                            fontFamily: 'Valorant', fontSize: 30),
                      ),
                      Center(
                          child: Opacity(
                              opacity: 0.1,
                              child: Transform.scale(
                                  scale: 1.3,
                                  child: Image.network(
                                      "${APIService.apiService.allAgents[index]["background"]}")))),
                      Center(
                        child: Transform.scale(
                            scale: 1.6,
                            child: Image.network(
                              "${APIService.apiService.allAgents[index]["fullPortrait"]}",
                              width: 500,
                            )),
                      ),
                    ],
                  ),
                ),
                            ),
                          ),
              ),
        ), clipBehavior: Clip.hardEdge),
      ),
    );
  }
}
