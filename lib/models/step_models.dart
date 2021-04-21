class StepModel {
  final int id;
  final String text;
  final String header;

  StepModel({this.id, this.text, this.header});

  static List<StepModel> list = [
    StepModel(
      id: 1,
      header: "Find a Salon nearby",
      text: "Search for the closet salon \naround you and \nbook an appointment",
    ),
    StepModel(
      id: 2,
      header: '',
      text:
          "Search for the closet salon \naround you and \nbook an appointment",
    ),
    StepModel(
      id: 3,
      header: "Professional Services",
      text: "Search for the closet salon \naround you and \nbook an appointment",
    ),
  ];
}