import 'package:flutter/material.dart';
import 'package:movies_app/constants/my_app_icons.dart';
import 'package:movies_app/model/movies_model.dart';
import 'package:movies_app/widgets/cashed_image.dart';
import 'package:movies_app/widgets/movies/favorite_btn.dart';
import 'package:movies_app/widgets/movies/generes_list_widget.dart';

class MoviesDetails extends StatelessWidget {
  final MovieModel movieModel;

  const MoviesDetails({super.key, required this.movieModel});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CashedImage(
              imgHeight: size.height * .7,
              imgWidth: size.width,
              imgUrl:
                  "https://image.tmdb.org/t/p/w500/${movieModel.backdropPath}",
              radiosImg: 0,
            ),
            Positioned(
              top: 5,
              left: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const BackButton(),
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
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movieModel.title,
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
                                          "${movieModel.voteCount}/10",
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
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            shape: BoxShape.circle,
                          ),
                          child: FavoriteBtn(movieModel: movieModel),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Positioned(
              top: 5,
              left: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const BackButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
