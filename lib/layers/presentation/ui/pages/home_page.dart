import 'package:dbz_app/layers/core/utils/consts/interface_contents_consts.dart';
import 'package:dbz_app/layers/presentation/ui/components/text_custom.dart';
import 'package:dbz_app/layers/presentation/ui/pages/character/character_result_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SafeArea(
                child: Container(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: 0,
                        bottom: 125,
                        child: Image.asset(
                          'assets/images/Goku_logo.png',
                          width: 100,
                        ),
                      ),
                      Image.asset('assets/images/dbz_logo.png'),
                      Positioned(
                        bottom: 30,
                        child: TextCustom(
                          txt: 'Explorer',
                          color: Colors.amber,
                          sizeWidth: sizeScreen.width,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: contentsTitle.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
                      color: Colors.amber[100],
                      child: ListTile(
                        onTap: () {
                          if (index == 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CharacterResultPage()));
                          }
                        },
                        trailing:
                            Image.asset(contentsTrailing[contentsTitle[index]]),
                        title: TextCustom(
                          txt: contentsTitle[index],
                          color: Colors.black,
                          sizeWidth: sizeScreen.width / 2,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
