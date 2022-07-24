import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {

  final String imageAsset, text;
  final VoidCallback? onClick;

  const ImageButton({
    required this.imageAsset,
    required this.text,
    this.onClick,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(4.0),
        onTap: onClick,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 150,
                height: 100,
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