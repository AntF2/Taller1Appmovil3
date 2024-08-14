import 'package:flutter/material.dart';
import 'dart:math'; 

class MiGrid extends StatefulWidget {
  const MiGrid({super.key});

  @override
  _MiGridState createState() => _MiGridState();
}

class _MiGridState extends State<MiGrid> {
  final List<int> _imageIndices = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.extent(
            maxCrossAxisExtent: 300,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: const EdgeInsets.all(10),
            children: List.generate(
              _imageIndices.length,
              (index) => Card(
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: Image.asset(
                          "images/img${_imageIndices[index]}.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text("Imagen ${_imageIndices[index]}"),
                  ],
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: _addImage,
          child: const Text("Añadir Imagen"),
        ),
      ],
    );
  }

  void _addImage() {
    setState(() {
      int newIndex = Random().nextInt(7); 
      _imageIndices.add(newIndex);
    });
  }
}
