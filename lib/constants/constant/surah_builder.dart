import 'package:flutter/material.dart';
import 'package:quran_app/ui/views/setting/setting_View.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/ widgets/return_basmala.dart';
import 'constant.dart';

final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();

// ignore: must_be_immutable
class SurahBuilder extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final sura;
  // ignore: prefer_typing_uninitialized_variables
  final arabic;
  // ignore: prefer_typing_uninitialized_variables
  final suraName;
  int ayah;

  SurahBuilder(
      {Key? key, this.sura, this.arabic, this.suraName, required this.ayah})
      : super(key: key);

  @override
  State<SurahBuilder> createState() => _SurahBuilderState();
}

class _SurahBuilderState extends State<SurahBuilder> {
  bool view = true;

  ///initstate
  ///jumbtoayah
  ///savebookmark
  ///verseBuilding
  ///singleSuraBUILDERS

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => jumpToAyah());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    int LengthOfSura = noOfVerses[widget.sura];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(

          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SettingsView()));
                },
                icon: const Icon(
                  Icons.settings,
                  size: 28,
                  color: Colors.white,
                )),
          ],
          leading: Tooltip(
            message: 'Mushaf Mode',
            child: TextButton(
              child: const Icon(
                Icons.chrome_reader_mode,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  view = !view;

                });
              },
            ),
          ),
          centerTitle: true,
          title: Text(
            // widget.
            widget.suraName,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Tajawal',
                shadows: [
                  Shadow(
                    offset: Offset(1, 1),
                    blurRadius: 2.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ]),
          ),
          backgroundColor: const Color(0xff003d35),
          iconTheme: const IconThemeData(
            color: Color(0xffdebc9b),
          ),
        ),
        body: SingleSuraBuilder(LengthOfSura),
      ),
    );
  }

  jumpToAyah() {
    if (fabIsClicked) {

      itemScrollController.scrollTo(

        index: widget.ayah,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInCubic,

      );
      fabIsClicked = false;
    }
  }

  saveBookMark(surah, ayah) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setInt('surah', surah);
    await pref.setInt('ayah', ayah);
  }

  Row verseBuilder(int index, previous) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Text(
                widget.arabic[index + previous]['aya_text'],
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: arabicFontSize,
                  fontFamily: arabicFont,
                  color: const Color.fromARGB(196, 0, 0, 0),
                ),
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                // children: [],
              ),
            ],
          ),
        ),
      ],
    );
  }



  // ignore: non_constant_identifier_names
  SafeArea SingleSuraBuilder(LenghtOfSura) {

    String fullSura = '';
    int previousVerses = 0;
    if (widget.sura + 1 != 1) {


      for (int i = widget.sura - 1; i >= 0; i--) {
        previousVerses = previousVerses + noOfVerses[i];
      }
    }

    if (!view)
      {

        for (int i = 0; i < LenghtOfSura; i++) {

          fullSura += (widget.arabic[i + previousVerses]['aya_text']);
        }


      }

      // ignore: curly_braces_in_flow_control_structures


    return SafeArea(
      child: Container(
        color: const Color.fromARGB(255, 253, 251, 240),
        child: view
            ? ScrollablePositionedList.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      (index != 0) || (widget.sura == 0) || (widget.sura == 8)
                          ? const Text('')
                          : returnBasmala(),
                      Container(
                        color: const Color.fromARGB(255, 253, 251, 240),
                        child: PopupMenuButton(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: verseBuilder(index, previousVerses),
                            ),
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    onTap: () {
                                      saveBookMark(widget.sura + 1, index);
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.bookmark_add,
                                          color: Color(0xff003d35),

                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Bookmark'),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    onTap: () {},
                                    child: Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Share.share('''*Quran app*\n
                                            u can develop it from my github github.com/itAbdulrahmanRamadan ''');
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.share,
                                            color:  Color(0xff003d35),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text('Share'),
                                      ],
                                    ),
                                  ),
                                ]),
                      ),
                    ],
                  );
                },
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                itemCount: LenghtOfSura,
              )
            : ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                                widget.sura + 1 != 1 && widget.sura + 1 != 9
                                ? returnBasmala()
                                : const Text(''),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                fullSura, //mushaf mode
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: mushafFontSize,
                                  fontFamily: arabicFont,
                                  color: const Color.fromARGB(196, 44, 44, 44),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}




