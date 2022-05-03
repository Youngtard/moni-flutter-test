import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moni_flutter_test/modules/cluster/models/cluster.dart';
import 'package:moni_flutter_test/modules/cluster/repository/cluster_repository_impl.dart';
import 'package:moni_flutter_test/utils/utils.dart';

class MyCluster extends StatefulWidget {
  const MyCluster({Key? key}) : super(key: key);

  @override
  State<MyCluster> createState() => _MyClusterState();
}

class _MyClusterState extends State<MyCluster> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool _overdueLoansExpanded = true;
  bool _dueLoansExpanded = true;
  bool _activeLoansExpanded = true;
  bool _inactiveLoansExpanded = true;

  Future<Cluster> _fetchClusterAgents = ClusterRepositoryImpl().fetchClusterAgents(path: "loans");

  String _contributionFrequency = "Monthly";
  final List<String> _contributionFrequencies = [
    "Daily",
    "Weekly",
    "Monthly",
  ];

  String _memberInviteCode = "30DF38TG000";

  final _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random.secure();

  String getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  String _repaymentDay = "Sunday";
  final List<String> _repaymentDays = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];

  @override
  void initState() {
    super.initState();
    // _fetchClusterAgents();
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
                // physics: const NeverScrollableScrollPhysics(),
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      // primary: true,
                      automaticallyImplyLeading: false,
                      pinned: false,
                      // stretch: true,
                      // snap: true,
                      // floating: true,
                      // collapsedHeight: 75,
                      // toolbarHeight: 75,
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
                                              "${nairaSymbol.currencySymbol}${currencyFormat.format(snapshot.data!.clusterPurseBalance)}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4!
                                                  .copyWith(color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "+₦${currencyFormat.format(snapshot.data!.totalInterestEarned)} interest today",
                                              style:
                                                  Theme.of(context).textTheme.bodyText2!.copyWith(
                                                        color: const Color(0xff7DDE86),
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.symmetric(horizontal: 24, vertical: 8),
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
                                          "₦${currencyFormat.format(snapshot.data!.totalInterestEarned)}",
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
                                          "₦${currencyFormat.format(snapshot.data!.totalOwedByMembers)}",
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
                          // AppBar()
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
                      Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                        ),
                        child: ListView(
                          children: ListTile.divideTiles(
                            context: context,
                            tiles: [
                              ExpansionTile(
                                initiallyExpanded: _overdueLoansExpanded,
                                maintainState: true,
                                title: Text(
                                  "Overdue Loans",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                trailing: _overdueLoansExpanded
                                    ? const Icon(
                                        Icons.remove,
                                        color: Color(0xff13163E),
                                      )
                                    : const Icon(
                                        Icons.add,
                                        color: Color(0xff13163E),
                                      ),
                                onExpansionChanged: (bool expanded) {
                                  setState(() {
                                    _overdueLoansExpanded = expanded;
                                  });
                                },
                                children: snapshot.data!.activeAgents!.isNotEmpty
                                    ? snapshot.data!.activeAgents!
                                        .map(
                                          (agent) => ListTile(
                                            leading: SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: CachedNetworkImage(
                                                imageUrl: agent.agentDetails.mediaUrl ?? "",
                                                placeholder: (context, url) =>
                                                    const CircularProgressIndicator(),
                                                errorWidget: (context, url, error) => Image.asset(
                                                  "assets/images/face.png",
                                                ),
                                              ),
                                            ),
                                            title: Row(
                                              children: [
                                                Text(
                                                  "${agent.agentDetails.firstName} ${agent.agentDetails.lastName}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Container(
                                                  width: 4,
                                                  height: 4,
                                                  decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Color(0xffC4C4C4)),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  "${(agent.agentDetails.recentLoan!.loanDetails!.loanDueDate!.difference(agent.agentDetails.recentLoan!.createdAt!).inDays).abs()} days over due",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(color: const Color(0xffE41002)),
                                                )
                                              ],
                                            ),
                                            subtitle: Text(
                                              "₦${currencyFormat.format(agent.agentDetails.recentLoan!.loanDetails!.loanAmountDue!)} Active loan",
                                              style:
                                                  Theme.of(context).textTheme.bodyText2!.copyWith(
                                                        color: const Color(0xffe41002),
                                                      ),
                                            ),
                                          ),
                                        )
                                        .toList()
                                    : [
                                        Text(
                                          "No Agent",
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                color: const Color(0xff72777A),
                                              ),
                                        ),
                                      ],
                              ),
                              ExpansionTile(
                                initiallyExpanded: _dueLoansExpanded,
                                maintainState: true,
                                title: Text(
                                  "Due Today",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                trailing: _dueLoansExpanded
                                    ? const Icon(
                                        Icons.remove,
                                        color: Color(0xff13163E),
                                      )
                                    : const Icon(
                                        Icons.add,
                                        color: Color(0xff13163E),
                                      ),
                                onExpansionChanged: (bool expanded) {
                                  setState(() {
                                    _dueLoansExpanded = expanded;
                                  });
                                },
                                children: snapshot.data!.activeAgents!.isNotEmpty
                                    ? snapshot.data!.activeAgents!
                                        .map(
                                          (agent) => ListTile(
                                            leading: SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: CachedNetworkImage(
                                                imageUrl: agent.agentDetails.mediaUrl ?? "",
                                                placeholder: (context, url) =>
                                                    const CircularProgressIndicator(),
                                                errorWidget: (context, url, error) => Image.asset(
                                                  "assets/images/face.png",
                                                ),
                                              ),
                                            ),
                                            title: Row(
                                              children: [
                                                Text(
                                                  "${agent.agentDetails.firstName} ${agent.agentDetails.lastName}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Container(
                                                  width: 4,
                                                  height: 4,
                                                  decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Color(0xffC4C4C4)),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  "due today",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(color: const Color(0xffA05E03)),
                                                )
                                              ],
                                            ),
                                            subtitle: Text(
                                              "₦${currencyFormat.format(agent.agentDetails.recentLoan!.loanDetails!.loanAmountDue!)} Active loan",
                                              style:
                                                  Theme.of(context).textTheme.bodyText2!.copyWith(
                                                        color: const Color(0xffA05E03),
                                                      ),
                                            ),
                                          ),
                                        )
                                        .toList()
                                    : [
                                        Text(
                                          "No Agent",
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                color: const Color(0xff72777A),
                                              ),
                                        ),
                                      ],
                              ),
                              ExpansionTile(
                                initiallyExpanded: _activeLoansExpanded,
                                maintainState: true,
                                title: Text(
                                  "Active Loans",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                trailing: _activeLoansExpanded
                                    ? const Icon(
                                        Icons.remove,
                                        color: Color(0xff13163E),
                                      )
                                    : const Icon(
                                        Icons.add,
                                        color: Color(0xff13163E),
                                      ),
                                onExpansionChanged: (bool expanded) {
                                  setState(() {
                                    _activeLoansExpanded = expanded;
                                  });
                                },
                                children: snapshot.data!.activeAgents!.isNotEmpty
                                    ? snapshot.data!.activeAgents!
                                        .map(
                                          (agent) => ListTile(
                                            leading: SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: CachedNetworkImage(
                                                imageUrl: agent.agentDetails.mediaUrl ?? "",
                                                placeholder: (context, url) =>
                                                    const CircularProgressIndicator(),
                                                errorWidget: (context, url, error) => Image.asset(
                                                  "assets/images/face.png",
                                                ),
                                              ),
                                            ),
                                            title: Row(
                                              children: [
                                                Text(
                                                  "${agent.agentDetails.firstName} ${agent.agentDetails.lastName}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Container(
                                                  width: 4,
                                                  height: 4,
                                                  decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Color(0xffC4C4C4)),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  "${agent.agentDetails.recentLoan!.loanDetails!.loanDueDate!.difference(agent.agentDetails.recentLoan!.createdAt!).inDays} days to due date",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(color: const Color(0xff4F6482)),
                                                )
                                              ],
                                            ),
                                            subtitle: Text(
                                              "₦${currencyFormat.format(agent.agentDetails.recentLoan!.loanDetails!.loanAmountDue!)} Active loan",
                                              style:
                                                  Theme.of(context).textTheme.bodyText2!.copyWith(
                                                        color: const Color(0xff198155),
                                                      ),
                                            ),
                                          ),
                                        )
                                        .toList()
                                    : [
                                        Text(
                                          "No Agent",
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                color: const Color(0xff72777A),
                                              ),
                                        ),
                                      ],
                              ),
                              ExpansionTile(
                                initiallyExpanded: _inactiveLoansExpanded,
                                maintainState: true,
                                title: Text(
                                  "Inactive Loans",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                trailing: _inactiveLoansExpanded
                                    ? const Icon(
                                        Icons.remove,
                                        color: Color(0xff13163E),
                                      )
                                    : const Icon(
                                        Icons.add,
                                        color: Color(0xff13163E),
                                      ),
                                onExpansionChanged: (bool expanded) {
                                  setState(() {
                                    _inactiveLoansExpanded = expanded;
                                  });
                                },
                                // textColor: const Color(0xff13163E),
                                // collapsedTextColor: const Color(0xff13163E),
                                children: snapshot.data!.inactiveAgents!.isNotEmpty
                                    ? snapshot.data!.inactiveAgents!
                                        .map(
                                          (agent) => ListTile(
                                            leading: SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: CachedNetworkImage(
                                                imageUrl: agent.agentDetails.mediaUrl ?? "",
                                                placeholder: (context, url) =>
                                                    const CircularProgressIndicator(),
                                                errorWidget: (context, url, error) => Image.asset(
                                                  "assets/images/face.png",
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                              "${agent.agentDetails.firstName} ${agent.agentDetails.lastName}",
                                              style:
                                                  Theme.of(context).textTheme.bodyText1!.copyWith(),
                                            ),
                                            subtitle: Text(
                                              "No active loan",
                                              style:
                                                  Theme.of(context).textTheme.bodyText2!.copyWith(
                                                        color: const Color(0xff72777A),
                                                      ),
                                            ),
                                          ),
                                        )
                                        .toList()
                                    : [
                                        Text(
                                          "No Agent",
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                color: const Color(0xff72777A),
                                              ),
                                        ),
                                      ],
                              ),
                            ],
                          ).toList(),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset("assets/icons/cluster_purse_setting.svg"),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Cluster purse setting",
                                    style: Theme.of(context).textTheme.headline5!.copyWith(
                                          color: const Color(0xff202325),
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Frequency of contribution",
                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                              color: const Color(0xff303437),
                                            ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        "$_contributionFrequency upfront",
                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                              color: const Color(0xff202325),
                                              fontSize: 16,
                                            ),
                                      )
                                    ],
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: _contributionFrequency,
                                      iconSize: 0.0,
                                      items: _contributionFrequencies
                                          .map(
                                            (String value) => DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: const TextStyle(
                                                  fontFamily: "Inter",
                                                  color: Color(0xffE66652),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (String? newValue) {
                                        setState(
                                          () {
                                            _contributionFrequency = newValue!;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "${nairaSymbol.currencySymbol}${currencyFormat.format(snapshot.data!.clusterPurseBalance)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: const Color(0xff202325)),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Your contribution is 8% of your eligible amount",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: const Color(0xff979C9E)),
                              ),
                              const Divider(
                                color: Color(0xffE3E5E5),
                                thickness: 1.0,
                                height: 32,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset("assets/icons/invite_link.svg"),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Group invite Link/Code",
                                    style: Theme.of(context).textTheme.headline5!.copyWith(
                                          color: const Color(0xff202325),
                                        ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Use the link or code below to invite new members",
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: const Color(0xff202325),
                                    ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Member invite code",
                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                              color: const Color(0xff303437),
                                            ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        _memberInviteCode,
                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                              color: const Color(0xff202325),
                                              fontSize: 16,
                                            ),
                                      )
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _memberInviteCode = getRandomString(11);
                                      });
                                    },
                                    child: const Text(
                                      "Get new code",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          color: Color(0xffE66652),
                                          fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                              const Divider(
                                color: Color(0xffE3E5E5),
                                thickness: 1.0,
                                height: 32,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset("assets/icons/loan_setting.svg"),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Loan setting",
                                    style: Theme.of(context).textTheme.headline5!.copyWith(
                                          color: const Color(0xff202325),
                                        ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Total loan collected by cluster",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: const Color(0xff404446)),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "${nairaSymbol.currencySymbol}${currencyFormat.format(snapshot.data!.clusterPurseBalance)}",
                                style: Theme.of(context).textTheme.headline5!.copyWith(
                                      color: const Color(0xff202325),
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Repayment Day",
                                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                              color: const Color(0xff404446),
                                            ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        "Every $_repaymentDay",
                                        style: Theme.of(context).textTheme.headline5!.copyWith(
                                              color: const Color(0xff202325),
                                              fontWeight: FontWeight.w500,
                                            ),
                                      )
                                    ],
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: _repaymentDay,
                                      iconSize: 0.0,
                                      items: _repaymentDays
                                          .map(
                                            (String value) => DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: const TextStyle(
                                                    fontFamily: "Inter",
                                                    color: Color(0xffE66652),
                                                    fontSize: 14),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (String? newValue) {
                                        setState(
                                          () {
                                            _repaymentDay = newValue!;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Color(0xffE3E5E5),
                                thickness: 1.0,
                                height: 32,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset("assets/icons/loan_setting.svg"),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Pending Join Request",
                                    style: Theme.of(context).textTheme.headline5!.copyWith(
                                          color: const Color(0xff202325),
                                        ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "No pending cluster join request",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: const Color(0xff72777A)),
                              ),
                              const Divider(
                                color: Color(0xffE3E5E5),
                                thickness: 1.0,
                                height: 32,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset("assets/icons/group_settings.svg"),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Group Settings",
                                    style: Theme.of(context).textTheme.headline5!.copyWith(
                                          color: const Color(0xff202325),
                                        ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Group rules",
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: const Color(0xff202325),
                                    ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text(
                                  "1. Check the car’s rental terms as well, because each company has its own rules.\n2. Check the car’s rental terms as well, because each company has its own rules.",
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        color: const Color(0xff202325),
                                      ),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Group WhatsApp",
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: const Color(0xff202325),
                                    ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text("https://chat.whatsapp.com/BmK1mYu9zGAGhhqi8xqQQ5"),
                              const SizedBox(
                                height: 16,
                              ),
                              InkWell(
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.edit,
                                      color: Color(0xffE66652),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Edit Settings",
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                            color: const Color(0xffE66652),
                                          ),
                                    )
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Color(0xffE3E5E5),
                                thickness: 1.0,
                                height: 32,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset("assets/icons/benefits_earned.svg"),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Benefits earned",
                                    style: Theme.of(context).textTheme.headline5!.copyWith(
                                          color: const Color(0xff202325),
                                        ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Total CH benefits earned",
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: const Color(0xff202325),
                                    ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "${nairaSymbol.currencySymbol}${currencyFormat.format(snapshot.data!.clusterPurseBalance)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: const Color(0xff202325)),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Available Benefits",
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: const Color(0xff202325),
                                    ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${nairaSymbol.currencySymbol}${currencyFormat.format(snapshot.data!.clusterPurseBalance)}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: const Color(0xff202325)),
                                  ),
                                  Text(
                                    "+${nairaSymbol.currencySymbol}5,000 today",
                                    style: const TextStyle(
                                      fontFamily: "Inter",
                                      color: Color(0xff23C16B),
                                      fontSize: 13,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              InkWell(
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.visibility,
                                      color: Color(0xffE66652),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "View earning history",
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                        color: const Color(0xffE66652),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "An error occured",
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
