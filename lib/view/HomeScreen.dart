import 'package:flutter/material.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../controller/api.dart';
import '../controller/themeProvider.dart';
import '../model/weather_model.dart';
import 'SearchScreen.dart';

class HomePage extends StatefulWidget {
  final cityname;

  const HomePage({Key? key, this.cityname}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherResponseModel? wm;

  @override
  void initState() {
    super.initState();
    fetchData(widget.cityname ?? "Ahmadabad");
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }

  fetchData(String text) async {
    await Provider.of<APICallProvider>(context, listen: false)
        .fetchApiData(text)
        .then((value) {
      setState(() {
        wm = value;
      });
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e);
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  Widget build(BuildContext context) {
    final datetime = "${DateTime.now().hour}:${DateTime.now().minute}";
    return _connectionStatus.toString() == "ConnectivityResult.wifi" ||
            _connectionStatus.toString() == "ConnectivityResult.mobile"
        ? Scaffold(
            body: (wm != null)
                ? SafeArea(
                    child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                // "https://avatars.mds.yandex.net/i?id=eee6c32b26883aa16c92e7d8d669754c1ddb84ef-11008180-images-thumbs&n=13"
                                "https://img.freepik.com/premium-vector/day-sun-weather-app-screen-mobile-interface-design-forecast-weather-background-time-concept-vector-banner_87946-3972.jpg"),
                            fit: BoxFit.fill,
                            opacity: 0.4)),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(
                        elevation: 0.0,
                        backgroundColor: Colors.transparent,
                        title: Text(
                          "${wm?.location?.name}",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        centerTitle: true,
                        leading: IconButton(
                            icon: Icon(Icons.location_city),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchPage(),
                                  ));
                            }),
                        actions: [
                          Consumer<ModelTheme>(
                            builder: (context, themevalue, child) {
                              return PopupMenuButton<int>(
                                itemBuilder: (context) => [
                                  // PopupMenuItem 1
                                  PopupMenuItem(
                                    value: 1,
                                    child: Row(
                                      children: const [
                                        Icon(Icons.sunny),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Light ")
                                      ],
                                    ),
                                  ),
                                  // PopupMenuItem 2
                                  PopupMenuItem(
                                    value: 2,
                                    // row with two children
                                    child: Row(
                                      children: [
                                        Icon(Icons.dark_mode_sharp),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Dark")
                                      ],
                                    ),
                                  ),
                                ],
                                elevation: 2,
                                onSelected: (value) {
                                  if (value == 1) {
                                    themevalue.isDark = false;
                                  } else if (value == 2) {
                                    themevalue.isDark = true;
                                  }
                                },
                              );
                            },
                          )
                        ],
                      ),
                      body: CustomScrollView(
                        physics: BouncingScrollPhysics(
                            decelerationRate: ScrollDecelerationRate.fast),
                        scrollDirection: Axis.vertical,
                        slivers: [
                          SliverAppBar(
                            automaticallyImplyLeading: false,
                            elevation: 0.0,
                            backgroundColor: Colors.transparent,
                            expandedHeight: 250,
                            flexibleSpace: Container(
                              child: Center(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text:
                                            "${wm?.timelines!.minutely![0].values!['temperature']}ºc",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 80)),
                                    TextSpan(
                                        text:
                                            "\nSunny    ${wm?.timelines!.minutely![0].values!['temperature']}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 30)),
                                    TextSpan(
                                        text: " ~ ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color:
                                                Colors.white.withOpacity(0.4))),
                                    TextSpan(
                                        text:
                                            "${wm?.timelines!.minutely![0].values!['temperatureApparent']}ºc",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 30)),
                                  ]),
                                ),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              padding:
                                  EdgeInsets.only(top: 20, right: 20, left: 20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(15),
                                        child: Center(
                                          child: Text(
                                            "7 Days Forecast                         More Details >",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("Today"),
                                      Spacer(),
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text:
                                                  "${wm?.timelines!.daily![0].values!.temperatureMax}º",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400)),
                                        ]),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 5,
                                        height: 35,
                                      ),
                                      Text("Tommorrow"),
                                      Spacer(),
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text:
                                                  " ${wm?.timelines!.daily![1].values!.temperatureMax}º",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400)),
                                        ]),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("Next Day"),
                                      Spacer(),
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text:
                                                  " ${wm?.timelines!.daily![2].values!.temperatureMax}º",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400)),
                                        ]),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      height: 30,
                                      width: 100,
                                      child: Center(
                                        child: Text(
                                          "View More ↓",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.access_time_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 10, height: 20),
                                      Text(
                                        "24 - Hour Forecast                                       >",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    height: 150,
                                    child: ListView.separated(
                                      itemCount: 24,
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          width: 10,
                                        );
                                      },
                                      itemBuilder: (context, index) {
                                        return Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.blue.withOpacity(0.3),
                                          ),
                                          height: 70,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                DateFormat('HH:MM').format(wm
                                                        ?.timelines!
                                                        .hourly![index]
                                                        .time ??
                                                    DateTime.now()),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                  "${wm?.timelines?.hourly![index].values!["temperatureApparent"]}º"),
                                              Text(
                                                  "${wm?.timelines?.hourly![index].values!["windSpeed"]}"),
                                              Text(".km/h"),
                                              Image.asset(
                                                "assets/images/mix.png",
                                                height: 30,
                                                width: 30,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 10,
                                          bottom: 20,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.blueAccent
                                              .withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        height: 170,
                                        width: 170,
                                        child: Center(
                                          child: Text(
                                            "💨 Wind Speed : \n       ${wm?.timelines!.daily![0].values!.windSpeedAvg}km/h",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10, bottom: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        height: 170,
                                        width: 170,
                                        child: Center(
                                            child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: DateFormat('🌅 HH:MM')
                                                    .format(wm
                                                            ?.timelines!
                                                            .daily![0]
                                                            .values!
                                                            .sunriseTime! ??
                                                        DateTime.now()),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20)),
                                            TextSpan(
                                                text: " Sunrise\n",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
                                                    color: Colors.white)),
                                            TextSpan(
                                                text:
                                                    "\n${DateFormat('🌇 HH:MM').format(wm!.timelines!.daily![0].values!.sunsetTime ?? DateTime.now())}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20)),
                                            TextSpan(
                                                text: " Sunset",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
                                                    color: Colors.white)),
                                          ]),
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 360,
                                  margin: EdgeInsets.only(right: 10),
                                  width:
                                      (MediaQuery.of(context).size.width / 2) -
                                          20,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text("Humidity"),
                                        trailing: Text(
                                            "${wm?.timelines!.daily![0].values!.humidityAvg}%"),
                                      ),
                                      ListTile(
                                        title: Text("Rain Intensity"),
                                        trailing: Text(
                                            "${wm?.timelines!.daily![0].values!.rainIntensityAvg}"),
                                      ),
                                      ListTile(
                                        title: Text("Weaker (UV)"),
                                        trailing: Text(
                                            "${wm?.timelines!.daily![0].values!.uvHealthConcernAvg}"),
                                      ),
                                      ListTile(
                                        title: Text("Air Pressure"),
                                        trailing: Text(
                                            "${wm?.timelines!.daily![0].values!.pressureSurfaceLevelAvg}hPa"),
                                      ),
                                      ListTile(
                                        title: Text("Chance of rain"),
                                        trailing: Text(
                                            "${wm?.timelines!.daily![0].values!.rainAccumulationLweMax} %"),
                                      ),
                                      ListTile(
                                        title: Text("Feels like"),
                                        trailing: Text(
                                            " ${wm?.timelines!.daily![2].values!.temperatureMax}ºC"),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
                : Center(
                    child: CircularProgressIndicator(),
                  ))
        : SafeArea(
            child: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Text(
                "Network Connectivity is Unavailable!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blueAccent),
              ),
            ),
          ));
  }
}
