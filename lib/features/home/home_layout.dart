import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/constants/app_assets.dart';
import 'package:nextbestie_admin/core/constants/app_colors.dart';
import 'package:nextbestie_admin/core/extension/fonts_extension.dart';
import 'package:nextbestie_admin/core/extension/num_extension.dart';
import 'package:nextbestie_admin/core/pages/route_names.dart';
import 'package:nextbestie_admin/core/utils/dimension.dart';
import 'package:nextbestie_admin/core/widgets/custom_button.dart';
import 'package:nextbestie_admin/core/widgets/custom_image.dart';
import 'package:nextbestie_admin/core/widgets/custom_scaffold.dart';
import 'package:nextbestie_admin/features/home/home_screen_controller.dart';

class HomeLayout extends StatelessWidget {
  final Widget child;

  const HomeLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return CustomScaffold(
      body: GetBuilder<HomeScreenController>(
        init: HomeScreenController(Get.find()),
        builder: (controller) {
          return SizedBox(
            height: mediaQuery.size.height,
            width: mediaQuery.size.width,
            child: Column(
              children: [
                20.verticalSpace,
                _buildNavHeader(context),
                20.verticalSpace,
                Expanded(
                  child: Row(
                    children: [
                      // Fixed Sidebar
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: Color(0XFFFCF7F7),
                          borderRadius: kRadiusAll(20),
                        ),
                        margin: EdgeInsets.only(bottom: 50),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView(
                                children: [
                                  _buildSidebarItem(
                                    context,
                                    "Articles",
                                    RouteNames.articles,
                                    Icons.article,
                                    controller,
                                    index: 1,
                                  ),
                                  _buildSidebarItem(
                                    context,
                                    "Categories",
                                    RouteNames.categories,
                                    Icons.category,
                                    controller,
                                    index: 2,
                                  ),
                                  _buildSidebarItem(
                                    context,
                                    "Newsletters",
                                    RouteNames.newsletters,
                                    Icons.email,
                                    controller,
                                    index: 3,
                                  ),
                                  _buildSidebarItem(
                                    context,
                                    "User Reports",
                                    RouteNames.userReports,
                                    Icons.report,
                                    controller,
                                    index: 4,
                                  ),
                                  _buildSidebarItem(
                                    context,
                                    "Blocked Users",
                                    RouteNames.blockedUsers,
                                    Icons.block,
                                    controller,
                                    index: 5,
                                  ),
                                ],
                              ),
                            ),
                            // Logout Button
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: CustomButton(
                                text: "Logout",
                                onTap: controller.onLogout,
                              ),
                            ),
                          ],
                        ),
                      ),
                      15.horizontalSpace,
                      // Main Content Area - Only this changes
                      Expanded(
                        child: child,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavHeader(BuildContext context) {
    return Row(
      children: [
        CustomImage(
          imageUrl: AppAssets.logo,
          width: 40,
          height: 40,
        ),
        15.horizontalSpace,
        Text(
          "NextBestie Admin Panel",
          style: context.label16500,
        ),
      ],
    );
  }

  Widget _buildSidebarItem(
    BuildContext context,
    String title,
    String route,
    IconData icon,
    HomeScreenController controller, {
    required int index,
  }) {
    return InkWell(
      onTap: () => controller.onSidebarItemTap(index, route),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: controller.index == index
              ? AppColors.pink.withValues(alpha: .1)
              : Colors.transparent,
          borderRadius: kRadiusAll(10),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.articleTextColor,
            ),
            10.horizontalSpace,
            Text(
              title,
              style: context.label15400,
            ),
          ],
        ),
      ),
    );
  }
}
