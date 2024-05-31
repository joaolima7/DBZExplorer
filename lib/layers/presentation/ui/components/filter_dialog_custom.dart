import 'package:flutter/material.dart';

class FilterDialogCustom extends StatefulWidget {
  final Function(String) onSelected;

  const FilterDialogCustom({Key? key, required this.onSelected})
      : super(key: key);

  @override
  _FilterDialogCustomState createState() => _FilterDialogCustomState();
}

class _FilterDialogCustomState extends State<FilterDialogCustom> {
  String _selectedOption = 'Todos';

  @override
  Widget build(BuildContext context) {
    var sc = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Lottie.asset(
            //   'lotties/filter_animation.json', // Adicione sua animação Lottie aqui
            //   width: sc.width * .2,
            //   repeat: false,
            // ),
            Text(
              'Filtrar por',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            _buildRadioOption('Todos'),
            _buildRadioOption('Personagens'),
            _buildRadioOption('Planetas'),
            _buildRadioOption('Transformações'),
            SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     widget.onSelected(_selectedOption);
            //     Navigator.of(context).pop();
            //   },
            //   style: ElevatedButton.styleFrom(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     backgroundColor: Color(0xff809fff),
            //   ),
            //   child: Text(
            //     'OK',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioOption(String value) {
    return ListTile(
      title: Text(value),
      leading: Radio<String>(
        value: value,
        groupValue: _selectedOption,
        onChanged: (String? newValue) {
          setState(() {
            _selectedOption = newValue!;
          });
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

void showFilterDialogCustom({
  required BuildContext context,
  required Function(String) onSelected,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black54,
    transitionDuration: Duration(milliseconds: 400),
    pageBuilder: (context, anim1, anim2) {
      return FilterDialogCustom(onSelected: onSelected);
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return Transform.scale(
        scale: Curves.elasticOut.transform(anim1.value),
        child: Opacity(
          opacity: anim1.value,
          child: child,
        ),
      );
    },
  );
}
