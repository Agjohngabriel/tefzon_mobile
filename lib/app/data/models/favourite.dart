// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
class Favourite {
  int? id;
  int? legacyId;
  String? name;
  String? shortCode;
  String? twitter;
  int? countryId;
  bool? nationalTeam;
  int? founded;
  String? logoPath;
  int? venueId;
  int? currentSeasonId;
  bool? isPlaceholder;

  Favourite({
    this.id,
    this.legacyId,
    this.name,
    this.shortCode,
    this.twitter,
    this.countryId,
    this.nationalTeam,
    this.founded,
    this.logoPath,
    this.venueId,
    this.currentSeasonId,
    this.isPlaceholder,
  });

  Favourite.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    legacyId = json["legacy_id"];
    name = json["name"];
    shortCode = json["short_code"] == null ? null : json["short_code"];
    twitter = json["twitter"] == null ? null : json["twitter"];
    countryId = json["country_id"];
    nationalTeam = json["national_team"];
    founded = json["founded"];
    logoPath = json["logo_path"];
    venueId = json["venue_id"];
    currentSeasonId = json["current_season_id"];
    isPlaceholder = json["is_placeholder"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "legacy_id": legacyId,
        "name": name,
        "short_code": shortCode == null ? null : shortCode,
        "twitter": twitter == null ? null : twitter,
        "country_id": countryId,
        "national_team": nationalTeam,
        "founded": founded,
        "logo_path": logoPath,
        "venue_id": venueId,
        "current_season_id": currentSeasonId,
        "is_placeholder": isPlaceholder,
      };
}
