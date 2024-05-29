class AgentsModel {
  final String displayName;
  final String des;
  final String fullPortrait;
  final String background;

  AgentsModel(
      {required this.displayName,
      required this.background,
      required this.des,
      required this.fullPortrait});

  factory AgentsModel.fromMap({required Map data}) {
    return AgentsModel(
        displayName: data["displayName"],
        background: data["background"],
        des: data["description"],
        fullPortrait: data["fullPortrait"]);
  }
}

class AbilitiesModel {
  final String displayName;
  final String des;
  final String icon;

  AbilitiesModel(
      {required this.des, required this.displayName, required this.icon});

  factory AbilitiesModel.fromMap({required Map data}) {
    return AbilitiesModel(
        des: data["description"],
        displayName: data["displayName"],
        icon: data["displayIcon"]);
  }
}
