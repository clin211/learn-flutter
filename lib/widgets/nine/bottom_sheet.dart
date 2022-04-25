import 'package:flutter/material.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: 200,
          height: 36,
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            child: const Text('bottom sheet'),
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.87,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                          ),
                          child: Row(
                            children: [
                              const Expanded(
                                child: Text('This is a modal bottom sheet'),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemExtent: 50,
                            itemCount: 20,
                            itemBuilder: (_, index) => Container(
                              color: Colors.primaries[index % 18][200],
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('This is item $index index'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
        ElevatedButton(
          child: Text('Draggable scrollable sheet'),
          onPressed: () async {
            await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return DraggableScrollableSheet(
                  expand: false,
                  initialChildSize: 0.5,
                  minChildSize: 0.5,
                  maxChildSize: 1,
                  builder: (
                    BuildContext context,
                    ScrollController scrollController,
                  ) {
                    return Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                            ),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Text('This is a modal bottom sheet'),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        )
      ],
    );
  }
}
