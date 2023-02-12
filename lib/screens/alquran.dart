import 'package:flutter/material.dart';
import 'package:quran_app/shared/constant/surah_builder.dart';
import '../shared/constant/arabic_sura_number.dart';
import '../shared/constant/constant.dart';
import '../shared/styles/colors.dart';
import 'drawer.dart';

class AlQuranScreen extends StatefulWidget {
  const AlQuranScreen({Key? key}) : super(key: key);

  @override
  State<AlQuranScreen> createState() => _AlQuranScreenState();
}

class _AlQuranScreenState extends State<AlQuranScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Go to bookmark',
        backgroundColor: ColorApp.primary,

        onPressed: () async {
          fabIsClicked = true;
          if (await readBookmark() == true) {
            // ignore: use_build_context_synchronously
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SurahBuilder(
                      arabic: quran[0],
                      sura: bookmarkedSura - 1,
                      suraName: arabicName[bookmarkedSura - 1]['name'],
                      ayah: bookmarkedAyah,

                    )));
          }
        },
        child: const Icon(
            Icons.bookmark,
        ),
      ),
      appBar: AppBar(
        backgroundColor: ColorApp.primary,
        title: const Text(
          "القرآن",
          style: TextStyle(
            fontFamily: 'Tajawal',
              fontSize: 30,
              shadows: [
                Shadow(
                  offset: Offset(1, 1),
                  blurRadius: 2.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ]),
        ),
      ),
      body: FutureBuilder(
        future: readJson(),
        builder: (
            BuildContext context,
            AsyncSnapshot snapshot,
            ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: ColorApp.primary,));
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return indexCreator(snapshot.data, context);
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }


  Container indexCreator(quran, context) {
    return Container(
      color: const Color.fromARGB(255, 221, 250, 236),
      child: ListView(
        children: [
          for (int i = 0; i < 114; i++)
            Container(
              color:  const Color.fromARGB(255, 253, 251, 240),
              child: TextButton(
                child: Row(
                  children: [
                    ArabicSuraNumber(i: i),
                    const SizedBox(
                      width: 5,
                    ),

                    const Expanded(
                        child:
                        SizedBox()),
                    Text(
                      arabicName[i]['name'],
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.black87,
                          fontFamily: 'Tajawal',
                          shadows: [
                            Shadow(
                              offset: Offset(.5, .5),
                              blurRadius: 1.0,
                              color: Color.fromARGB(255, 130, 130, 130),
                            )
                          ]),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
                onPressed: () {
                  fabIsClicked = false;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SurahBuilder(
                          arabic: quran[0],
                          sura: i,
                          suraName: arabicName[i]['name'],
                          ayah: 0,
                        )),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }


}