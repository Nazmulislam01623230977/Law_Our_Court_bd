import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ourcourt/Screen/barnotice.dart';
import 'package:ourcourt/Screen/blognews_page.dart';
import 'package:ourcourt/Screen/blognewsadd_page.dart';
import 'package:ourcourt/Screen/casefree_page.dart';
import 'package:ourcourt/Screen/casefreereg.dart';
import 'package:ourcourt/Screen/caselist_page.dart';
import 'package:ourcourt/Screen/casepremiumshow_page.dart';
import 'package:ourcourt/Screen/casestudies_page.dart';
import 'package:ourcourt/Screen/contact_page.dart';
import 'package:ourcourt/Screen/dashboad.dart';
import 'package:ourcourt/Screen/diarycalender_page.dart';
import 'package:ourcourt/Screen/lawbooklist.dart';
import 'package:ourcourt/Screen/lawdictionary.dart';
import 'package:ourcourt/Screen/legaldrafting_page.dart';
import 'package:ourcourt/Screen/listmydiary.dart';
import 'package:ourcourt/Screen/login_page.dart';
import 'package:ourcourt/Screen/mydiary_page.dart';
import 'package:ourcourt/Screen/mydiarylist_page.dart';
import 'package:ourcourt/Screen/pdf_page.dart';
import 'package:ourcourt/Screen/registration_page.dart';
import 'package:ourcourt/Screen/registrationlawyer_page.dart';
import 'package:ourcourt/Screen/verficationOtp_page.dart';
import 'package:ourcourt/Screen/verficationphone.dart';
import 'package:ourcourt/main.dart';
import 'package:ourcourt/widgets/pdf1.dart';

class RouteManeger {
  static const String loginfunction = "/";
  static const String login_page = "/login_page";
  static const String verification_phone = "/verification_phone";
  static const String verification_otp = "/verification_otp";
  static const String registration_page = "/registration_page";
  static const String dashboad_page = "/dashboad_page";
  static const String registrationlawyer_page = "/registrationlawyer_page";
  static const String mydiary_page = "/mydiary_page";
  static const String mydiarylist_page = "/mydiarylist_page";
  static const String contact_page = "/contact_page";
  static const String casepremium_page = "/casepremium_page";
  static const String casepremiumreg_page = "/casepremiumreg_page";
  static const String casepremiumshow_page = "/casepremiumshow_page";
  static const String casefree_page = "/casefree_page";
  static const String casefreereg_page = "/casefreereg_page";
  static const String casefreeshow_page = "/casefreeshow_page";
  static const String dailrycalender_page = "/dailrycalender_page";
  static const String barnotice_page = "/barnotice_page";
  static const String casestudies_page = "/casestudies_page";
  static const String lawdictionary_page = "/lawdictionary_page";
  static const String medicaldictionary_page = "/medicaldictionary_page";
  static const String legaldrafting_page = "/legaldrafting_page";
  static const String caselist_page = "/caselist_page";
  static const String pdf_page = "/pdf_page";
  static const String barnoticeview_page = "/ barnoticeview_page";
  static const String pdf1_page = "/ pdf1_page";
  static const String lawbook_page = "/ lawbook_page";
  static const String listdiary_page = "/ listdiary_page";
  static const String blognews_page = "/blognews_page";
  static const String blognewsadd_page = "/blognewsadd_page";

  static Route<dynamic> generateroute(RouteSettings settings) {
    List casedairydata;
    switch (settings.name) {
      case login_page:
        return MaterialPageRoute(
          builder: (context) => Login_Page(),
        );
      case loginfunction:
        return MaterialPageRoute(
          builder: (context) => LoginFunction(),
        );
      case verification_phone:
        return MaterialPageRoute(
          builder: (context) => VerficationPhone_page(),
        );
      case verification_otp:
        return MaterialPageRoute(
          builder: (context) => VerficationOtp(context),
        );
      case registration_page:
        return MaterialPageRoute(
          builder: (context) => RegistrationPage(context),
        );
      case dashboad_page:
        return MaterialPageRoute(
          builder: (context) => DashboadPage(),
        );
      case registrationlawyer_page:
        return MaterialPageRoute(
          builder: (context) => RegistrationLawyer(),
        );
      case mydiary_page:
        return MaterialPageRoute(
          builder: (context) => MyDiary(),
        );

      case contact_page:
        return MaterialPageRoute(
          builder: (context) => ContactPage(),
        );

      case casepremiumreg_page:
      // return MaterialPageRoute(
      //   builder: (context) => CasepremiumReg(),
      // );
      case casepremiumshow_page:
        return MaterialPageRoute(
          builder: (context) => CasePremiumShow(),
        );
      case casefree_page:
        return MaterialPageRoute(
          builder: (context) => CaseFree(),
        );
      case casefreereg_page:
        return MaterialPageRoute(
          builder: (context) => CaseFreeReg(),
        );
        case blognews_page:
        return MaterialPageRoute(
          builder: (context) =>  BlogNews(),
        );
        case blognewsadd_page:
        return MaterialPageRoute(
          builder: (context) =>  BolgNewsAdd(),
        );
      // case casefreeshow_page:
      //   return MaterialPageRoute(
      //     builder: (context) => CasefreeShow(casedairydata),
      //   );
      // case dailrycalender_page:
      //   return MaterialPageRoute(
      //     builder: (context) => DailyCalender(),
      //   );
      // case barnotice_page:
      //   return MaterialPageRoute(
      //     builder: (context) => BarNotice(),
      //   );
      // case casestudies_page:
      //   return MaterialPageRoute(
      //     builder: (context) => CaseStudies(),
      //   );

      case caselist_page:
        return MaterialPageRoute(
          builder: (context) => CaseList(),
        );
      case pdf_page:
        return MaterialPageRoute(
          builder: (context) => PDF(),
        );

      default:
        throw FormatException('Route not found check route again');
    }
  }
}
