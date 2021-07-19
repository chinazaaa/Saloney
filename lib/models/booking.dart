import 'dart:convert';
class Booking {
  Booking({
    this.services,
    this.serviceName,
    this.servicePrice,
    this.bookingDate,
    this.approved,
    this.rejected,
    this.completedByCustomer,
    this.completedBySalon,
    this.id,
    this.salon,
    this.customer,
    this.customerName,
    this.customerPhone,
    this.salonName,
    this.salonPhone,
    this.bookingId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  List<String> services;
  List<String> serviceName;
  List<String> servicePrice;
  String bookingDate;
  bool approved;
  bool rejected;
  bool completedByCustomer;
  bool completedBySalon;
  String id;
  String salon;
  String customer;
  String customerName;
  String customerPhone;
  String salonName;
  String salonPhone;
  String bookingId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Booking copyWith({
    List<String> services,
    List<String> serviceName,
    List<String> servicePrice,
    String bookingDate,
    bool approved,
    bool rejected,
    bool completedByCustomer,
    bool completedBySalon,
    String id,
    String salon,
    String customer,
    String customerName,
    String customerPhone,
    String salonName,
    String salonPhone,
    String bookingId,
    DateTime createdAt,
    DateTime updatedAt,
    int v,
  }) =>
      Booking(
        services: services ?? this.services,
        serviceName: serviceName ?? this.serviceName,
        servicePrice: servicePrice ?? this.servicePrice,
        bookingDate: bookingDate ?? this.bookingDate,
        approved: approved ?? this.approved,
        rejected: rejected ?? this.rejected,
        completedByCustomer: completedByCustomer ?? this.completedByCustomer,
        completedBySalon: completedBySalon ?? this.completedBySalon,
        id: id ?? this.id,
        salon: salon ?? this.salon,
        customer: customer ?? this.customer,
        customerName: customerName ?? this.customerName,
        customerPhone: customerPhone ?? this.customerPhone,
        salonName: salonName ?? this.salonName,
        salonPhone: salonPhone ?? this.salonPhone,
        bookingId: bookingId ?? this.bookingId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory Booking.fromJson(String str) => Booking.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Booking.fromMap(Map<String, dynamic> json) => Booking(
    services: json["services"] == null ? null : List<String>.from(json["services"].map((x) => x)),
    serviceName: json["serviceName"] == null ? null : List<String>.from(json["serviceName"].map((x) => x)),
    servicePrice: json["servicePrice"] == null ? null : List<String>.from(json["servicePrice"].map((x) => x)),
    bookingDate: json["bookingDate"] == null ? null : json["bookingDate"],
    approved: json["approved"] == null ? null : json["approved"],
    rejected: json["rejected"] == null ? null : json["rejected"],
    completedByCustomer: json["completedByCustomer"] == null ? null : json["completedByCustomer"],
    completedBySalon: json["completedBySalon"] == null ? null : json["completedBySalon"],
    id: json["_id"] == null ? null : json["_id"],
    salon: json["salon"] == null ? null : json["salon"],
    customer: json["customer"] == null ? null : json["customer"],
    customerName: json["customerName"] == null ? null : json["customerName"],
    customerPhone: json["customerPhone"] == null ? null : json["customerPhone"],
    salonName: json["salonName"] == null ? null : json["salonName"],
    salonPhone: json["salonPhone"] == null ? null : json["salonPhone"],
    bookingId: json["bookingID"] == null ? null : json["bookingID"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "services": services == null ? null : List<dynamic>.from(services.map((x) => x)),
    "serviceName": serviceName == null ? null : List<dynamic>.from(serviceName.map((x) => x)),
    "servicePrice": servicePrice == null ? null : List<dynamic>.from(servicePrice.map((x) => x)),
    "bookingDate": bookingDate == null ? null : bookingDate,
    "approved": approved == null ? null : approved,
    "rejected": rejected == null ? null : rejected,
    "completedByCustomer": completedByCustomer == null ? null : completedByCustomer,
    "completedBySalon": completedBySalon == null ? null : completedBySalon,
    "_id": id == null ? null : id,
    "salon": salon == null ? null : salon,
    "customer": customer == null ? null : customer,
    "customerName": customerName == null ? null : customerName,
    "customerPhone": customerPhone == null ? null : customerPhone,
    "salonName": salonName == null ? null : salonName,
    "salonPhone": salonPhone == null ? null : salonPhone,
    "bookingID": bookingId == null ? null : bookingId,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "__v": v == null ? null : v,
  };
}
