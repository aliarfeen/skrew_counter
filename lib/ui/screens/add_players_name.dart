import 'package:flutter/material.dart';
import 'package:skrew_counter/data/consts/constants.dart';
import 'package:skrew_counter/providers/players_provider.dart';
import 'package:skrew_counter/ui/screens/scoreboard_screen.dart';
import 'package:skrew_counter/ui/widgets/app_text.dart';
import 'package:skrew_counter/ui/widgets/app_text_area.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlayers extends ConsumerStatefulWidget {
  final int number;

  AddPlayers({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  ConsumerState<AddPlayers> createState() => _AddPlayersState();
}

class _AddPlayersState extends ConsumerState<AddPlayers> {
  late PlayersNotifier playersNotifier;
  late List<TextEditingController> _controllers;
  late List<String?> _errorMessages;

  @override
  void initState() {
    super.initState();

    playersNotifier = ref.read(playersProvider.notifier);
    _controllers = List.generate(widget.number, (_) => TextEditingController());
    _errorMessages = List.generate(widget.number, (_) => null);
  }

  void _validateAndSubmit() {
    bool isValid = true;
    for (int i = 0; i < _controllers.length; i++) {
      if (_controllers[i].text.isEmpty) {
        _errorMessages[i] = 'أكتب أي حاجة اديك عليها درجة';
        isValid = false;
      } else if (_controllers[i].text.length > 10) {
        _errorMessages[i] = 'أخرك 10 حروف احنا مش في السجل المدني';
        isValid = false;
      } else {
        _errorMessages[i] = null;
      }
    }

    setState(() {});

    if (isValid) {
      List<String> data =
          _controllers.map((controller) => controller.text).toList();
      playersNotifier.addPlayer(data);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScrewCounterScreen(
            number: widget.number,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF2F2D3A),
              Color(0xFF463259),
              Color(0xFF592735),
              Color(0xFF592735),
              Color(0xFF463259),
              Color(0xFF2F2D3A),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    color: AppColors.appSecColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 30,
                    )),
                Image.asset(
                  'assets/images/logo.png',
                  height: 80,
                ),
                IconButton(
                    color: AppColors.appSecColor,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.help,
                      size: 30,
                    )),
              ],
            ),
            AppText(
              context: context,
              text: 'أدخل أسماء اللاعبين',
              fontsize: 30,
              color: AppColors.appSecColor,
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                ..._controllers.asMap().entries.map((entry) {
                  int index = entry.key;
                  TextEditingController controller = entry.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextField(
                        controller: controller,
                        hintText: "اسم اللاعب ${index + 1}",
                      ),
                      if (_errorMessages[index] != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            _errorMessages[index]!,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                    ],
                  );
                }).toList(),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            MaterialButton(
              color: AppColors.appSecColor,
              onPressed: _validateAndSubmit,
              height: 60,
              minWidth: MediaQuery.of(context).size.width,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
              child: AppText(
                context: context,
                text: 'يلا بينا',
                color: AppColors.appMainColor,
                fontsize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
