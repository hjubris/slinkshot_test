class ProfilePersona {
  String name;
  String avatarName;
  String description;
  int followers;
  int slinkshots;

  ProfilePersona(
      {required this.name,
      required this.avatarName,
      required this.description,
      required this.followers,
      required this.slinkshots});

  static ProfilePersona bestStreamerPersona = new ProfilePersona(
      name: "BestStreamerEver", avatarName: "Ymir", description: "I love streaming!", followers: 45631, slinkshots: 22);
}
