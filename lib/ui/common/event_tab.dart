import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

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
