import 'package:flutter/material.dart';
import 'package:nextbestie_admin/core/base/base_controller.dart';
import 'package:nextbestie_admin/core/widgets/custom_dialogue_box.dart';

class UserDetailsScreenController extends BaseController {
  UserDetailsScreenController(super.iNavigator);

  void blockUserDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => CustomDialogueBox(
        title: 'Unblock User',
        description: 'Are you sure you want to block this user?',
        leftButton: 'Block',
        rightButton: 'Cancel',
        // If your CustomDialogueBox supports callbacks, wire them:
      ),
    );
  }
}
