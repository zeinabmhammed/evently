import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../app_assets/app_assets.dart';

enum EventTab {
  all,
  sport,
  birthday,
  meeting,
  gaming,
  eating,
  holiday,
  exhibition,
  workshop,
  bookClub,
}

class TabInfo {
  final String name;
  final IconData icon;
  TabInfo(this.name, this.icon);
}

Map<EventTab, TabInfo> getEventTabs(BuildContext context) {
  return {
    EventTab.all: TabInfo(
      AppLocalizations.of(context)!.all,
      FontAwesome.compass,
    ),
    EventTab.sport: TabInfo(
      AppLocalizations.of(context)!.sport,
      Icons.directions_bike,
    ),
    EventTab.birthday: TabInfo(
      AppLocalizations.of(context)!.birthday,
      Icons.cake,
    ),
    EventTab.meeting: TabInfo(
      AppLocalizations.of(context)!.meeting,
      Icons.groups,
    ),
    EventTab.gaming: TabInfo(
      AppLocalizations.of(context)!.gaming,
      FontAwesome.playstation_brand,
    ),
    EventTab.eating: TabInfo(
      AppLocalizations.of(context)!.eating,
      Icons.restaurant,
    ),
    EventTab.holiday: TabInfo(
      AppLocalizations.of(context)!.holiday,
      Icons.beach_access,
    ),
    EventTab.exhibition: TabInfo(
      AppLocalizations.of(context)!.exhibition,
      Icons.museum,
    ),
    EventTab.workshop: TabInfo(
      AppLocalizations.of(context)!.work_shop,
      Icons.work_outline_rounded,
    ),
    EventTab.bookClub: TabInfo(
      AppLocalizations.of(context)!.book_club,
      FontAwesome.book_open_reader_solid,
    ),
  };
}

String getEventImage(EventTab tab) {
  switch (tab) {
    case EventTab.sport:
      return "assets/images/sport_home.png";
    case EventTab.birthday:
      return "assets/images/birthday_home.png";
    case EventTab.meeting:
      return "assets/images/meeting_home.png";
    case EventTab.gaming:
      return "assets/images/gaming_home.png";
    case EventTab.eating:
      return "assets/images/eating_home.png";
    case EventTab.holiday:
      return "assets/images/holiday_home.png";
    case EventTab.exhibition:
      return "assets/images/ehibition_home.png";
    case EventTab.workshop:
      return "assets/images/workshop_home.png";
    case EventTab.bookClub:
      return "assets/images/BookClub_home.png";
    default:
      return AppAssets.bookClubCard;
  }
}