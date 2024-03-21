import 'package:flutter/material.dart';

class MultiSelection extends StatefulWidget {
  const MultiSelection(
      {Key? key, required this.nextClicked, required this.prevClicked})
      : super(key: key);
  final VoidCallback prevClicked;
  final VoidCallback nextClicked;

  @override
  State<MultiSelection> createState() => _MultiSelectionState();
}

class _MultiSelectionState extends State<MultiSelection> {
  List multipleSelected = [];
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "Red",
    },
    {
      "id": 1,
      "value": false,
      "title": "Black",
    },
    {
      "id": 2,
      "value": false,
      "title": "Green",
    },
    {
      "id": 3,
      "value": false,
      "title": "Blue",
    },
  ];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Dispose");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      multipleSelected = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          children: [
            const Text(
              "Which color do you like the most?",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            Column(
              children: List.generate(
                checkListItems.length,
                (index) => CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(
                    checkListItems[index]["title"],
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  value: checkListItems[index]["value"],
                  onChanged: (value) {
                    setState(() {
                      checkListItems[index]["value"] = value;
                      if (multipleSelected.contains(checkListItems[index])) {
                        multipleSelected.remove(checkListItems[index]);
                      } else {
                        multipleSelected.add(checkListItems[index]);
                      }
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 64.0),
            Text(
              multipleSelected.isEmpty
                  ? ""
                  : "Selected answers: ${multipleSelected.map((e) => e["title"]).toString().replaceAll('(', '').replaceAll(')', '')}",
              style: const TextStyle(
                fontSize: 22.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, top: 18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: widget.prevClicked,
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  Expanded(
                      child: Container(
                    width: 10,
                  )),
                  ElevatedButton(
                    onPressed: widget.nextClicked,
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
