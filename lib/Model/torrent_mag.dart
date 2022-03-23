class TorrentMag {
  String? category;
  String? dateUploaded;
  String? downloads;
  String? language;
  String? lastChecked;
  String? leechers;
  String? magnet;
  String? name;
  String? poster;
  String? seeders;
  String? size;
  String? type;
  String? uploadedBy;
  String? url;

  TorrentMag(
      {this.category,
      this.dateUploaded,
      this.downloads,
      this.language,
      this.lastChecked,
      this.leechers,
      this.magnet,
      this.name,
      this.poster,
      this.seeders,
      this.size,
      this.type,
      this.uploadedBy,
      this.url});

  factory TorrentMag.fromJson(Map<String, dynamic> json) {
    return TorrentMag(
      category: json['Category'],
      dateUploaded: json['DateUploaded'],
      downloads: json['Downloads'],
      language: json['Language'],
      lastChecked: json['LastChecked'],
      leechers: json['Leechers'],
      magnet: json['Magnet'],
      name: json['Name'],
      poster: json['Poster'],
      seeders: json['Seeders'],
      size: json['Size'],
      type: json['Type'],
      uploadedBy: json['UploadedBy'],
      url: json['Url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Category'] = category;
    data['DateUploaded'] = dateUploaded;
    data['Downloads'] = downloads;
    data['Language'] = language;
    data['LastChecked'] = lastChecked;
    data['Leechers'] = leechers;
    data['Magnet'] = magnet;
    data['Name'] = name;
    data['Poster'] = poster;
    data['Seeders'] = seeders;
    data['Size'] = size;
    data['Type'] = type;
    data['UploadedBy'] = uploadedBy;
    data['Url'] = url;
    return data;
  }
}
