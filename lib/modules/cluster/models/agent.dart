import 'package:moni_flutter_test/modules/cluster/models/agent_details.dart';

class Agent {
  Agent({
    required this.id,
    required this.userId,
    required this.agentId,
    required this.clusterId,
    required this.statusId,
    required this.acceptedAt,
    required this.createdAt,
    required this.agentDetails,
  });

  String id;
  String userId;
  String agentId;
  String clusterId;
  int statusId;
  DateTime acceptedAt;
  DateTime createdAt;
  AgentDetails agentDetails;

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
    id: json["id"],
    userId: json["user_id"],
    agentId: json["agent_id"],
    clusterId: json["cluster_id"],
    statusId: json["status_id"],
    acceptedAt: DateTime.parse(json["accepted_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    agentDetails: AgentDetails.fromJson(json["agent"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "agent_id": agentId,
    "cluster_id": clusterId,
    "status_id": statusId,
    "accepted_at": acceptedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "agent": agentDetails.toJson(),
  };
}