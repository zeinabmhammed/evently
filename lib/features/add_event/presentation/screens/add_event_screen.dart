import 'package:evently/core/firebase/utils/firebase_utils.dart';
import 'package:evently/core/resources/app_assets/app_assets.dart';
import 'package:evently/core/resources/common_widgets/custom_elevated_button.dart';
import 'package:evently/core/resources/common_widgets/custom_event_tab_bar.dart';
import 'package:evently/core/resources/common_widgets/custom_form_Field.dart';
import 'package:evently/core/resources/common_widgets/event_tab.dart';
import 'package:evently/core/resources/theme/app_colors.dart';
import 'package:evently/database/model/event.dart';
import 'package:evently/features/add_event/presentation/widget/date_or_time.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../../../../core/routes/app_routes.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  EventTab selectedTab = EventTab.sport;
  String selectedEventName = '';
  String selectedEventImage = '';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  String formatDate = "";
  TimeOfDay? selectedTime;
  String formatTime = "";

  @override
  Widget build(BuildContext context) {
    final tabs = getEventTabs(context);
    return Scaffold(
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
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    selectedEventImage.isEmpty
                        ? AppAssets.bookClubCard
                        : selectedEventImage,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                CustomEventTabBar(
                  tabsMap: tabs,
                  selectedTab: selectedTab,
                  showAll: false,
                  isInverse: false,
                  onTabChanged: (newTab) {
                    setState(() {
                      selectedTab = newTab;
                      selectedEventName = tabs[newTab]!.name;
                      selectedEventImage = getEventImage(newTab);
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
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return AppLocalizations.of(context)!.enter_title;
                    }
                    return null;
                  },
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
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return AppLocalizations.of(context)!.enter_description;
                    }
                    return null;
                  },
                ),
                DateOrTimeWidget(
                  iconName: AppAssets.calendarIcon,
                  eventDateOrTimeName: AppLocalizations.of(
                    context,
                  )!.event_date,
                  onChooseTimeOrDate: chooseDate,
                  chooseTimeOrDate: selectedDate == null
                      ? AppLocalizations.of(context)!.choose_date
                      : formatDate,
                  //'${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                ),
                DateOrTimeWidget(
                  iconName: AppAssets.clockIcon,
                  eventDateOrTimeName: AppLocalizations.of(
                    context,
                  )!.event_time,
                  onChooseTimeOrDate: chooseTime,
                  chooseTimeOrDate: selectedTime == null
                      ? AppLocalizations.of(context)!.choose_time
                      : formatTime,
                ),
                const SizedBox(height: 4),
                Text(
                  AppLocalizations.of(context)!.location,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 4),
                CustomElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.MapEvent.route);
                  },
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
                        style: Theme.of(context).textTheme.titleSmall
                            ?.copyWith(color: AppColors.lightPrimary),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.lightPrimary,
                        size: 20,
                      ),
                    ],
                  ),
                  text: AppLocalizations.of(context)!.choose_event_location,
                ),
                const SizedBox(height: 16),
                CustomElevatedButton(
                  onPressed: addEvent,
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

  void chooseDate() async {
    var chooseDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    selectedDate = chooseDate;
    if (chooseDate != null) {
      formatDate = DateFormat("dd/MM/yyyy").format(selectedDate!);
      setState(() {});
    }
  }

  void chooseTime() async {
    var chooseTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    selectedTime = chooseTime;
    if (chooseTime != null) {
      formatTime = selectedTime!.format(context);
    }
    setState(() {});
  }

  void addEvent() {
    if (formKey.currentState?.validate() == true) {
      // todo: add event in fireStore
      Event event = Event(
        title: titleController.text,
        description: descriptionController.text,
        eventImage: selectedEventImage,
        eventName: selectedEventName,
        eventDateTime: selectedDate!,
        eventTime: formatTime,
      );
      FirebaseUtils.addEventToFireStore(event).timeout(
        Duration(seconds: 1),
        onTimeout: () {
          Fluttertoast.showToast(
            msg: "Event added successfully.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColors.grey,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.pop(context);
        },
      );
    }
  }
}
