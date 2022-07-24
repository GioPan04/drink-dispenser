import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {

  final String imageAsset, text;

  const ImageButton({
    required this.imageAsset,
    required this.text,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(4.0),
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imageAsset)
                  )
                ),
              ),
            ),
            Text(text),
            const SizedBox(height: 16.0)
          ],
        ),
      ),
    );
  }
}