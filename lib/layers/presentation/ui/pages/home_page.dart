import 'package:dbz_app/layers/presentation/ui/components/text_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _contentsTitle = [
    'Personagens',
    'Planetas',
  ];

  Map<String, dynamic> _contentsTrailing = {
    'Personagens': 'assets/images/Goku_logo.png',
    'Planetas': 'assets/images/planets.png'
  };

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
                        bottom: 135,
                        child: Image.asset(
                          'assets/images/Goku_logo.png',
                          width: 100,
                        ),
                      ),
                      Image.asset('assets/images/dbz_logo.png'),
                      Positioned(
                        bottom: 30,
                        child: TextCustom(txt: 'Explorer', color: Colors.amber),
                      )
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _contentsTitle.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Card(
                      color: Colors.amber[100],
                      child: ListTile(
                        trailing: Image.asset(
                            _contentsTrailing[_contentsTitle[index]]),
                        title: Text(_contentsTitle[index]),
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
