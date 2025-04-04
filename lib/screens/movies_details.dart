import 'package:flutter/material.dart';
import 'package:movies_app/constants/my_app_icons.dart';
import 'package:movies_app/model/movies_model.dart';
import 'package:movies_app/widgets/cashed_image.dart';
import 'package:movies_app/widgets/movies/generes_list_widget.dart';

class MoviesDetails extends StatelessWidget {
  const MoviesDetails({super.key, required this.movieModel});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Hero(
              tag: movieModel.id,
              child: CashedImage(
                imgHeight: size.height * .7,
                imgWidth: size.width,
                imgUrl:
                    "https://image.tmdb.org/t/p/w500/${movieModel.posterPath}",
                radiosImg: 0,
              ),
            ),

            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 236, 236),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MyAppIcons.bakcArrow,
                ),
              ),
            ),

            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.height * .6),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Material(
                          color: const Color.fromARGB(255, 236, 236, 236),
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movieModel.originalTitle,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        MyAppIcons.star,
                                        Text(
                                          "${movieModel.voteAverage.toStringAsFixed(1)}/10",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    ),

                                    Text(
                                      movieModel.releaseDate,
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                GeneresListWidget(
                                  sized: size.width * .8,
                                  movieModel: movieModel,
                                ),
                                SizedBox(height: 15),
                                Text(
                                  movieModel.overview,
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: -10,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 236, 236, 236),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: MyAppIcons.favIcon,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
