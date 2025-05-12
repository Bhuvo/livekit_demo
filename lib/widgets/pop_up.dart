import 'package:flutter/material.dart';

class MPopUp extends StatefulWidget {
 final Widget child;
 final List<MMenu>? items;
  const MPopUp({super.key, required this.child, this.items});
  @override
  _MPopUpState createState() => _MPopUpState();
}

class _MPopUpState extends State<MPopUp> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  void _togglePopover() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    Size textSize = renderBox.size;
    Offset textPosition = renderBox.localToGlobal(Offset.zero);
    Size screenSize = MediaQuery.of(context).size;

    double popoverWidth = 200;
    double popoverHeight = 250;

    // Default positions (below the text)
    double dx = textPosition.dx;
    double dy = textPosition.dy + textSize.height + 10;

    // Adjust if going off right edge
    if (dx + popoverWidth > screenSize.width) {
      dx = screenSize.width - popoverWidth - 10;
    }

    // Adjust if going off bottom edge
    if (dy + popoverHeight > screenSize.height) {
      dy = textPosition.dy - popoverHeight - 20; // show above the text
    }

    // Arrow position relative to popover
    double arrowLeftOffset = (textPosition.dx + textSize.width / 2) - dx - 10;

    return OverlayEntry(
      builder: (context) => Positioned(
        left: dx,
        top: dy,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: popoverWidth,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: widget.items?.map((e) => _buildItem(e)).toList() ?? [],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(MMenu data) {
    return ListTile(
      leading: Icon(data.icon ?? Icons.settings),
      title: Text(data.title ?? ''),
      onTap: () {

        // handle selection
        // _togglePopover();
      },
    );
  }

  final GlobalKey _key = GlobalKey();

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _togglePopover(),
      key: _key,
      child: widget.child,
    );
  }
}

class MMenu {
  String? title;
  IconData? icon;
  String? route;
  MMenu({this.title, this.icon, this.route});
}