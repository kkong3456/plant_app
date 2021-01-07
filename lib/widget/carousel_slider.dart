import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:plant_app/model/model_movie.dart';
import 'package:plant_app/screens/detail_screen.dart';


class CarouseImage extends StatefulWidget {
  final List<Movie> movies;

  CarouseImage({this.movies});

  //@override
  _CarouseImageState createState() => _CarouseImageState();
}

class _CarouseImageState extends State<CarouseImage> {
  List<Movie> movies;
  List<Widget> images;
  List<String> keywords;
  List<bool> likes;

  int _currentPage = 0;
  String _currentKeyword;

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images =
        movies.map((m) => Image.network(m.poster)).toList();
    keywords = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();
    _currentKeyword = keywords[0];
    print('likes $images');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
          ),
          // ignore: missing_required_param
          CarouselSlider(
            items: images,
            options: CarouselOptions(onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
                _currentKeyword = keywords[_currentPage];
                print('movies is $movies');
                print('_currentPage $_currentPage');
                print('_currentKeyword $_currentKeyword');
              });
            }),
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              _currentKeyword,
              style: TextStyle(fontSize: 11),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      likes[_currentPage]
                          ? IconButton(
                              icon: Icon(Icons.check),
                              onPressed: () {
                                setState((){
                                  likes[_currentPage]=!likes[_currentPage];
                                  movies[_currentPage].reference.update(
                                    {'like':likes[_currentPage]}
                                  );
                                });
                              },
                            )
                          : IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState((){
                                  likes[_currentPage]=!likes[_currentPage];
                                  movies[_currentPage].reference.update(
                                    {'like':likes[_currentPage]}
                                  );
                                });
                              },
                            ),
                      Text(
                        '내가 찜한 콘텐츠',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: FlatButton(
                        color: Colors.white,
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.play_arrow,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3),
                            ),
                            Text(
                              '재생',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ))),
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute<Null>(
                            fullscreenDialog: true,
                            builder:(BuildContext context){
                              return DetailScreen(
                                movie:movies[_currentPage],
                              );
                            }
                          ));
                        },
                      ),
                      Text(
                        '정보',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: makeIndicator(likes, _currentPage)),
          ),

        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(
      Container(
        width: 8,
        height: 8,
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == i
              ? Color.fromRGBO(255, 255, 255, 0.9)
              : Color.fromRGBO(255, 255, 255, 0.4),
        ),
      ),
    );
  }
  return results;
}
