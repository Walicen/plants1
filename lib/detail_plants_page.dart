import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plants/plants_page.dart';

class DetailPlantsPage extends StatefulWidget {
  final Plant plant;

  const DetailPlantsPage({Key key, this.plant}) : super(key: key);

  @override
  _DetailPlantsPageState createState() => _DetailPlantsPageState();
}

class _DetailPlantsPageState extends State<DetailPlantsPage> {
  get plant => widget.plant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color(0xff31A05F),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.arrow_back_ios),
                                color: Colors.white,
                                onPressed: () => Navigator.pop(context)),
                            Text(
                              'My plants',
                              style: GoogleFonts.hammersmithOne(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xff6BBE76),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                              )),
                          height: 45,
                          width: 70,
                          child: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 2 - 45,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: InfoWidget(
                                title: plant.name,
                                subtitle: '26 weeks',
                                fontColor: Colors.white,
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: InfoWidget(
                                title: '19 %',
                                subtitle: 'Humidity',
                                fontColor: Colors.white,
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: InfoWidget(
                                title: '36 %',
                                subtitle: 'Fertilizer',
                                fontColor: Colors.white,
                              )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            )),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  color: Color(0xffD0C0BB),
                                  height: 100,
                                  width: 3,
                                ),
                                Container(
                                    width: MediaQuery.of(context).size.width / 2,
                                    height: 120,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Please fill the water tank!',
                                          style: GoogleFonts.hammersmithOne(fontSize: 20, color: Colors.black),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    InfoWidget(title: '10 %', subtitle: 'Water tank'),
                                    InfoWidget(title: '78 %', subtitle: 'Light'),
                                    InfoWidget(title: '24 °', subtitle: 'Temper.'),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.1,
                                    decoration: BoxDecoration(
                                        color: Color(0xff309E60),
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(25))),
                                    child: FlatButton.icon(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.show_chart,
                                          color: Colors.white,
                                        ),
                                        label: Text(
                                          'Statistics',
                                          style: GoogleFonts.hammersmithOne(fontSize: 16, color: Colors.white),
                                        )),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: FlatButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Information',
                                          style: GoogleFonts.hammersmithOne(fontSize: 16, color: Colors.black),
                                        )),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                    bottom: MediaQuery.of(context).size.height / 2 - 150,
                    child: Image.asset(
                      widget.plant.image,
                      height: 400,
                      width: 250,
                      fit: BoxFit.fitWidth,
                    ))
              ],
            )),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key key,
    this.title,
    this.subtitle,
    this.fontColor = Colors.black,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          textScaleFactor: 2.5,
          maxLines: 1,
          softWrap: false,
          style: GoogleFonts.hammersmithOne(
            color: fontColor,
          ),
        ),
        Text(
          subtitle,
          style: GoogleFonts.robotoSlab(color: fontColor),
        )
      ],
    );
  }
}
