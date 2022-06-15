import 'package:everest_walk_groups/features/services/arguments.dart';
import 'package:everest_walk_groups/features/services/dio_user.dart';
import 'package:everest_walk_groups/features/utils/style.dart';
import 'package:everest_walk_groups/models/single_user_model.dart';
import 'package:flutter/material.dart';

class UserDetail extends StatefulWidget {
  static const String routeName = "/userDetail";

  const UserDetail({Key? key}) : super(key: key);

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "User Detail",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              color: Colors.indigoAccent.withOpacity(0.4),
              height: 300,
              width: double.infinity,
              child: _userDetail(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _userDetail(context) {
    // Using Argument
    final args = ModalRoute.of(context)!.settings.arguments as UserID;
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: FutureBuilder<SingleUserModel?>(
          future: DioCallAPI().viewSingleUser(args.id),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Displaying ID
                    RichText(
                      text: TextSpan(
                        text: "id: ",
                        style: firstRichText,
                        children: [
                          TextSpan(
                            text: snapshot.data!.id.toString(),
                            style: secondRichText,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Displaying name
                    RichText(
                      text: TextSpan(
                        text: "name: ",
                        style: firstRichText,
                        children: [
                          TextSpan(
                            text: snapshot.data!.name,
                            style: secondRichText,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Displaying username
                    RichText(
                      text: TextSpan(
                        text: "username: ",
                        style: firstRichText,
                        children: [
                          TextSpan(
                            text: snapshot.data!.username,
                            style: secondRichText,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Displaying Email
                    RichText(
                      text: TextSpan(
                        text: "email: ",
                        style: firstRichText,
                        children: [
                          TextSpan(
                            text: snapshot.data!.email,
                            style: secondRichText,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Displaying Address {I have only displayed the city name in address}
                    RichText(
                      text: TextSpan(
                        text: "address: ",
                        style: firstRichText,
                        children: [
                          TextSpan(
                            text: snapshot.data!.address.city,
                            style: secondRichText,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Displaying Phone
                    RichText(
                      text: TextSpan(
                        text: "phone: ",
                        style: firstRichText,
                        children: [
                          TextSpan(
                            text: snapshot.data!.phone,
                            style: secondRichText,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Displaying Website
                    RichText(
                      text: TextSpan(
                        text: "website: ",
                        style: firstRichText,
                        children: [
                          TextSpan(
                            text: snapshot.data!.website,
                            style: secondRichText,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Displaying Company {I have only displayed company name}
                    RichText(
                      text: TextSpan(
                        text: "company: ",
                        style: firstRichText,
                        children: [
                          TextSpan(
                            text: snapshot.data!.company.name,
                            style: secondRichText,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
