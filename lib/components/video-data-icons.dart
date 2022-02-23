import 'package:flutter/material.dart';
import 'package:slinkshot_test/utility/content.dart';

class VideoDataIcons extends StatefulWidget {
  final Content content;

  const VideoDataIcons({Key? key, required this.content}) : super(key: key);

  @override
  _VideoDataIconsState createState() => _VideoDataIconsState();
}

class _VideoDataIconsState extends State<VideoDataIcons> {
  Color iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Icon(Icons.visibility, color: Colors.white),
            Text(
              "${widget.content.views}",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.favorite),
              color: iconColor,
              tooltip: 'Add to favorite',
              onPressed: () {
                setState(() {
                  if (iconColor == Colors.white) {
                    iconColor = Colors.red[700]!;
                  } else {
                    iconColor = Colors.white;
                  }
                });
              },
            ),
            Text(
              "${widget.content.favds}",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        Row(
          children: [
            Icon(Icons.comment, color: Colors.white),
            Text(
              "${widget.content.comments}",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        Icon(Icons.warning, color: Colors.white),
        Icon(Icons.share, color: Colors.white),
        Icon(Icons.open_in_full, color: Colors.white),
      ],
    );
  }
}
