import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int photoIndex = 0;
  List<String> photos = [
    'assets/momo1.jpg',
    'assets/momo2.jpg',
    'assets/momo3.jpg',
    'assets/momo4.jpg',
  ];
  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Icon(
          Icons.food_bank,
          color: Colors.green,
          size: 50,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    image: DecorationImage(
                      image: AssetImage(photos[photoIndex]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 400.0,
                  width: 300,
                ),
                Positioned(
                  top: 375.0,
                  left: 25.0,
                  right: 25.0,
                  child: SelectedPhoto(
                    numberOfDots: photos.length,
                    photoIndex: photoIndex,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RaisedButton(
                onPressed: _previousImage,
                child: Text('Previous'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: _nextImage,
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SelectedPhoto extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;
  SelectedPhoto({this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 8.0,
          width: 8.0,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 2.0,
                color: Colors.grey,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for (int i = 0; i < numberOfDots; ++i) {
      dots.add(
        i == photoIndex ? _activePhoto() : _inactivePhoto(),
      );
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}
