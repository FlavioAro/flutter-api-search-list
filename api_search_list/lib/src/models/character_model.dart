class Character {
  int char_id = 0;
  String name = "";
  String img = "";
  String nickname = "";
  String portrayed = "";

  Character(this.char_id, this.name, this.img, this.nickname, this.portrayed);

  Character.fromJson(Map<String, dynamic> json) {
    char_id = json['char_id'];
    name = json['name'];
    img = json['img'];
    nickname = json['nickname'];
    portrayed = json['portrayed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['char_id'] = char_id;
    data['name'] = name;
    data['img'] = img;
    data['nickname'] = nickname;
    data['portrayed'] = portrayed;
    return data;
  }
}
