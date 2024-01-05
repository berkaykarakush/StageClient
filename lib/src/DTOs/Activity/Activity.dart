class Activity {
  String id;
  String title;
  String date;
  String description;
  String category;
  String venue;
  String city;

  Activity(this.id, this.title, this.date, this.description, this.category,
      this.venue, this.city);

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
        json["id"] as String,
        json["title"] as String,
        json["date"] as String,
        json["description"] as String,
        json["category"] as String,
        json["venue"] as String,
        json["city"] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "date": date,
      "description": description,
      "category": category,
      "venue": venue,
      "city": city,
    };
  }
}
