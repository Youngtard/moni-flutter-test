import 'package:moni_flutter_test/modules/cluster/models/agent.dart';

class Cluster {
  Cluster({
    this.clusterPurseBalance,
    this.totalInterestEarned,
    this.totalOwedByMembers,
    this.overdueAgents,
    this.clusterName,
    this.clusterRepaymentRate,
    this.clusterRepaymentDay,
    this.dueAgents,
    this.activeAgents,
    this.inactiveAgents,
  });

  int? clusterPurseBalance;
  int? totalInterestEarned;
  int? totalOwedByMembers;
  List<Agent>? overdueAgents;
  String? clusterName;
  double? clusterRepaymentRate;
  String? clusterRepaymentDay;
  List<Agent>? dueAgents;
  List<Agent>? activeAgents;
  List<Agent>? inactiveAgents;

  factory Cluster.fromJson(Map<String, dynamic> json) => Cluster(
    clusterPurseBalance: json["cluster_purse_balance"],
    totalInterestEarned: json["total_interest_earned"],
    totalOwedByMembers: json["total_owed_by_members"],
    overdueAgents: json["overdue_agents"] == null ? json["overdue_agents"] : List<Agent>.from(json["overdue_agents"].map((x) => x)),
    clusterName: json["cluster_name"],
    clusterRepaymentRate: json["cluster_repayment_rate"].toDouble(),
    clusterRepaymentDay: json["cluster_repayment_day"],
    dueAgents: json["due_agents"] == null ? json["due_agents"] :  List<Agent>.from(json["due_agents"].map((x) => x)),
    activeAgents: json["active_agents"] == null ? json["active_agents"] :  List<Agent>.from(json["active_agents"].map((x) => Agent.fromJson(x))),
    inactiveAgents: json["inactive_agents"] == null ? json["inactive_agents"] :  List<Agent>.from(json["inactive_agents"].map((x) => Agent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cluster_purse_balance": clusterPurseBalance,
    "total_interest_earned": totalInterestEarned,
    "total_owed_by_members": totalOwedByMembers,
    "overdue_agents": overdueAgents == null ? null : List<Agent>.from(overdueAgents!.map((x) => x)),
    "cluster_name": clusterName,
    "cluster_repayment_rate": clusterRepaymentRate,
    "cluster_repayment_day": clusterRepaymentDay,
    "due_agents": dueAgents == null ? null : List<Agent>.from(dueAgents!.map((x) => x)),
    "active_agents": activeAgents == null ? null : List<Agent>.from(activeAgents!.map((x) => x.toJson())),
    "inactive_agents": inactiveAgents == null ? null : List<Agent>.from(inactiveAgents!.map((x) => x.toJson())),
  };
}