import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moni_flutter_test/modules/cluster/models/cluster.dart';
import 'package:moni_flutter_test/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ClusterDetailsTab extends StatefulWidget {
  const ClusterDetailsTab({Key? key, required this.cluster}) : super(key: key);

  final Cluster cluster;

  @override
  State<ClusterDetailsTab> createState() => _ClusterDetailsTabState();
}

class _ClusterDetailsTabState extends State<ClusterDetailsTab> {
  String _contributionFrequency = "Monthly";
  final List<String> _contributionFrequencies = [
    "Daily",
    "Weekly",
    "Monthly",
  ];

  String _memberInviteCode = "30DF38TG000";

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

  // late Locale locale;
  // late NumberFormat format;

  @override
  void initState() {
    // locale = Localizations.localeOf(context);
    // format = NumberFormat.simpleCurrency(locale: locale.toString()).currencySymbol;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              "${nairaSymbol.currencyName}${currencyFormat.format(widget.cluster.clusterPurseBalance)}",
              style:
                  Theme.of(context).textTheme.headline5!.copyWith(color: const Color(0xff202325)),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Your contribution is 8% of your eligible amount",
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(color: const Color(0xff979C9E)),
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
                    style: TextStyle(fontFamily: "Inter", color: Color(0xffE66652), fontSize: 14),
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
              style:
                  Theme.of(context).textTheme.bodyText2!.copyWith(color: const Color(0xff404446)),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              ///Naira symbol not rendering
              /// "\u{20A6}" "${nairaSymbol.currencySymbol}"
              "${nairaSymbol.currencyName}${currencyFormat.format(widget.cluster.clusterPurseBalance)}",
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
                      height: 8,
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
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.right,
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
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(color: const Color(0xff72777A)),
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
            InkWell(
              child: Text(
                "https://chat.whatsapp.com/BmK1mYu9zGAGhhqi8xqQQ5",
                style:
                    Theme.of(context).textTheme.bodyText1!.copyWith(color: const Color(0xff198155)),
              ),
              onTap: () {
                launchUrl(Uri.parse("https://chat.whatsapp.com/BmK1mYu9zGAGhhqi8xqQQ5"));
              },
            ),
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
              "${nairaSymbol.currencyName}${currencyFormat.format(widget.cluster.clusterPurseBalance)}",
              style:
                  Theme.of(context).textTheme.headline5!.copyWith(color: const Color(0xff202325)),
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
                  "${nairaSymbol.currencyName}${currencyFormat.format(widget.cluster.clusterPurseBalance)}",
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
    );
  }
}
