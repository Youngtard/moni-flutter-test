import 'package:moni_flutter_test/modules/cluster/models/loan.dart';

class AgentDetails {
  AgentDetails({
    this.id,
    this.userId,
    this.moniId,
    this.eligibleLoanId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.nickname,
    this.birthDate,
    this.gender,
    this.businessName,
    this.maritalStatus,
    this.education,
    this.houseAddress,
    this.shopAddress,
    this.lga,
    this.city,
    this.state,
    this.country,
    this.phoneNumber,
    this.emailAddress,
    this.bvn,
    this.hasCreditHistory,
    this.verified,
    this.referralLink,
    this.mediaUrl,
    this.channel,
    this.agentRepaymentRate,
    this.bvnVerifiedAfter,
    this.loanEnabled,
    this.statusId,
    this.eligibleLoanModifiedAt,
    this.createdAt,
    this.modifiedAt,
    this.capAgentLoan,
    this.loanCount,
    this.recentLoan,
    this.suspended,
  });

  String? id;
  String? userId;
  dynamic moniId;
  String? eligibleLoanId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? nickname;
  DateTime? birthDate;
  String? gender;
  String? businessName;
  String? maritalStatus;
  String? education;
  String? houseAddress;
  String? shopAddress;
  String? lga;
  String? city;
  String? state;
  dynamic country;
  String? phoneNumber;
  String? emailAddress;
  String? bvn;
  int? hasCreditHistory;
  int? verified;
  String? referralLink;
  String? mediaUrl;
  String? channel;
  int? agentRepaymentRate;
  int? bvnVerifiedAfter;
  int? loanEnabled;
  int? statusId;
  DateTime? eligibleLoanModifiedAt;
  DateTime? createdAt;
  DateTime? modifiedAt;
  int? capAgentLoan;
  int? loanCount;
  Loan? recentLoan;
  bool? suspended;

  factory AgentDetails.fromJson(Map<String, dynamic> json) => AgentDetails(
    id: json["id"],
    userId: json["user_id"],
    moniId: json["moni_id"],
    eligibleLoanId: json["eligible_loan_id"] == null ? null : json["eligible_loan_id"],
    firstName: json["first_name"],
    middleName: json["middle_name"] == null ? null : json["middle_name"],
    lastName: json["last_name"],
    nickname: json["nickname"],
    birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
    gender: json["gender"],
    businessName: json["business_name"] == null ? null : json["business_name"],
    maritalStatus: json["marital_status"] == null ? null : json["marital_status"],
    education: json["education"] == null ? null : json["education"],
    houseAddress: json["house_address"] == null ? null : json["house_address"],
    shopAddress: json["shop_address"],
    lga: json["lga"] == null ? null : json["lga"],
    city: json["city"] == null ? null : json["city"],
    state: json["state"] == null ? null : json["state"],
    country: json["country"],
    phoneNumber: json["phone_number"],
    emailAddress: json["email_address"],
    bvn: json["bvn"] == null ? null : json["bvn"],
    hasCreditHistory: json["has_credit_history"],
    verified: json["verified"],
    referralLink: json["referral_link"],
    mediaUrl: json["media_url"] == null ? null : json["media_url"],
    channel: json["channel"],
    agentRepaymentRate: json["agent_repayment_rate"],
    bvnVerifiedAfter: json["bvn_verified_after"],
    loanEnabled: json["loan_enabled"],
    statusId: json["status_id"],
    eligibleLoanModifiedAt: json["eligible_loan_modified_at"] == null ? null : DateTime.parse(json["eligible_loan_modified_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    modifiedAt: DateTime.parse(json["modified_at"]),
    capAgentLoan: json["cap_agent_loan"],
    loanCount: json["loan_count"],
    recentLoan: json["recent_loan"] == null ? null : Loan.fromJson(json["recent_loan"]),
    suspended: json["suspended"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "moni_id": moniId,
    "eligible_loan_id": eligibleLoanId == null ? null : eligibleLoanId,
    "first_name": firstName,
    "middle_name": middleName == null ? null : middleName,
    "last_name": lastName,
    "nickname": nickname,
    "birth_date": birthDate == null ? null : birthDate!.toIso8601String(),
    "gender": gender,
    "business_name": businessName == null ? null : businessName,
    "marital_status": maritalStatus == null ? null : maritalStatus,
    "education": education == null ? null : education,
    "house_address": houseAddress == null ? null : houseAddress,
    "shop_address": shopAddress,
    "lga": lga == null ? null : lga,
    "city": city == null ? null : city,
    "state": state == null ? null : state,
    "country": country,
    "phone_number": phoneNumber,
    "email_address": emailAddress,
    "bvn": bvn == null ? null : bvn,
    "has_credit_history": hasCreditHistory,
    "verified": verified,
    "referral_link": referralLink,
    "media_url": mediaUrl == null ? null : mediaUrl,
    "channel": channel,
    "agent_repayment_rate": agentRepaymentRate,
    "bvn_verified_after": bvnVerifiedAfter,
    "loan_enabled": loanEnabled,
    "status_id": statusId,
    "eligible_loan_modified_at": eligibleLoanModifiedAt == null ? null : eligibleLoanModifiedAt!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "modified_at": modifiedAt!.toIso8601String(),
    "cap_agent_loan": capAgentLoan,
    "loan_count": loanCount,
    "recent_loan": recentLoan == null ? null : recentLoan!.toJson(),
    "suspended": suspended,
  };
}