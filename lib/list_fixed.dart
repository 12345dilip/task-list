import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    /**
     * Creating a local map for user defined value
     */
    final Map customValue = {};
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          /**
           * countUpdate is a callback function on every action
           */
          return ListItemWidget(
            countUpdate: (newCount) {
              customValue[index] = newCount;
            },
            /**
             * re-assigning the user value to count if exists
             */
            count: customValue.containsKey(index) ? customValue[index]! : 0,
            
          );
        });
  }
}

class ListItemWidget extends StatefulWidget {
  final int count;
  final Function countUpdate;

  const ListItemWidget({
    Key? key,
    required this.count,
    required this.countUpdate,
  }) : super(key: key);

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  int count = 0;
  @override
  void initState() {
    super.initState();
    /**
     * Initialing the widget with appropriate count
     */
    count = widget.count;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Text(count.toString()),
            MaterialButton(
              onPressed: () {
                setState(() {
                  count++;
                });
                widget.countUpdate(count);
              },
              child: const Text("+"),
            )
          ],
        ));
  }
}
