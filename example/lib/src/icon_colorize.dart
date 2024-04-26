import 'package:flutter/material.dart';

import 'package:lordicon/lordicon.dart';

class IconColorize extends StatefulWidget {
  const IconColorize({
    super.key,
  });

  @override
  State<IconColorize> createState() => _IconColorizeState();
}

class _IconColorizeState extends State<IconColorize> {
  late bool _active;
  late IconController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        IconController.assets('assets/disconnect-network-offline.json');
    _active = false;
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void onClick() {
    _controller.play();

    _controller.direction = _controller.direction * -1;
    _active = !_active;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (event) => onClick(),
      child: IconViewer(
        width: 96,
        height: 96,
        controller: _controller,
        colorize: _active ? Colors.red : null,
      ),
    );
  }
}
