import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Lista de Contatos",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
      body: const Column(children: [
        TopBar(),
      ]),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
          color: Colors.blueAccent,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white),
            height: MediaQuery.of(context).size.height - 200,
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 40, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text("Status"),
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                      height: 60,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.blueAccent,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 28,
                                backgroundImage: NetworkImage(
                                    "https://loremflickr.com/320/32$index"),
                              ),
                            );
                          }))),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 150, right: 10, bottom: 10),
          child: SizedBox(
              height: MediaQuery.of(context).size.height - 240,
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        child: Image.network(
                            'https://loremflickr.com/320/32$index'),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 160,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Nome",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Endereço: O endereço da pessoa que está vindo visitar ou que eu tenha contato",
                            style: TextStyle(fontSize: 17),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text("17:00"),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: index != 0 ? Colors.red : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  index != 0 ? '$index' : '',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        )),
                  ],
                );
              })),
        ),
      ],
    );
  }
}
