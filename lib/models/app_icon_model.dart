class AppIcon {
  final String appIconId;
  final String name;
  final String gsUrl;
  final String downloadUrl;

  AppIcon({this.appIconId, this.name, this.gsUrl, this.downloadUrl});

  Map<String, dynamic> toMap() {
    return {
      'appIconId': appIconId,
      'name': name,
      'gsUrl': gsUrl,
      'downloadUrl': downloadUrl,
    };
  }

  factory AppIcon.fromMap(Map<String, dynamic> data) {
    return AppIcon(
      appIconId: data['appIconId'],
      name: data['name'],
      gsUrl: data['gsUrl'],
      downloadUrl: data['downloadUrl'],
    );
  }
}
