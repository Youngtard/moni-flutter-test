import 'package:moni_flutter_test/modules/cluster/models/loan_status.dart';

class LoanDetails {
  LoanDetails({
    this.id,
    this.agentId,
    this.agentCreditScoreId,
    this.loanId,
    this.agentCardId,
    this.interestType,
    this.interestValue,
    this.loanDurationType,
    this.loanDuration,
    this.loanDueDate,
    this.daysPastDue,
    this.loanAmount,
    this.loanAmountDue,
    this.loanInterestDue,
    this.loanPaymentDate,
    this.loanPaymentRate,
    this.loanAmountPaid,
    this.penaltyOutstanding,
    this.penaltyPaid,
    this.principalPaid,
    this.principalOutstanding,
    this.interestPaid,
    this.interestOutstanding,
    this.penaltyAmount,
    this.loanStatus,
    this.isMax,
    this.statusId,
    this.acceptTerms,
    this.createdAt,
    this.modifiedAt,
    this.status,
  });

  String? id;
  String? agentId;
  String? agentCreditScoreId;
  String? loanId;
  String? agentCardId;
  String? interestType;
  double? interestValue;
  String? loanDurationType;
  int? loanDuration;
  DateTime? loanDueDate;
  int? daysPastDue;
  int? loanAmount;
  int? loanAmountDue;
  int? loanInterestDue;
  DateTime? loanPaymentDate;
  int? loanPaymentRate;
  int? loanAmountPaid;
  int? penaltyOutstanding;
  int? penaltyPaid;
  int? principalPaid;
  int? principalOutstanding;
  int? interestPaid;
  int? interestOutstanding;
  int? penaltyAmount;
  LoanStatus? loanStatus;
  int? isMax;
  int? statusId;
  int? acceptTerms;
  DateTime? createdAt;
  DateTime? modifiedAt;
  LoanStatus? status;

  factory LoanDetails.fromJson(Map<String, dynamic> json) => LoanDetails(
    id: json["id"],
    agentId: json["agent_id"],
    agentCreditScoreId: json["agent_credit_score_id"],
    loanId: json["loan_id"],
    agentCardId: json["agent_card_id"],
    interestType: json["interest_type"],
    interestValue: json["interest_value"].toDouble(),
    loanDurationType: json["loan_duration_type"],
    loanDuration: json["loan_duration"],
    loanDueDate: DateTime.parse(json["loan_due_date"]),
    daysPastDue: json["days_past_due"] == null ? null : json["days_past_due"],
    loanAmount: json["loan_amount"],
    loanAmountDue: json["loan_amount_due"],
    loanInterestDue: json["loan_interest_due"],
    loanPaymentDate: json["loan_payment_date"] == null ? null : DateTime.parse(json["loan_payment_date"]),
    loanPaymentRate: json["loan_payment_rate"] == null ? null : json["loan_payment_rate"],
    loanAmountPaid: json["loan_amount_paid"],
    penaltyOutstanding: json["penalty_outstanding"],
    penaltyPaid: json["penalty_paid"],
    principalPaid: json["principal_paid"],
    principalOutstanding: json["principal_outstanding"],
    interestPaid: json["interest_paid"],
    interestOutstanding: json["interest_outstanding"],
    penaltyAmount: json["penalty_amount"],
    loanStatus: LoanStatus.fromJson(json["loan_status"]),
    isMax: json["is_max"],
    statusId: json["status_id"],
    acceptTerms: json["accept_terms"],
    createdAt: DateTime.parse(json["created_at"]),
    modifiedAt: DateTime.parse(json["modified_at"]),
    status: LoanStatus.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "agent_id": agentId,
    "agent_credit_score_id": agentCreditScoreId,
    "loan_id": loanId,
    "agent_card_id": agentCardId,
    "interest_type": interestType,
    "interest_value": interestValue,
    "loan_duration_type": loanDurationType,
    "loan_duration": loanDuration,
    "loan_due_date": loanDueDate!.toIso8601String(),
    "days_past_due": daysPastDue == null ? null : daysPastDue,
    "loan_amount": loanAmount,
    "loan_amount_due": loanAmountDue,
    "loan_interest_due": loanInterestDue,
    "loan_payment_date": loanPaymentDate == null ? null : loanPaymentDate!.toIso8601String(),
    "loan_payment_rate": loanPaymentRate == null ? null : loanPaymentRate,
    "loan_amount_paid": loanAmountPaid,
    "penalty_outstanding": penaltyOutstanding,
    "penalty_paid": penaltyPaid,
    "principal_paid": principalPaid,
    "principal_outstanding": principalOutstanding,
    "interest_paid": interestPaid,
    "interest_outstanding": interestOutstanding,
    "penalty_amount": penaltyAmount,
    "loan_status": loanStatus!.toJson(),
    "is_max": isMax,
    "status_id": statusId,
    "accept_terms": acceptTerms,
    "created_at": createdAt!.toIso8601String(),
    "modified_at": modifiedAt!.toIso8601String(),
    "status": status!.toJson(),
  };
}