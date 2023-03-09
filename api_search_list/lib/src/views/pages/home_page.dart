import 'package:flutter/material.dart';

// Model
import '../../models/character_model.dart';

// Controller
import '../../controllers/character_controller.dart';

// Components
import '../components/loading.dart';
import '../components/list.dart';
import '../components/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Character> _characters = <Character>[];
  List<Character> _charactersDisplay = <Character>[];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCharacters().then((value) {
      setState(() {
        _isLoading = false;
        _characters.addAll(value);
        _charactersDisplay = _characters;
        // print(_usersDisplay.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Better Call Saul'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (!_isLoading) {
              return index == 0
                  ? MySearch(
                      hintText: 'ex: name, nickname or portrayed.',
                      onChanged: (searchText) {
                        searchText = searchText.toLowerCase();
                        setState(() {
                          _charactersDisplay = _characters.where((u) {
                            var nameLowerCase = u.name.toLowerCase();
                            var nicknameLowerCase = u.nickname.toLowerCase();
                            var portrayedLowerCase = u.portrayed.toLowerCase();
                            return nameLowerCase.contains(searchText) ||
                                nicknameLowerCase.contains(searchText) ||
                                portrayedLowerCase.contains(searchText);
                          }).toList();
                        });
                      },
                    )
                  : MyList(character: _charactersDisplay[index - 1]);
            } else {
              return const MyLoading();
            }
          },
          itemCount: _charactersDisplay.length + 1,
        ),
      ),
    );
  }
}
