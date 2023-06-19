import 'package:cached_network_image/cached_network_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '/utilities/utilities.dart';
import '/pages/pages.dart';

// Shows a summary of how the collection's name and progress.
class CollectionSummary extends StatelessWidget {
  const CollectionSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(13, 5, 20, 5),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.01,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.95,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 0,
              color: Colors.transparent,
              offset: Offset(0, 1),
            )
          ],
          shape: BoxShape.rectangle,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: ImageViewPage(
                      
                    ),
                  ),
                );
              },
              child: Hero(
                tag: 'imageTag1',
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: 'https://picsum.photos/seed/767/600',
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    width: MediaQuery.of(context).size.width * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.zero,
              child: Container(
                width: 90,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nombre de la colección',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '1',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Color.fromARGB(100, 20, 24, 27)
                          ),
                        ),
                        Text(
                          ' / ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Color.fromARGB(100, 20, 24, 27)
                          ),
                        ),
                        Text(
                          '100',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Color.fromARGB(100, 20, 24, 27)
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue
                ),
                shape: BoxShape.circle
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CollectionPage.route()
                  );
                }, 
                icon: const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Displays the element name and issue number.
class CollectionElement extends StatefulWidget {
  CollectionElement({
    super.key,
  });

  @override
  State<CollectionElement> createState() => _CollectionElementState();
}

class _CollectionElementState extends State<CollectionElement> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 1),
      child: Container(
        width: 100,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 0,
              color: Color(0xFFF5FBFB),
              offset: Offset(0, 1),
            )
          ],
        ),
        child: Padding(
          padding:
            EdgeInsetsDirectional.fromSTEB(0, 12, 8, 12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius:
                  BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/seed/591/600',
                  width: 120,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Book 01',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'Hello World',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color.fromARGB(100, 20, 24, 27),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Theme(
                data: ThemeData(
                  checkboxTheme:
                    CheckboxThemeData(
                    shape:
                      RoundedRectangleBorder(
                      borderRadius:
                        BorderRadius.circular(4),
                      ),
                    ),
                  unselectedWidgetColor:
                      Color.fromARGB(117, 20, 24, 27),
                ),
                child: Checkbox(
                  value: isChecked,
                  onChanged: (newValue) async {
                    setState(() =>
                      isChecked =
                        newValue!
                    );
                  },
                  activeColor:
                    Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

