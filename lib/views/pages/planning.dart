import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:trafic_app/helpers/colors.dart';
import 'package:trafic_app/services/data_service.dart';
import 'package:trafic_app/views/Widgets/empty.dart';

class Planning extends StatefulWidget {
  const Planning({super.key});

  @override
  State<Planning> createState() => _PlanningState();
}

class _PlanningState extends State<Planning> {
  TextEditingController _textEditingLigneController = TextEditingController();
  TextEditingController _textEditingEndPositionController =
      TextEditingController();
  TextEditingController _textEditingStartPositionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width, // Spécifiez une largeur
        height: MediaQuery.of(context).size.height, // Spécifiez une hauteur
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Stack(
                children: [
                  TypeAheadField(
                    getImmediateSuggestions: true,
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: _textEditingLigneController,
                      autofocus: false,
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(fontStyle: FontStyle.normal),
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(167, 255, 255, 255),
                        filled: true,
                        hintText: 'Choisir une ligne',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.turn_sharp_right_sharp,
                          size: 25,
                        ),
                      ),
                    ),
                    suggestionsCallback: (pattern) =>
                        DataService.getLinesByName(pattern),
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        leading: Icon(Icons.location_on_outlined),
                        title: Text(suggestion),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      setState(() {
                        _textEditingLigneController.text = suggestion;
                      });
                      // Navigator.of(context).push<void>(MaterialPageRoute(
                      //     builder: (context) =>
                      //         ProductPage(product: suggestion)));
                    },
                  ),
                  Positioned(
                    right: 12,
                    bottom: 10,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFF5F67EA),
                      ),
                      child: const Icon(
                        Icons.map_outlined,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 5.0, right: 10.0, left: 10.0),
              child: Stack(
                children: [
                  TypeAheadField(
                    getImmediateSuggestions: true,
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: _textEditingStartPositionController,
                      autofocus: false,
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(fontStyle: FontStyle.normal),
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(167, 255, 255, 255),
                        filled: true,
                        hintText: 'Position initiale',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.radio_button_checked_sharp,
                          size: 20,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    suggestionsCallback: (pattern) =>
                        DataService.getTerminalsByName(pattern),
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        leading: Icon(Icons.location_on_outlined),
                        title: Text(suggestion),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      setState(() {
                        _textEditingStartPositionController.text = suggestion;
                      });
                      // Navigator.of(context).push<void>(MaterialPageRoute(
                      //     builder: (context) =>
                      //         ProductPage(product: suggestion)));
                    },
                  ),
                  Positioned(
                    right: 12,
                    bottom: 10,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFF5F67EA),
                      ),
                      child: const Icon(
                        Icons.person_pin_circle_outlined,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Stack(
                children: [
                  TypeAheadField(
                    getImmediateSuggestions: true,
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: _textEditingEndPositionController,
                      autofocus: false,
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(fontStyle: FontStyle.normal),
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(167, 255, 255, 255),
                        filled: true,
                        hintText: 'Destination',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.radio_button_checked_sharp,
                          size: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    suggestionsCallback: (pattern) =>
                        DataService.getTerminalsByName(pattern),
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        leading: Icon(Icons.location_on_outlined),
                        title: Text(suggestion),
                      );
                    },
                    onSuggestionSelected: (suggestion) {
                      setState(() {
                        _textEditingEndPositionController.text = suggestion;
                      });
                      // Navigator.of(context).push<void>(MaterialPageRoute(
                      //     builder: (context) =>
                      //         ProductPage(product: suggestion)));
                    },
                  ),
                  Positioned(
                    right: 12,
                    bottom: 5,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFF5F67EA),
                      ),
                      child: const Icon(
                        Icons.person_pin_circle,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(whiteColor),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0))),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Column(
                  children: [
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Resultat",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(dartBlueColor),
                          fontSize: 30.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial'),
                    ),
                    SizedBox(
                      height: 90.0,
                    ),
                    EmptyWidget()
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
