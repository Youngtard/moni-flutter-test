import 'package:flutter/material.dart';
import 'package:moni_flutter_test/modules/profile/widgets/profile_info.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.only(top: 12, bottom: 24),
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          "assets/images/profile_picture.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      RichText(
                        text: TextSpan(text:  "Agent ID: ", children: [
                          TextSpan(
                              text: "adc7d3d1-5627",
                              style: Theme.of(context).textTheme.bodyText1
                          )
                        ], style: Theme.of(context).textTheme.headline5),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  children: const [
                    ProfileInfo(title: "First Name", value: "Femi"),
                    SizedBox(
                      height: 24,
                    ),
                    ProfileInfo(title: "Last Name", value: "Sotonwa"),
                    SizedBox(
                      height: 24,
                    ),
                    ProfileInfo(title: "Email", value: "sotonwaoluwafemi@gmail.com"),
                    SizedBox(
                      height: 24,
                    ),
                    ProfileInfo(title: "Date of Birth", value: "12/1/1997"),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  children: const [
                    ProfileInfo(title: "Business Name", value: "Bonaventures POS"),
                    SizedBox(
                      height: 24,
                    ),
                    ProfileInfo(title: "Shop Address", value: "123, Aderinokun Street"),
                    SizedBox(
                      height: 24,
                    ),
                    ProfileInfo(title: "State", value: "Lagos"),
                    SizedBox(
                      height: 24,
                    ),
                    ProfileInfo(title: "LGA", value: "Oshodi-Isolo"),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
