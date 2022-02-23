class ButtonModel {
  String name;

  ButtonModel({required this.name});

  static List<ButtonModel> buttonList = [
    new ButtonModel(name: "All"),
    new ButtonModel(name: "Followed"),
    new ButtonModel(name: "Pac-Man"),
    new ButtonModel(name: "Warzone"),
    new ButtonModel(name: "Fortnite"),
  ];
}
