import 'package:flutter/material.dart';
import 'package:movies_app/constants/my_app_icons.dart';
import 'package:movies_app/model/movies_model.dart';
import 'package:movies_app/screens/movies_details.dart';
import 'package:movies_app/service/init_getit.dart';
import 'package:movies_app/service/navigation_service.dart';
import 'package:movies_app/widgets/cashed_image.dart';
import 'package:movies_app/widgets/movies/favorite_btn.dart';
import 'package:movies_app/widgets/movies/generes_list_widget.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({super.key, required this.movieModel});

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: InkWell(
        onTap:
            () => getIt.get<NavigationService>().navigate(
              MoviesDetails(movieModel: movieModel),
            ),
        child: SizedBox(
          height: size.height * 0.25,
          width: size.width * 0.8, // تعیین عرض SizedBox
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: movieModel.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CashedImage(
                    imgUrl:
                        "https://image.tmdb.org/t/p/w500${movieModel.posterPath}",
                    radiosImg: 10,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieModel.originalTitle,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      MyAppIcons.star,
                      Text(
                        "${movieModel.voteAverage.toStringAsFixed(1)}/10",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  GeneresListWidget(
                    sized: size.width * 0.5,
                    movieModel: movieModel,
                  ),
                  Row(
                    children: [
                      SizedBox(child: MyAppIcons.time),
                      Text(
                        movieModel.releaseDate,
                        style: TextStyle(color: Colors.blueGrey, fontSize: 10),
                      ),
                      SizedBox(width: size.width * 0.25),
                      FavoriteBtn(movieModel: movieModel),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
