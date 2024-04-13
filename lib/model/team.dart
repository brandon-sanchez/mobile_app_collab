class Team {
  final int? id;
  final String? name;
  final String? code;
  final String? conference;
  final String? division;
  final bool? nbaFranchise;

  Team({
    this.id,
    this.name,
    this.code,
    this.conference,
    this.division,
    this.nbaFranchise,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic>? standardLeagueInfo = (json['leagues']
        as Map<String, dynamic>)['standard'] as Map<String, dynamic>?;
    return Team(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      conference: standardLeagueInfo?['conference'] as String?,
      division: standardLeagueInfo?['division'] as String?,
      nbaFranchise: json['nbaFranchise'] as bool?,
    );
  }
}
