class StepModel {
  final int id;
  final String text;
  final String header;

  StepModel({this.id, this.text, this.header});

  static List<StepModel> list = [
    StepModel(
      id: 1,
      header: "Find a Salon nearby",
      text: "Having problems locating a salon nearby?",
    ),
    StepModel(
      id: 2,
      header: '',
      text:
          "Search for the closest salon \naround you and \nbook an appointment",
    ),
    StepModel(
      id: 3,
      header: "Professional Services",
      text: "Great hair doesn't happen by chance, it happens by appointments!",
    ),
  ];
}
