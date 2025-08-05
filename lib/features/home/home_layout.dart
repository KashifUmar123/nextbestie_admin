import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nextbestie_admin/core/extension/fonts_extension.dart';
import 'package:nextbestie_admin/core/pages/route_names.dart';
import 'package:nextbestie_admin/core/widgets/custom_button.dart';
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
            child: Row(
              children: [
                // Fixed Sidebar
                Container(
                  width: 250,
                  color: Colors.grey[100],
                  child: Column(
                    children: [
                      // Header
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "Admin Panel",
                          style: context.label20500,
                        ),
                      ),
                      // Navigation Items
                      Expanded(
                        child: ListView(
                          children: [
                            _buildNavItem(
                              context,
                              "Dashboard",
                              RouteNames.dashboard,
                              Icons.dashboard,
                              controller,
                            ),
                            _buildNavItem(
                              context,
                              "Articles",
                              RouteNames.articles,
                              Icons.article,
                              controller,
                            ),
                            _buildNavItem(
                              context,
                              "Categories",
                              RouteNames.categories,
                              Icons.category,
                              controller,
                            ),
                            _buildNavItem(
                              context,
                              "Newsletters",
                              RouteNames.newsletters,
                              Icons.email,
                              controller,
                            ),
                            _buildNavItem(
                              context,
                              "User Reports",
                              RouteNames.userReports,
                              Icons.report,
                              controller,
                            ),
                            _buildNavItem(
                              context,
                              "Blocked Users",
                              RouteNames.blockedUsers,
                              Icons.block,
                              controller,
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
                // Main Content Area - Only this changes
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: child,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    String title,
    String route,
    IconData icon,
    HomeScreenController controller,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => controller.navigateToRoute(route),
    );
  }
}
