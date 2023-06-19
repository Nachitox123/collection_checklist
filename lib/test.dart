/* import 'package:cached_network_image/cached_network_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Collections',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/collection': (context) => CollectionPage(),
      },
    );
  }
}

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

class ImageViewPage extends StatelessWidget {
  const ImageViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context); // Go back to the previous page
          },
          child: CachedNetworkImage(
            imageUrl: 'https://picsum.photos/seed/767/600',
            placeholder: (context, url) => const CircularProgressIndicator(),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => ImageViewPage(),
    );
  }
}

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
        decoration: const BoxDecoration(
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
                  context, //ImagePage.route()
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: ImageViewPage(),
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
                child: const Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nombre de la colección',
                      textAlign: TextAlign.justify,
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

class CollectionElement extends StatefulWidget {
  const CollectionElement({
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
              const Column(
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

 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CheckboxProvider(),
      child: MaterialApp(
        title: 'Checkbox App',
        initialRoute: '/',
        routes: {
          '/': (_) => Page1(),
          '/page2': (_) => Page2(),
        },
      ),
    );
  }
}


class CheckboxProvider extends ChangeNotifier {
  int _totalCheckboxes = 0;
  int _tickedCheckboxes = 0;

  int get totalCheckboxes => _totalCheckboxes;
  int get tickedCheckboxes => _tickedCheckboxes;

  void incrementTotalCheckboxes() {
    _totalCheckboxes++;
    notifyListeners();
  }

  void incrementTickedCheckboxes() {
    _tickedCheckboxes++;
    notifyListeners();
  }

  void decrementTickedCheckboxes() {
    _tickedCheckboxes--;
    notifyListeners();
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final checkboxProvider = Provider.of<CheckboxProvider>(context);
    bool isChecked = false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with the actual number of checkboxes
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text('Checkbox $index'),
            value: isChecked,
            onChanged: (newValue) {
              if (isChecked) {
                checkboxProvider.incrementTotalCheckboxes();
                checkboxProvider.incrementTickedCheckboxes();
              } else {
                checkboxProvider.decrementTickedCheckboxes();
              }
            },
          );
        },
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final checkboxProvider = Provider.of<CheckboxProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ticked Checkboxes: ${checkboxProvider.tickedCheckboxes}'),
            SizedBox(height: 16),
            Text('Total Checkboxes: ${checkboxProvider.totalCheckboxes}'),
          ],
        ),
      ),
    );
  }
}
