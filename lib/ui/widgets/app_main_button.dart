import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skrew_counter/data/consts/constants.dart';
import 'package:skrew_counter/data/routing/routes.dart';
import 'package:skrew_counter/data/routing/routing_helper.dart';
import 'package:skrew_counter/providers/players_provider.dart';
import 'package:skrew_counter/ui/widgets/app_text.dart';

class AppMainButton extends ConsumerStatefulWidget {
  final String text;
  final double marginWidth;
  const AppMainButton({
    this.marginWidth = 80,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<AppMainButton> createState() => _AppMainButtonState();
}

class _AppMainButtonState extends ConsumerState<AppMainButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.marginWidth),
      child: Material(
        elevation: 3,
        borderOnForeground: false,
        shadowColor: Color(0xffD99441),
        borderRadius: BorderRadius.circular(32),
        child: MaterialButton(
            color: Color(0xffD99441),
            onPressed: () async {
              context.pushNamed(Routes.addPlayers,
                  arguments:
                      ref.watch(playersProvider.notifier).numberOfPlayers);
            },
            height: 60,
            minWidth: MediaQuery.of(context).size.width,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: AppText(
              context: context,
              text: widget.text,
              color: AppColors.appMainColor,
              fontsize: 40,
            )),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: marginWidth),
//       child: Material(
//         elevation: 3,
//         borderOnForeground: false,
//         shadowColor: Color(0xffD99441),
//         borderRadius: BorderRadius.circular(32),
//         child: MaterialButton(
//             color: Color(0xffD99441),
//             onPressed: () async {
//               context.pushNamed(Routes.addPlayers,
//                   arguments:
//                       ref.watch(playersProvider.notifier).numberOfPlayers);
//             },
//             //   context,
//             //   MaterialPageRoute(builder: (context) => screen),
//             // );

//             height: 60,
//             minWidth: MediaQuery.of(context).size.width,
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
//             child: AppText(
//               context: context,
//               text: text,
//               color: AppColors.appMainColor,
//               fontsize: 40,
//             )),
//       ),
//     );
//   }
// }
