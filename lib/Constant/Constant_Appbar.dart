import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Constant_Color.dart';

class ConstantAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  final bool showDrawer;
  final bool showBackButton;
  final bool showBranding;
  final Widget? drawer;
  final Widget? leading;
  final Widget? logo;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final String? logoAsset;
  final String brandName;
  final String brandSubtitle;
  final bool showNotification;
  final int notificationCount;
  final bool showProfile;
  final VoidCallback? onBackPressed;
  final VoidCallback? onNotificationPressed;
  final VoidCallback? onProfilePressed;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? iconColor;
  final double elevation;
  final bool centerTitle;


  const ConstantAppBar({
    super.key,
    required this.title,
    this.showDrawer = false,
    this.showBackButton = false,
    this.showBranding = false,
    this.drawer,
    this.leading,
    this.logo,
    this.titleWidget,
    this.actions,
    this.logoAsset,
    this.brandName = 'MAHINDRA BRICKS',
    this.brandSubtitle = 'PAVER BLOCKS',
    this.showNotification = false,
    this.notificationCount = 0,
    this.showProfile = false,
    this.onBackPressed,
    this.onNotificationPressed,
    this.onProfilePressed,
    this.backgroundColor,
    this.titleColor,
    this.iconColor,
    this.elevation = 0,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color foreground =
        iconColor ?? titleColor ?? Colors.brown.shade800;

    return AppBar(
      backgroundColor:
      backgroundColor ?? AppColor.backgroundColor,
      foregroundColor: foreground,
      elevation: elevation,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      toolbarHeight: kToolbarHeight,

      leadingWidth: (showDrawer || showBackButton || leading != null)
          ? 48
          : 0,

      leading: leading ??
          (showDrawer
              ? Builder(
            builder: (context) => IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.menu_rounded),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          )
              : showBackButton
              ? IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: onBackPressed ??
                    () => Navigator.maybePop(context),
          )
              : null),

      titleSpacing: showBranding ? 8 : NavigationToolbar.kMiddleSpacing,

      title: showBranding
          ? Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLogo(),
          const SizedBox(width: 7),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Text(
                  brandName,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColor.stockTitleColor,
                  ),
                ),
                Text(
                  brandSubtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 9,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                    color: titleColor ?? AppColor.stockAmountColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      )
          : titleWidget ??
          Text(
            title,
            style: TextStyle(
              color: titleColor ?? Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

      actions: [
        if (showNotification)
          IconButton(
            onPressed: onNotificationPressed,
            icon: Badge(
              isLabelVisible: notificationCount > 0,
              label: Text(
                notificationCount > 99
                    ? '99+'
                    : '$notificationCount',
              ),
              child: const Icon(Icons.notifications_none_rounded),
            ),
          ),

        if (showProfile)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              tooltip: 'Profile',
              onPressed: onProfilePressed,
              icon: const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.brown,
                child: Icon(
                  Icons.person,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),

        ...?actions,
      ],
    );
  }

  Widget _buildLogo() {
    if (logo != null) {
      return SizedBox(
        width: 43,
        height: 43,
        child: logo,
      );
    }

    if (logoAsset != null) {
      return
      //   ClipOval(
      //   child: Image.asset(
      //     logoAsset!,
      //     width: 43,
      //     height: 43,
      //     fit: BoxFit.cover,
      //   ),
      // );
        Container(
          height: 42,
          width: 42,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: AppColor.stockTitleColor,
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              logoAsset!,
              fit: BoxFit.contain,
            ),
          ),
        );

    }

    return CircleAvatar(
      radius: 21,
      backgroundColor: Colors.white,
      child: Icon(
        Icons.business_rounded,
        size: 28,
        color: Colors.brown.shade700,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}