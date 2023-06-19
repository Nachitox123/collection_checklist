import 'package:cached_network_image/cached_network_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '/widgets/custom_widgets.dart';
import '/utilities/utilities.dart';

// Page where on going collections are shown.
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Collections Checklist",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Useful Links',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Add functionality for item 1 her
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Add functionality for item 2 here
              },
            ),
            ListTile(
              title: Text('Item 3'),
              onTap: () {
                // Add functionality for item 3 here
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('FloatingActionButton pressed ...');
          },
          backgroundColor: Colors.blue,
          elevation: 8,
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.black,
              size: 24,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
      ),
      body: SafeArea(
        top: true,
        child: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey,
                    offset: Offset(0, 0),
                  )
                ],
                borderRadius: BorderRadius.circular(24),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Color(0xFFF5FBFB),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: const [
                          CollectionSummary(),
                          CollectionSummary(),
                          CollectionSummary(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Page where collection's elements are shown.
class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: Colors.blue,
        elevation: 8,
        child: IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          const SliverAppBar(
            pinned: true,
            floating: false,
            backgroundColor: Colors.blue,
            automaticallyImplyLeading: true,
            title: Text(
              'Collection Name',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Outfit',
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2,
          )
        ],
        body: Builder(
          builder: (context) {
            return SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                          child: CachedNetworkImage(
                            imageUrl: 'https://picsum.photos/seed/591/600',
                            placeholder: (context, url) => const CircularProgressIndicator(),
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'imageTag2',
                      transitionOnUserGestures: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: CachedNetworkImage(
                          imageUrl: 'https://picsum.photos/seed/591/600',
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.25,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 3,
                              color: Color(0x33000000),
                              offset: Offset(0, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Color(0xFFF5FBFB),
                            width: 1,
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  CollectionElement(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => CollectionPage(),
    );
  }
}