import 'package:moni_flutter_test/modules/cluster/models/loan_details.dart';

class Loan {
  Loan({
    this.id,
    this.agentId,
    this.clusterId,
    this.agentLoanId,
    this.loanAmount,
    this.createdAt,
    this.loanDetails,
  });

  String? id;
  String? agentId;
  String? clusterId;
  String? agentLoanId;
  int? loanAmount;
  DateTime? createdAt;
  LoanDetails? loanDetails;

  factory Loan.fromJson(Map<String, dynamic> json) => Loan(
    id: json["id"],
    agentId: json["agent_id"],
    clusterId: json["cluster_id"],
    agentLoanId: json["agent_loan_id"],
    loanAmount: json["loan_amount"],
    createdAt: DateTime.parse(json["created_at"]),
    loanDetails: LoanDetails.fromJson(json["agent_loan"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "agent_id": agentId,
    "cluster_id": clusterId,
    "agent_loan_id": agentLoanId,
    "loan_amount": loanAmount,
    "created_at": createdAt!.toIso8601String(),
    "agent_loan": loanDetails!.toJson(),
  };
}