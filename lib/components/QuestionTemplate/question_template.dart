import 'package:easyhome/components/QuestionTemplate/components/choice_card.dart';
import 'package:easyhome/components/forward_button.dart';
import 'package:easyhome/components/Navbar/navbar.dart';
import 'package:easyhome/services/size_config.dart';
import 'package:flutter/material.dart';

class QuestionTemplate extends StatefulWidget {
  QuestionTemplate({@required this.title, this.onTap, @required this.data});

  final String title;
  final Function onTap;
  final List data;

  @override
  _QuestionTemplate createState() => _QuestionTemplate();
}

class _QuestionTemplate extends State<QuestionTemplate> {
  List<bool> selectItems = [];
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    initSelectItems();
  }

  initSelectItems() {
    for (int i = 0; i < widget.data.length; i++) {
      selectItems.add(false);
    }
  }

  resetItem() {
    for (int i = 0; i < selectItems.length; i++) {
      selectItems[i] = false;
    }
  }

  hasSelected(int index) {
    resetItem();
    setState(() {
      selectItems[index] = true;
      isSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.only(
              bottom: SizeConfig.horizontal * 19,
              right: SizeConfig.horizontal * 4),
          child: ForwardButton(
            label: 'Avanti',
            reverse: true,
            onTap: isSelected ? widget.onTap : null,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Navbar(
              color: Theme.of(context).accentColor,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: SizeConfig.horizontal * 5,
                  left: SizeConfig.horizontal * 5,
                  top: SizeConfig.vertical * 5),
              child: Text(
                'Dove cerchi appartamento?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: SizeConfig.horizontal * 5),
              ),
            ),
            Container(
              height: SizeConfig.vertical * 70,
              width: double.infinity,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 25,
                childAspectRatio: 5 / 3,
                children: widget.data
                    .asMap()
                    .map((index, element) => MapEntry(
                        index,
                        GestureDetector(
                          onTap: () => hasSelected(index),
                          child: ChoiceCard(
                            label: element,
                            isSelected: selectItems[index],
                          ),
                        )))
                    .values
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
