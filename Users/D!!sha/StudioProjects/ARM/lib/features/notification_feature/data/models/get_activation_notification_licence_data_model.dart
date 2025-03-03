class GetActivationNotificationLicencesDataModel {
  final int id;
  final String requestedAt;
  final Business business;
  final Plan plan;

  GetActivationNotificationLicencesDataModel({
    required this.id,
    required this.requestedAt,
    required this.business,
    required this.plan,
  });

  factory GetActivationNotificationLicencesDataModel.fromJson(
      Map<String, dynamic> json) {
    return GetActivationNotificationLicencesDataModel(
      id: json['id'],
      requestedAt: json['requestedAt'],
      business: Business.fromJson(json['business']),
      plan: Plan.fromJson(json['plan']),
    );
  }
}

class Business {
  final int id;
  final String name;
  final String description;
  final String address;
  final String regionName;
  final String logo;

  Business({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.regionName,
    required this.logo,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      regionName: json['region']['name'],
      logo: json['logo'],
    );
  }
}


class Plan {
  final int id;
  final String name;
  final num cost;
  final num count;

  Plan(
      {required this.id,
        required this.name,
        required this.cost,
        required this.count});

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['id'],
      name: json['name'],
      cost: json['cost'],
      count: json['count'],
    );
  }
}
