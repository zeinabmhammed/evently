import 'package:evently/core/resources/app_assets.dart';
import 'package:evently/core/resources/app_colors.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/common/custom_elevated_button.dart';
import 'package:evently/ui/common/custom_event_tab_bar.dart';
import 'package:evently/ui/common/custom_form_Field.dart';
import 'package:evently/ui/screens/add_event/widget/date_or_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../common/event_tab.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  int selectedIndex = 0;
  EventTab selectedCategory = EventTab.sport;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final tabs = getEventTabs(context);
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.create_event,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded, size: 24),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(AppAssets.bookClubCard),
                ),
                const SizedBox(height: 16),
                CustomEventTabBar(
                  tabsMap: tabs,
                  selectedTab: selectedCategory,
                  showAll: false,
                  isInverse: false,
                  onTabChanged: (newTab) {
                    setState(() {
                      selectedCategory = newTab;
                    });
                  },
                ),
                const SizedBox(height: 16),

                Text(
                  AppLocalizations.of(context)!.title,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 4),
                CustomFormField(
                  hintText: AppLocalizations.of(context)!.event_title,
                  prefixIcon: SvgPicture.asset(
                    AppAssets.noteEditIcon,
                    color: Theme.of(context).indicatorColor,
                  ),
                  controller: titleController,
                ),
                const SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context)!.description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 4),
                CustomFormField(
                  hintText: AppLocalizations.of(context)!.event_description,
                  controller: descriptionController,
                  maxLines: 4,
                ),
                DateOrTimeWidget(
                  iconName: AppAssets.calendarIcon,
                  eventDateOrTimeName: AppLocalizations.of(context)!.event_date,
                  onChooseTimeOrDate: () {},
                  chooseTimeOrDate: AppLocalizations.of(context)!.choose_date,
                ),
                DateOrTimeWidget(
                  iconName: AppAssets.clockIcon,
                  eventDateOrTimeName: AppLocalizations.of(context)!.event_time,
                  onChooseTimeOrDate: () {},
                  chooseTimeOrDate: AppLocalizations.of(context)!.choose_time,
                ),
                const SizedBox(height: 4),
                Text(
                  AppLocalizations.of(context)!.location,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 4),
                CustomElevatedButton(
                  onPressed: () {},
                  backgroundColor: Colors.transparent,
                  borderColor: AppColors.lightPrimary,
                  hasIcon: true,
                  childIconWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 46,
                        height: 46,
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: AppColors.lightPrimary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset(
                          AppAssets.locationIcon,
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.choose_event_location,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColors.lightPrimary,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.lightPrimary,
                        size: 20,
                      ),
                    ],
                  ),
                  text:  AppLocalizations.of(context)!.choose_event_location,
                ),
                const SizedBox(height: 16),
                CustomElevatedButton(
                  onPressed: () {},
                  text: AppLocalizations.of(context)!.add_event,
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
