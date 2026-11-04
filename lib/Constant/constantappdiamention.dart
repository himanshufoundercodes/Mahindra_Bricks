import 'package:flutter/material.dart';

class AppRadius {
  AppRadius._();

  static const BorderRadius xs = BorderRadius.all(Radius.circular(4));
  static const BorderRadius sm = BorderRadius.all(Radius.circular(8));
  static const BorderRadius sl = BorderRadius.all(Radius.circular(10));
  static const BorderRadius md = BorderRadius.all(Radius.circular(12));
  static const BorderRadius lg = BorderRadius.all(Radius.circular(16));
  static const BorderRadius xl = BorderRadius.all(Radius.circular(20));
  static const BorderRadius xxl = BorderRadius.all(Radius.circular(28));
  static const BorderRadius card = BorderRadius.all(Radius.circular(24));
  static const BorderRadius profileCard =
  BorderRadius.all(Radius.circular(28)); // swipe card
  static const BorderRadius circular = BorderRadius.all(Radius.circular(100));
}

class AppPadding {
  AppPadding._();

  static const EdgeInsets screen = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 16,
  );

  static const EdgeInsets horizontal = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets vertical = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets xs = EdgeInsets.all(4);
  static const EdgeInsets sm = EdgeInsets.all(8);
  static const EdgeInsets md = EdgeInsets.all(16);
  static const EdgeInsets lg = EdgeInsets.all(24);
  static const EdgeInsets xl = EdgeInsets.all(32);

  static const EdgeInsets card = EdgeInsets.all(16);
  static const EdgeInsets chip = EdgeInsets.symmetric(
    horizontal: 14,
    vertical: 8,
  );
}

class AppSpacing {
  AppSpacing._();

  static const SizedBox h2 = SizedBox(height: 2);
  static const SizedBox h4 = SizedBox(height: 4);
  static const SizedBox h6 = SizedBox(height: 6);
  static const SizedBox h8 = SizedBox(height: 8);
  static const SizedBox h10 = SizedBox(height: 10);
  static const SizedBox h12 = SizedBox(height: 12);
  static const SizedBox h14 = SizedBox(height: 14);
  static const SizedBox h16 = SizedBox(height: 16);
  static const SizedBox h18 = SizedBox(height: 18);
  static const SizedBox h20 = SizedBox(height: 20);
  static const SizedBox h24 = SizedBox(height: 24);
  static const SizedBox h28 = SizedBox(height: 28);
  static const SizedBox h32 = SizedBox(height: 32);
  static const SizedBox h40 = SizedBox(height: 40);
  static const SizedBox h48 = SizedBox(height: 48);
  static const SizedBox h56 = SizedBox(height: 56);

  static const SizedBox w2 = SizedBox(width: 2);
  static const SizedBox w4 = SizedBox(width: 4);
  static const SizedBox w6 = SizedBox(width: 6);
  static const SizedBox w8 = SizedBox(width: 8);
  static const SizedBox w10 = SizedBox(width: 10);
  static const SizedBox w12 = SizedBox(width: 12);
  static const SizedBox w14 = SizedBox(width: 14);
  static const SizedBox w16 = SizedBox(width: 16);
  static const SizedBox w20 = SizedBox(width: 20);
  static const SizedBox w24 = SizedBox(width: 24);
  static const SizedBox w32 = SizedBox(width: 32);
}

class AppFontSize {
  AppFontSize._();

  static const double xs = 11;
  static const double sl = 12;
  static const double sm = 13;
  static const double md = 15;
  static const double lg = 16;
  static const double xl = 18;
  static const double xxl = 22;
  static const double heading = 26;
  static const double title = 30;
  static const double display = 36; // "It's a Match!" / hero
}

class AppFontWeights {
  AppFontWeights._();

  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

class AppDurations {
  AppDurations._();

  static const fast = Duration(milliseconds: 200);
  static const normal = Duration(milliseconds: 350);
  static const slow = Duration(milliseconds: 600);
  static const splash = Duration(milliseconds: 2200);
  static const cardSwipe = Duration(milliseconds: 280);
  static const matchPopup = Duration(milliseconds: 450);
}

class AppElevation {
  AppElevation._();

  static const double none = 0;
  static const double low = 2;
  static const double card = 6;
  static const double swipeCard = 10;
  static const double floating = 14;
}

class AppSizes {
  AppSizes._();

  static const double iconXs = 14;
  static const double iconSm = 18;
  static const double iconMd = 22;
  static const double iconLg = 28;
  static const double iconXl = 34;

  static const double avatarSm = 36;
  static const double avatarMd = 52;
  static const double avatarLg = 88;

  static const double swipeActionButton = 58;
  static const double swipeActionButtonBig = 68;

  static const double buttonHeight = 54;
  static const double textFieldHeight = 56;
}

class AppBlur {
  AppBlur._();

  static const double likeCard = 5.0;
}