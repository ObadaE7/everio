import 'package:flutter/material.dart';

class DraggableSheet extends StatelessWidget {
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final Widget draggableSheetBody;

  const DraggableSheet({
    super.key,
    required this.initialChildSize,
    required this.minChildSize,
    required this.maxChildSize,
    required this.draggableSheetBody,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 10,
                blurRadius: 100,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    width: 60.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40.0),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: draggableSheetBody,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
