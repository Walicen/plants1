import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plants/detail_plants_page.dart';

class PlantsPage extends StatefulWidget {
  @override
  _PlantsPageState createState() => _PlantsPageState();
}

class _PlantsPageState extends State<PlantsPage> {
  var plants = [
    Plant('Cactus', 'assets/images/plant_01.png', 'OUTDOOR', true),
    Plant('Agnolima', 'assets/images/plant_02.png', 'INDOOR', false),
    Plant('Areca', 'assets/images/plant_03.png', 'INDOOR', true),
    Plant('Kentia', 'assets/images/plant_04.png', 'OUTDOOR', false),
    Plant('Areca', 'assets/images/plant_05.png', 'OUTDOOR', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.short_text),
                  ),
                  Image.asset(
                    'assets/images/icon_lotus.png',
                    scale: 2,
                    fit: BoxFit.contain,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.drag_handle),
                  )
                ],
              ),
            ),
            TitleWidget(title: 'My plants'),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 200,
                child: ListView.builder(
                    itemCount: plants.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, idx) {
                      return CardItemMyPlant(
                        plant: plants[idx],
                        onTapItem: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DetailPlantsPage(
                                        plant: plants[idx],
                                      )));
                        },
                      );
                    }),
              ),
            ),
            TitleWidget(
              title: 'Explore',
              icon: Icons.settings,
              onTapIcon: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 200,
                child: ListView.builder(
                    itemCount: plants.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, idx) {
                      return CardItemExplorePlant(plant: plants[idx]);
                    }),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text('Adjust the watering of plants', style: GoogleFonts.hammersmithOne(fontSize: 20, color: Colors.black),),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(left: 25, right: 25),
                        height: 120,
                        decoration: BoxDecoration(
                            color: Color(0xFF44a56d),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            )),
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class Plant {
  final String name;
  final String image;
  final String local;
  final bool selected;

  Plant(this.name, this.image, this.local, this.selected);
}

class CardItemMyPlant extends StatelessWidget {
  final Plant plant;
  final Function onTapItem;

  const CardItemMyPlant({
    Key key,
    @required this.plant,
    this.onTapItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapItem,
      child: Container(
        child: Stack(
          children: <Widget>[
            Align(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                color: Color(0xFF44a56d),
                child: Container(
                    width: 120,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              plant.selected ? Icons.check_circle : Icons.warning,
                              color: Colors.white,
                            ),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, bottom: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                plant.name,
                                style: GoogleFonts.hammersmithOne(
                                    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
                              ),
                              Text(
                                plant.local,
                                style: GoogleFonts.hammersmithOne(color: Colors.white, fontSize: 9),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              alignment: Alignment.bottomCenter,
            ),
            Positioned(
              height: 120,
              left: 25,
              bottom: 75,
              child: Image.asset(
                plant.image,
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTapIcon;

  const TitleWidget({
    Key key,
    @required this.title,
    this.icon,
    this.onTapIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width - 20,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              textScaleFactor: 3,
              style: GoogleFonts.hammersmithOne(fontWeight: FontWeight.bold),
            ),
            icon != null
                ? IconButton(
                    icon: Icon(icon),
                    onPressed: onTapIcon,
                    padding: EdgeInsets.only(right: 30),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}

class CardItemExplorePlant extends StatelessWidget {
  final Plant plant;
  final Function onTapItem;

  const CardItemExplorePlant({Key key, this.plant, this.onTapItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapItem,
      child: Container(
        width: 100,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Image.asset(plant.image),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    plant.name,
                    style: GoogleFonts.hammersmithOne(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    plant.local,
                    style: GoogleFonts.hammersmithOne(fontSize: 9),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
