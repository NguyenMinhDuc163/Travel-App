class Flight {
  final String airlineLogo;
  final String from;
  final String to;
  final String departureTime;
  final String flightType;

  Flight({
    required this.airlineLogo,
    required this.from,
    required this.to,
    required this.departureTime,
    required this.flightType,
  });

  @override
  String toString() {
    return 'Flight{airlineLogo: $airlineLogo, from: $from, to: $to, departureTime: $departureTime, flightType: $flightType}';
  }

  // Thêm phương thức fromJson
  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      airlineLogo: json['airlineLogo'],
      from: json['from'],
      to: json['to'],
      departureTime: json['departureTime'],
      flightType: json['flightType'],
    );
  }

  // Thêm phương thức toJson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['airlineLogo'] = airlineLogo;
    data['from'] = from;
    data['to'] = to;
    data['departureTime'] = departureTime;
    data['flightType'] = flightType;
    return data;
  }
}
