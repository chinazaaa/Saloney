import 'package:flutter/material.dart';
import 'package:starter_project/Customer/pages/screens/salonServices_details.dart';
import 'package:starter_project/models/service/get_published_service_reponse.dart';
import 'package:starter_project/models/service/salon_service.dart';

class ServiceSalonWidget extends StatelessWidget {
  final String serviceName, imgUri;
  final String servicePrice;
  final SalonService serviceInfo;

  const ServiceSalonWidget(
      {Key key,
      this.serviceName,
      this.imgUri,
      this.servicePrice,
      this.serviceInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3.6,
              width: MediaQuery.of(context).size.width / 2.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imgUri,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              serviceName,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
              maxLines: 2,
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "NGN $servicePrice",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              //another screen? haaa
              return ServiceDetails(
                service: serviceInfo,
              );
            },
          ),
        );
      },
    );
  }
}
