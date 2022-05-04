import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moni_flutter_test/modules/cluster/models/cluster.dart';
import 'package:moni_flutter_test/modules/cluster/repository/cluster_repository_impl.dart';
import 'package:moni_flutter_test/modules/cluster/widgets/cluster_details_tab.dart';
import 'package:moni_flutter_test/modules/cluster/widgets/members_tab.dart';
import 'package:moni_flutter_test/utils/utils.dart';

class MyCluster extends StatefulWidget {
  const MyCluster({Key? key}) : super(key: key);

  @override
  State<MyCluster> createState() => _MyClusterState();
}

class _MyClusterState extends State<MyCluster> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final Future<Cluster> _fetchClusterAgents = ClusterRepositoryImpl().fetchClusterAgents(path: "loans");

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My cluster",
          style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: SvgPicture.asset(
          "assets/icons/black_bg.svg",
          fit: BoxFit.cover,
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<Cluster>(
          future: _fetchClusterAgents,
          builder: (BuildContext context, AsyncSnapshot<Cluster> snapshot) {
            if (snapshot.hasData) {
              return NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      pinned: false,
                      expandedHeight: 275,
                      flexibleSpace: Stack(
                        children: [
                          Positioned.fill(
                            child: SvgPicture.asset(
                              "assets/icons/black_bg.svg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned.fill(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data!.clusterName!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Container(
                                                padding: const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(100),
                                                    color: const Color(0xff090A0A)),
                                                child: RichText(
                                                  text: TextSpan(
                                                      text: "Repayment rate: ",
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                "${snapshot.data!.clusterRepaymentRate! * 100}%",
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .headline5!
                                                                .copyWith(
                                                                    color: const Color(0xffEAB948)))
                                                      ],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                              color: const Color(0xffCDCFD0))),
                                                )),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Container(
                                                padding: const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(100),
                                                    color: const Color(0xff090A0A)),
                                                child: RichText(
                                                  text: TextSpan(
                                                      text: "Repayment Day: ",
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                "Every ${snapshot.data!.clusterRepaymentDay}",
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .headline5!
                                                                .copyWith(
                                                                    color: const Color(0xff7DDE86)))
                                                      ],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                              color: const Color(0xffCDCFD0))),
                                                )),
                                          ],
                                        ),
                                        Image.asset("assets/images/profile_picture.png")
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    const Divider(
                                      color: Color(0xff72777A),
                                      height: 0,
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Cluster purse balance",
                                              style:
                                                  Theme.of(context).textTheme.bodyText2!.copyWith(
                                                        color: Colors.white,
                                                      ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "${nairaSymbol.currencyName}${currencyFormat.format(snapshot.data!.clusterPurseBalance)}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4!
                                                  .copyWith(color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "+${nairaSymbol.currencyName}${currencyFormat.format(snapshot.data!.totalInterestEarned)} interest today",
                                              style:
                                                  Theme.of(context).textTheme.bodyText2!.copyWith(
                                                        color: const Color(0xff7DDE86),
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6),
                                            color: const Color(0xffE66652),
                                          ),
                                          child: Text(
                                            "View Purse",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    const Divider(
                                      color: Color(0xff72777A),
                                      height: 0,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total interest earned",
                                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                color: const Color(0xffCDCFD0),
                                              ),
                                        ),
                                        Text(
                                          "${nairaSymbol.currencyName}${currencyFormat.format(snapshot.data!.totalInterestEarned)}",
                                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                color: const Color(0xffF0CC79),
                                              ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Divider(
                                      color: Color(0xff72777A),
                                      height: 0,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total owed by members",
                                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                color: const Color(0xffCDCFD0),
                                              ),
                                        ),
                                        Text(
                                          "${nairaSymbol.currencyName}${currencyFormat.format(snapshot.data!.totalOwedByMembers)}",
                                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                                color: Colors.white,
                                              ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: TabBarDelegate(
                        Container(
                          color: const Color(0xffFDF8ED),
                          child: TabBar(
                            controller: _tabController,
                            labelColor: Theme.of(context).primaryColor,
                            unselectedLabelColor: const Color(0xff303437),
                            labelStyle: Theme.of(context).textTheme.headline5,
                            unselectedLabelStyle: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: const Color(0xff303437)),
                            indicatorColor: Theme.of(context).primaryColor,
                            tabs: [
                              Tab(
                                text:
                                    "Members (${snapshot.data!.overdueAgents!.length + snapshot.data!.dueAgents!.length + snapshot.data!.activeAgents!.length + snapshot.data!.inactiveAgents!.length})",
                              ),
                              const Tab(
                                text: "Cluster Details",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      MembersTab(cluster: snapshot.data!),
                      ClusterDetailsTab(cluster: snapshot.data!),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "An error occurred",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  TabBarDelegate(this.child);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
