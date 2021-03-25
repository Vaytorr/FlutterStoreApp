import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController pageController;
  final int page;
  Color _ciano = Color(0xff007BA7);
  DrawerTile(this.icon, this.text, this.pageController, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          pageController.jumpToPage(page);
        },
        child: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Container(
              height: 60,
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 32,
                    color:
                        pageController.page == page ? _ciano : Colors.grey[700],
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 16,
                        color: pageController.page == page
                            ? _ciano
                            : Colors.grey[700]),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
