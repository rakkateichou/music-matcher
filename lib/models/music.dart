class Music {
  final String title;
  final String artist;
  final String album;
  final String albumArtUrl;
  final String url;

  Music({
    required this.title,
    required this.artist,
    required this.album,
    required this.albumArtUrl,
    required this.url,
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      title: json['title'],
      artist: json['artist'],
      album: json['album'],
      albumArtUrl: json['albumArtUrl'],
      url: json['url'],
    );
  }

  static List<Music> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Music.fromJson(json)).toList();
  }

  static List<Music> musics() {
    // return prefilled list of musics
    return [
      Music(
        title: 'The Less I Know The Better',
        artist: 'Tame Impala',
        album: 'Currents',
        albumArtUrl:
            'https://upload.wikimedia.org/wikipedia/en/9/9b/Tame_Impala_-_Currents.png',
        url: 'https://www.youtube.com/watch?v=sBzrzS1Ag_g',
      ),
      Music(
        title: 'Good Life',
        artist: 'Kanye West',
        album: 'Graduation',
        albumArtUrl:
            'https://upload.wikimedia.org/wikipedia/en/7/70/Graduation_%28album%29.jpg',
        url: 'https://www.youtube.com/watch?v=FEKEjpTzB0Q',
      ),
      Music(
        title: 'Goth',
        artist: 'Sidewalks and Skeletons',
        album: 'Sidewalks and Skeletons',
        albumArtUrl:
            'https://images.genius.com/311b6e2c574171777b1e514b7ce68eca.1000x1000x1.jpg',
        url: 'https://www.youtube.com/watch?v=yMiIrAxQhFA',
      ),
      Music(
        title: 'Nightcall',
        artist: 'Kavinsky',
        album: 'Nightcall',
        albumArtUrl:
            'https://upload.wikimedia.org/wikipedia/en/5/5b/Kavinsky_Nightcall_2010.png',
        url: 'https://www.youtube.com/watch?v=MV_3Dpw-BRY',
      ),
      Music(
        title: 'Barbie Girl',
        artist: 'Aqua',
        album: 'Aquarium',
        albumArtUrl:
            'https://upload.wikimedia.org/wikipedia/en/8/80/Aquariumcover.jpg',
        url: 'https://www.youtube.com/watch?v=ZyhrYis509A',
      ),
    ];
  }
}
