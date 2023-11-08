// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';

import 'package:f1_ranking/utils/utils.dart';
import 'package:f1_ranking/widgets/user_info.dart';
import 'package:f1_ranking/styles/app_styles.dart';
import 'package:f1_ranking/widgets/driver_tile.dart';
import 'package:f1_ranking/widgets/logout_button.dart';
import 'package:f1_ranking/viewmodels/user_viewmodel.dart';
import 'package:f1_ranking/viewmodels/driver_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserViewmodel _userViewmodel;

  final _scrollController = ScrollController();

  @override
  void initState() {
    _userViewmodel = context.read<UserViewmodel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryColor,
      appBar: AppBar(
        toolbarHeight: setWidth(120),
        backgroundColor: AppStyles.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UserInfo(
              // Reading values from viewmodel
              firstName: _userViewmodel.firstName!,
              lastName: _userViewmodel.lastName!,
            ),
            const LogoutButton(),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(AppStyles.spacingLarge),
        decoration: const BoxDecoration(
          color: AppStyles.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppStyles.radiusExtraLarge),
            topRight: Radius.circular(AppStyles.radiusExtraLarge),
          ),
        ),

        // Listening to the viewmodel
        child: Consumer<DriverViewmodel>(
          builder: (context, driverViewmodel, _) {
            if (driverViewmodel.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppStyles.primaryColor,
                ),
              );
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppStyles.spacingLarge),
                  child: Text(
                    'Top 10 ranking 2021',
                    style: TextStyle(
                      color: AppStyles.primaryColor,
                      fontSize: AppStyles.fontSizeLarge,
                      fontWeight: AppStyles.fontWeightBold,
                      height: setHeight(0.07),
                    ),
                  ),
                ),
                Expanded(
                  child: FadingEdgeScrollView.fromScrollView(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: driverViewmodel.drivers.length,
                      itemBuilder: (context, index) {
                        final driver = driverViewmodel.drivers[index];
                        return DriverTile(driver: driver);
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
