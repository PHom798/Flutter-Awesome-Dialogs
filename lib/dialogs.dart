import 'dart:async';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class DialogDemoScreen extends StatelessWidget {
  const DialogDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awesome Dialog Showcase'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade100,
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Section
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.purple.shade300],
                    ),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 40,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Awesome Dialog Demo',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Explore various dialog types and animations',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Basic Dialog Types Section
              _buildSectionTitle('Basic Dialog Types'),
              _buildDialogGrid([
                DialogConfig(
                  'Info Dialog',
                  DialogType.info,
                  Colors.blue,
                  Icons.info,
                  AnimType.scale,
                ),
                DialogConfig(
                  'Success Dialog',
                  DialogType.success,
                  Colors.green,
                  Icons.check_circle,
                  AnimType.bottomSlide,
                ),
                DialogConfig(
                  'Warning Dialog',
                  DialogType.warning,
                  Colors.orange,
                  Icons.warning,
                  AnimType.leftSlide,
                ),
                DialogConfig(
                  'Error Dialog',
                  DialogType.error,
                  Colors.red,
                  Icons.error,
                  AnimType.rightSlide,
                ),
                DialogConfig(
                  'Question Dialog',
                  DialogType.question,
                  Colors.indigo,
                  Icons.help,
                  AnimType.topSlide,
                ),
                DialogConfig(
                  'No Header',
                  DialogType.noHeader,
                  Colors.teal,
                  Icons.dashboard,
                  AnimType.scale,
                ),
              ]),

              const SizedBox(height: 24),

              // Advanced Features Section
              _buildSectionTitle('Advanced Features'),
              _buildSpecialFeatureButton(
                context,
                'Custom Header Dialog',
                Icons.star,
                Colors.purple,
                    () => _showCustomHeaderDialog(context),
              ),
              _buildSpecialFeatureButton(
                context,
                'Custom Body Dialog',
                Icons.widgets,
                Colors.amber,
                    () => _showCustomBodyDialog(context),
              ),
              _buildSpecialFeatureButton(
                context,
                'Custom Buttons Dialog',
                Icons.smart_button,
                Colors.cyan,
                    () => _showCustomButtonsDialog(context),
              ),
              _buildSpecialFeatureButton(
                context,
                'Auto Hide Dialog',
                Icons.timer,
                Colors.pink,
                    () => _showAutoHideDialog(context),
              ),
              _buildSpecialFeatureButton(
                context,
                'Keyboard Aware Dialog',
                Icons.keyboard,
                Colors.indigo,
                    () => _showKeyboardAwareDialog(context),
              ),
              _buildSpecialFeatureButton(
                context,
                'Non-Dismissible Dialog',
                Icons.lock,
                Colors.red,
                    () => _showNonDismissibleDialog(context),
              ),
              _buildSpecialFeatureButton(
                context,
                'Close Icon Dialog',
                Icons.close,
                Colors.grey,
                    () => _showCloseIconDialog(context),
              ),
              _buildSpecialFeatureButton(
                context,
                'Custom Background Dialog',
                Icons.palette,
                Colors.deepOrange,
                    () => _showCustomBackgroundDialog(context),
              ),
              _buildSpecialFeatureButton(
                context,
                'Bordered Dialog',
                Icons.border_all,
                Colors.brown,
                    () => _showBorderedDialog(context),
              ),
              _buildSpecialFeatureButton(
                context,
                'Enter Key Enabled Dialog',
                Icons.keyboard_return,
                Colors.lightGreen,
                    () => _showEnterKeyDialog(context),
              ),

              const SizedBox(height: 24),

              // Interactive Dialog Types Section
              _buildSectionTitle('Interactive Dialogs'),
              _buildSpecialFeatureButton(
                context,
                'Dismiss Callback Dialog',
                Icons.notifications,
                Colors.lime,
                    () => _showDismissCallbackDialog(context),
              ),
              _buildSpecialFeatureButton(
                context,
                'Loading Dialog',
                Icons.refresh,
                Colors.deepOrange,
                    () => _showLoadingDialog(context),
              ),
              _buildSpecialFeatureButton(
                context,
                'Confirmation Dialog',
                Icons.verified_user,
                Colors.brown,
                    () => _showConfirmationDialog(context),
              ),
              _buildSpecialFeatureButton(
                context,
                'Form Input Dialog',
                Icons.edit,
                Colors.blue,
                    () => _showFormInputDialog(context),
              ),
              _buildSpecialFeatureButton(
                context,
                'Multi-Step Dialog',
                Icons.linear_scale,
                Colors.purple,
                    () => _showMultiStepDialog(context),
              ),
              _buildSpecialFeatureButton(
                context,
                'Progress Dialog',
                Icons.hourglass_bottom,
                Colors.orange,
                    () => _showProgressDialog(context),
              ),

              const SizedBox(height: 24),

              // Animation Showcase Section
              _buildSectionTitle('Animation Showcase'),
              _buildAnimationShowcase(context),

              const SizedBox(height: 24),

              // Alignment & Positioning Section
              _buildSectionTitle('Alignment & Positioning'),
              _buildAlignmentShowcase(context),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
    );
  }

  Widget _buildDialogGrid(List<DialogConfig> configs) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: configs.length,
      itemBuilder: (context, index) {
        final config = configs[index];
        return _buildDialogCard(context, config);
      },
    );
  }

  Widget _buildDialogCard(BuildContext context, DialogConfig config) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => _showBasicDialog(context, config),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                config.color.withOpacity(0.1),
                config.color.withOpacity(0.05),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                config.icon,
                size: 36,
                color: config.color,
              ),
              const SizedBox(height: 16),
              Flexible(
                child: Text(
                  config.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: config.color,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpecialFeatureButton(
      BuildContext context,
      String title,
      IconData icon,
      Color color,
      VoidCallback onPressed,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.1),
                  color.withOpacity(0.05),
                ],
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    size: 24,
                    color: color,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: color.withOpacity(0.7),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimationShowcase(BuildContext context) {
    final animations = [
      AnimationConfig('Scale', AnimType.scale, Icons.zoom_in),
      AnimationConfig('Bottom Slide', AnimType.bottomSlide, Icons.arrow_upward),
      AnimationConfig('Top Slide', AnimType.topSlide, Icons.arrow_downward),
      AnimationConfig('Left Slide', AnimType.leftSlide, Icons.arrow_forward),
      AnimationConfig('Right Slide', AnimType.rightSlide, Icons.arrow_back),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: animations.length,
      itemBuilder: (context, index) {
        final animation = animations[index];
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            onTap: () => _showAnimationDemo(context, animation),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple.withOpacity(0.1),
                    Colors.purple.withOpacity(0.05),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    animation.icon,
                    size: 20,
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    animation.name,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAlignmentShowcase(BuildContext context) {
    final alignments = [
      AlignmentConfig('Top Left', Alignment.topLeft, Icons.north_west),
      AlignmentConfig('Top Center', Alignment.topCenter, Icons.north),
      AlignmentConfig('Top Right', Alignment.topRight, Icons.north_east),
      AlignmentConfig('Center Left', Alignment.centerLeft, Icons.west),
      AlignmentConfig('Center', Alignment.center, Icons.center_focus_strong),
      AlignmentConfig('Center Right', Alignment.centerRight, Icons.east),
      AlignmentConfig('Bottom Left', Alignment.bottomLeft, Icons.south_west),
      AlignmentConfig('Bottom Center', Alignment.bottomCenter, Icons.south),
      AlignmentConfig('Bottom Right', Alignment.bottomRight, Icons.south_east),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: alignments.length,
      itemBuilder: (context, index) {
        final alignment = alignments[index];
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            onTap: () => _showAlignmentDemo(context, alignment),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    Colors.teal.withOpacity(0.1),
                    Colors.cyan.withOpacity(0.05),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    alignment.icon,
                    size: 20,
                    color: Colors.teal,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    alignment.name,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.teal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Dialog Methods
  void _showBasicDialog(BuildContext context, DialogConfig config) {
    AwesomeDialog(
      context: context,
      dialogType: config.type,
      animType: config.animType,
      title: config.title,
      desc: 'This is a ${config.title.toLowerCase()} with ${config.animType.name} animation!',
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
      headerAnimationLoop: false,
      btnOkColor: config.color,
      btnCancelColor: Colors.grey,
    ).show();
  }

  void _showCustomHeaderDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      customHeader: Container(
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Colors.purple.shade400, Colors.purple.shade600],
          ),
        ),
        child: const Icon(
          Icons.favorite,
          size: 50,
          color: Colors.white,
        ),
      ),
      title: 'Custom Header Dialog',
      desc: 'This dialog features a custom header with gradient background and heart icon.',
      btnOkOnPress: () {},
      btnOkColor: Colors.purple,
    ).show();
  }

  void _showCustomBodyDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.emoji_emotions,
                size: 50,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Custom Body Dialog',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'This dialog contains custom widget content with beautiful styling and animations.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.thumb_up),
                  label: const Text('Awesome!'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.white,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                  label: const Text('Close'),
                ),
              ],
            ),
          ],
        ),
      ),
    ).show();
  }

  void _showCustomButtonsDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.bottomSlide,
      title: 'Custom Buttons',
      desc: 'This dialog uses custom styled buttons with icons and gradients.',
      btnOk: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.green, Colors.lightGreen],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.check),
          label: const Text('Agree'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
        ),
      ),
      btnCancel: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.red, Colors.redAccent],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close),
          label: const Text('Disagree'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
        ),
      ),
      buttonsBorderRadius: BorderRadius.circular(8),
    ).show();
  }

  void _showAutoHideDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.leftSlide,
      title: 'Auto Hide Dialog',
      desc: 'This dialog will automatically close after 4 seconds. Watch the magic happen!',
      autoHide: const Duration(seconds: 4),
      headerAnimationLoop: true,
      btnOkColor: Colors.pink,
    ).show();
  }

  void _showKeyboardAwareDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.scale,
      title: 'Keyboard Aware Dialog',
      keyboardAware: true,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'This dialog adjusts its position when the keyboard appears.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Type something',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    ).show();
  }

  void _showNonDismissibleDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.scale,
      title: 'Non-Dismissible Dialog',
      desc: 'This dialog cannot be dismissed by tapping outside or pressing back button.',
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      btnOkOnPress: () {},
      btnOkText: 'OK',
      btnOkColor: Colors.orange,
    ).show();
  }

  void _showCloseIconDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: 'Dialog with Close Icon',
      desc: 'This dialog has a close icon in the top-right corner.',
      showCloseIcon: true,
      closeIcon: const Icon(Icons.close_fullscreen),
      btnOkOnPress: () {},
      btnOkColor: Colors.green,
    ).show();
  }

  void _showCustomBackgroundDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.scale,
      title: 'Custom Background',
      desc: 'This dialog has a custom background color and barrier color.',
      dialogBackgroundColor: Colors.grey.shade900,
      barrierColor: Colors.purple.withOpacity(0.3),
      btnOkOnPress: () {},
      btnOkColor: Colors.orange,
      buttonsTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ).show();
  }

  void _showBorderedDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.scale,
      title: 'Bordered Dialog',
      desc: 'This dialog has a custom border around it.',
      borderSide: const BorderSide(
        color: Colors.purple,
        width: 3,
      ),
      btnOkOnPress: () {},
      btnCancelOnPress: () {},
      btnOkColor: Colors.purple,
    ).show();
  }

  void _showEnterKeyDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.scale,
      title: 'Enter Key Enabled',
      desc: 'Press Enter key to trigger the OK button action.',
      enableEnterKey: true,
      btnOkOnPress: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Enter key pressed!'),
            backgroundColor: Colors.green,
          ),
        );
      },
      btnOkColor: Colors.lightGreen,
    ).show();
  }

  void _showDismissCallbackDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.topSlide,
      title: 'Dismiss Callback',
      desc: 'Check the snackbar after closing this dialog to see the callback in action.',
      btnOkOnPress: () {},
      btnCancelOnPress: () {},
      onDismissCallback: (type) {
        debugPrint('🎉 Dialog dismissed with type: $type');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Dialog dismissed with type: $type'),
            backgroundColor: Colors.lime,
          ),
        );
      },
    ).show();
  }

  void _showLoadingDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
            ),
            const SizedBox(height: 20),
            const Text(
              'Loading...',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please wait while we process your request',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      btnOkOnPress: () {},
      btnOkText: 'Cancel',
      btnOkColor: Colors.deepOrange,
    ).show();
  }

  void _showConfirmationDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.scale,
      title: 'Confirmation Required',
      desc: 'Are you sure you want to proceed with this action? This cannot be undone.',
      btnOkOnPress: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Action confirmed!'),
            backgroundColor: Colors.green,
          ),
        );
      },
      btnCancelOnPress: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Action cancelled!'),
            backgroundColor: Colors.red,
          ),
        );
      },
      btnOkText: 'Yes, Proceed',
      btnCancelText: 'Cancel',
      btnOkColor: Colors.brown,
      btnCancelColor: Colors.grey,
    ).show();
  }

  void _showFormInputDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.person_add,
              size: 50,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'User Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Hello ${nameController.text}!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Submit'),
                ),
                OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    ).show();
  }

  void _showMultiStepDialog(BuildContext context) {
    int currentStep = 0;
    final steps = [
      'Welcome to our app!',
      'Let\'s set up your profile.',
      'Choose your preferences.',
      'All done! Enjoy the app.'
    ];

    void showStep(int step) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'Step ${step + 1} of ${steps.length}',
        desc: steps[step],
        btnOkText: step == steps.length - 1 ? 'Finish' : 'Next',
        btnOkOnPress: () {
          if (step < steps.length - 1) {
            showStep(step + 1);
          }
        },
        btnCancelText: step == 0 ? 'Skip' : 'Previous',
        btnCancelOnPress: step == 0 ? () {} : () => showStep(step - 1),
        btnOkColor: Colors.purple,
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: (step + 1) / steps.length,
                backgroundColor: Colors.grey.shade300,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
              ),
              const SizedBox(height: 20),
              Text(
                steps[step],
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ).show();
    }

    showStep(0);
  }

  void _showProgressDialog(BuildContext context) {
    double progress = 0.0;
    late StateSetter dialogSetState;

    AwesomeDialog dialog = AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      body: StatefulBuilder(
        builder: (context, setState) {
          dialogSetState = setState; // Capture setState to use outside
          return Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.cloud_upload,
                  size: 50,
                  color: Colors.orange,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Uploading Files...',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
                const SizedBox(height: 10),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    dialog.show();

    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      progress += 0.02;
      if (progress >= 1.0) {
        progress = 1.0;
        timer.cancel();

        Future.delayed(const Duration(milliseconds: 300), () {
          dialog.dismiss();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Upload completed!'),
              backgroundColor: Colors.green,
            ),
          );
        });
      }
      dialogSetState(() {}); // This will update the progress bar UI
    });
  }


  void _showAnimationDemo(BuildContext context, AnimationConfig animation) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: animation.type,
      title: '${animation.name} Animation',
      desc: 'This dialog demonstrates the ${animation.name.toLowerCase()} animation effect.',
      btnOkOnPress: () {},
      btnOkText: 'Cool!',
      btnOkColor: Colors.deepPurple,
      headerAnimationLoop: false,
    ).show();
  }

  void _showAlignmentDemo(BuildContext context, AlignmentConfig alignment) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.scale,
      alignment: alignment.alignment,
      title: 'Dialog Alignment',
      desc: 'This dialog is aligned to ${alignment.name.toLowerCase()}.',
      btnOkOnPress: () {},
      btnOkText: 'Got it!',
      btnOkColor: Colors.teal,
      width: 300,
    ).show();
  }
}

// Helper Classes
class DialogConfig {
  final String title;
  final DialogType type;
  final Color color;
  final IconData icon;
  final AnimType animType;

  DialogConfig(this.title, this.type, this.color, this.icon, this.animType);
}

class AnimationConfig {
  final String name;
  final AnimType type;
  final IconData icon;

  AnimationConfig(this.name, this.type, this.icon);
}

class AlignmentConfig {
  final String name;
  final AlignmentGeometry alignment;
  final IconData icon;

  AlignmentConfig(this.name, this.alignment, this.icon);
}