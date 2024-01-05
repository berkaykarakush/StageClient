class Weather {
  final String city, date, day, description, status, degree;

  Weather(this.city, this.date, this.day, this.description, this.status,
      this.degree);

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        json["city"] as String,
        json["date"] as String,
        json["day"] as String,
        json["description"] as String,
        json["status"] as String,
        json["degree"] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      "city": city,
      "date": date,
      "day": day,
      "description": description,
      "status": status,
      "degree": degree,
    };
  }
}
