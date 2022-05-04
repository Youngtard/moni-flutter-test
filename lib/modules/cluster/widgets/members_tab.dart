import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moni_flutter_test/modules/cluster/models/cluster.dart';
import 'package:moni_flutter_test/utils/utils.dart';

class MembersTab extends StatefulWidget {
  const MembersTab({Key? key, required this.cluster}) : super(key: key);

  final Cluster cluster;

  @override
  State<MembersTab> createState() => _MembersTabState();
}

class _MembersTabState extends State<MembersTab> {
  bool _overdueLoansExpanded = true;
  bool _dueLoansExpanded = true;
  bool _activeLoansExpanded = true;
  bool _inactiveLoansExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
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
              children: widget.cluster.overdueAgents!.isNotEmpty
                  ? widget.cluster.overdueAgents!
                      .map(
                        (agent) => ListTile(
                          leading: SizedBox(
                            width: 40,
                            height: 40,
                            child: CachedNetworkImage(
                              imageUrl: agent.agentDetails.mediaUrl ?? "",
                              placeholder: (context, url) => const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Image.asset(
                                "assets/images/face.png",
                              ),
                            ),
                          ),
                          title: Row(
                            children: [
                              Text(
                                "${agent.agentDetails.firstName} ${agent.agentDetails.lastName}",
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: 4,
                                height: 4,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: Color(0xffC4C4C4)),
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
                            "${nairaSymbol.currencyName}${currencyFormat.format(agent.agentDetails.recentLoan!.loanDetails!.loanAmountDue!)} Active loan",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
              children: widget.cluster.dueAgents!.isNotEmpty
                  ? widget.cluster.dueAgents!
                      .map(
                        (agent) => ListTile(
                          leading: SizedBox(
                            width: 40,
                            height: 40,
                            child: CachedNetworkImage(
                              imageUrl: agent.agentDetails.mediaUrl ?? "",
                              placeholder: (context, url) => const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Image.asset(
                                "assets/images/face.png",
                              ),
                            ),
                          ),
                          title: Row(
                            children: [
                              Text(
                                "${agent.agentDetails.firstName} ${agent.agentDetails.lastName}",
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: 4,
                                height: 4,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: Color(0xffC4C4C4)),
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
                            "${nairaSymbol.currencyName}${currencyFormat.format(agent.agentDetails.recentLoan!.loanDetails!.loanAmountDue!)} Active loan",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
              children: widget.cluster.activeAgents!.isNotEmpty
                  ? widget.cluster.activeAgents!
                      .map(
                        (agent) => ListTile(
                          leading: SizedBox(
                            width: 40,
                            height: 40,
                            child: CachedNetworkImage(
                              imageUrl: agent.agentDetails.mediaUrl ?? "",
                              placeholder: (context, url) => const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Image.asset(
                                "assets/images/face.png",
                              ),
                            ),
                          ),
                          title: Row(
                            children: [
                              Text(
                                "${agent.agentDetails.firstName} ${agent.agentDetails.lastName}",
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: 4,
                                height: 4,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: Color(0xffC4C4C4)),
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
                            "${nairaSymbol.currencyName}${currencyFormat.format(agent.agentDetails.recentLoan!.loanDetails!.loanAmountDue!)} Active loan",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
              children: widget.cluster.inactiveAgents!.isNotEmpty
                  ? widget.cluster.inactiveAgents!
                      .map(
                        (agent) => ListTile(
                          leading: SizedBox(
                            width: 40,
                            height: 40,
                            child: CachedNetworkImage(
                              imageUrl: agent.agentDetails.mediaUrl ?? "",
                              placeholder: (context, url) => const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Image.asset(
                                "assets/images/face.png",
                              ),
                            ),
                          ),
                          title: Text(
                            "${agent.agentDetails.firstName} ${agent.agentDetails.lastName}",
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(),
                          ),
                          subtitle: Text(
                            "No active loan",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
    );
  }
}
