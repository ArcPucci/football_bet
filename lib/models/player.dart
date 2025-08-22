class Player {
  final int id;
  final int eventId;
  final String name;
  final String photo;
  int firstParticipantWins;

  Player({
    required this.id,
    required this.eventId,
    required this.name,
    required this.photo,
    this.firstParticipantWins = 0,
  });

  bool get photoFromAsset => photo.startsWith('assets/');

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'event_id': eventId,
      'name': name,
      'photo': photo,
      'first_participant_wins': firstParticipantWins,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      id: map['id'] as int,
      eventId: map['event_id'] as int,
      name: map['name'] as String,
      photo: map['photo'] as String,
      firstParticipantWins: map['first_participant_wins'] as int,
    );
  }
}
