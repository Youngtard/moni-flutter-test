import 'package:flutter/material.dart';

class JoinACluster extends StatefulWidget {
  const JoinACluster({Key? key}) : super(key: key);

  @override
  State<JoinACluster> createState() => _JoinAClusterState();
}

class _JoinAClusterState extends State<JoinACluster> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String? _userType;

  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black,),
        backgroundColor: const Color(0xffF8F9FD),
      ),
      backgroundColor: const Color(0xffF8F9FD),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Join Moni",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Moni was created for you!\nOur currency here is trust and for you to join our community, you need a recommendation from an existing Moni user near you. Leave your information with us if you haven’t found a cluster near you and you’ll get notified when we have found the right one for you.",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: const Color(0xff666666)),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _firstNameController,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "First Name is required";
                                }
                                return null;
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                hintText: "Enter your first name",
                                labelText: "First Name*",
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color(0xffE4E4E4)
                                  ),
                                ),
                                labelStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff999999),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            TextFormField(
                              controller: _lastNameController,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Last Name is required";
                                }
                                return null;
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                hintText: "Enter your last name",
                                labelText: "Last Name*",
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xffE4E4E4)
                                  ),
                                ),
                                labelStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff999999),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: _phoneNumberController,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Phone Number is required";
                                }
                                return null;
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                hintText: "Phone Number",
                                labelText: "Phone Number*",
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color(0xffE4E4E4)
                                  ),
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                icon: Text("+234", style: Theme.of(context).textTheme.headline5,),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            TextFormField(
                              controller: _emailController,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Email Address is required";
                                }
                                return null;
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "Enter your email address",
                                labelText: "Email Address*",
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color(0xffE4E4E4)
                                  ),
                                ),
                                labelStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff999999),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "How long have you been a POS agent?",
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xffE4E4E4)
                                  ),
                                ),
                                labelStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff999999),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "How did you hear about Moni?",
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xffE4E4E4)
                                  ),
                                ),
                                labelStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff999999),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            DropdownButtonFormField<String>(
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff1A051D),
                              ),
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "User Type is required";
                                }
                                return null;
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                labelText: "What user are you?*",
                                labelStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff999999),
                                ),
                                // hintText: "Select",
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color(0xffE4E4E4)
                                  ),
                                ),
                              ),
                              onChanged: (val) {
                                setState(() {
                                  _userType = val!;
                                });
                              },
                              value: _userType,
                              items: ["Aggregator", "Agent"].map((state) {
                                return DropdownMenuItem(
                                  child: Text(
                                    state,
                                  ),
                                  value: state,
                                );
                              }).toList(),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            TextFormField(
                              controller: _addressController,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Shop Address is required";
                                }
                                return null;
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                hintText: "Address of your POS shop",
                                labelText: "Shop Address*",
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color(0xffE4E4E4)
                                  ),
                                ),
                                labelStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff999999),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            const Spacer(),
                            OutlinedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    showDialog(
                                      context: context,
                                      barrierColor: Colors.black.withOpacity(0.85),
                                      builder: (context) => AlertDialog(
                                        title: Column(
                                          children: [
                                            Container(
                                                width: 48,
                                                height: 48,
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context).primaryColor, shape: BoxShape.circle),
                                                child: const Icon(Icons.check, color: Colors.white)),
                                            const SizedBox(
                                              height: 24,
                                            ),
                                            Text(
                                              "Submitted!",
                                              style: Theme.of(context).textTheme.headline5!.copyWith(
                                                fontSize: 20,
                                                color: Colors.black
                                              ),
                                            )
                                          ],
                                        ),
                                        content: Text(
                                          "Your form was submitted successfully. Kindly check your mail for further details",
                                            style: Theme.of(context).textTheme.bodyText1!.copyWith(                                                color: Colors.black
                                            ),
                                          textAlign: TextAlign.center,
                                        ),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                      ),
                                    );

                                  }
                                },
                                child: Text(
                                  "Submit",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(color: Colors.white),
                                ),
                                style: OutlinedButton.styleFrom(
                                  primary: Colors.black,
                                  minimumSize: const Size(double.infinity, 50),
                                  // padding: padding,
                                  backgroundColor: Theme.of(context).primaryColor,
                                  // side: BorderSide(color: borderColor ?? Colors.white, width: 0.5),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    // side: BorderSide(color: borderColor ?? Colors.black, width: 0.5),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
