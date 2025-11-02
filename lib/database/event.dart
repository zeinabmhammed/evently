class Event {
  String? title;
  String? description;
  DateTime? dateTime;
  String? category;
  bool? isFav;

  Event({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.category,
    required this.isFav,
  });
  static String getCategoryImage(String category){
    switch(category.toUpperCase()){
      case "Sport":
        return "assets/images/sport_home.png";
        case "Birthday":
        return "assets/images/birthday_home.png";
        case "Meeting":
        return "assets/images/meeting_home.png";
        case "Gaming":
        return "assets/images/gaming_home.png";
        case "Eating":
        return "assets/images/eating_home.png";
        case "Holiday":
        return "assets/images/holiday_home.png";
        case "Exhibition":
        return "assets/images/ehibition_home.png";
        case "Work Shop":
        return "assets/images/workshop_home.png";
        case "Book Club":
        return "assets/images/BookClub_home.png";
        default:
        return "";
    }
  }
}

extension DateMonth on DateTime {
  String getShortMonthName() {
    const List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return months[this.month - 1];
  }
}
