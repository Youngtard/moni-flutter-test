import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moni_flutter_test/modules/cluster/screens/my_cluster.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedCard = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          "assets/icons/app_logo.svg",
          width: 48,
          height: 48,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Femi Sotonwa",
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: 150,
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: [
                  InkWell(
                    child: Card(
                      elevation: 1.0,
                      child: Center(
                        child: Text(
                          "Cluster",
                          style: Theme.of(context).textTheme.headline2!.copyWith(
                                color: _selectedCard == 0 ? Colors.white : const Color(0xff13163E),
                              ),
                        ),
                      ),
                      color: _selectedCard == 0 ? Theme.of(context).primaryColor : Colors.white,
                    ),
                    onTap: () {
                      setState(() {
                        _selectedCard = 0;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const MyCluster()));
                    },
                  ),
                  InkWell(
                    child: Card(
                      elevation: 1.0,
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Join a Cluster\n",
                            children: [
                              TextSpan(
                                text: "(Not in a cluster yet?)",
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontSize: 12,
                                  color: _selectedCard == 1 ? Colors.white : const Color(0xff13163E),
                                ),
                              )
                            ],
                            style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: _selectedCard == 1 ? Colors.white : const Color(0xff13163E),
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      color: _selectedCard == 1 ? Theme.of(context).primaryColor : Colors.white,
                    ),
                    onTap: () {
                      setState(() {
                        _selectedCard = 1;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
