import 'package:flutter/material.dart';
import 'package:movies_app/repository/movies_repo.dart';
import 'package:movies_app/screens/movies_screen.dart';
import 'package:movies_app/service/init_getit.dart';
import 'package:movies_app/service/navigation_service.dart';
import 'package:movies_app/widgets/my_err_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = true;
  String errorMessage = "";
  final _movieRepository = getIt<MoviesRepository>();

  Future<void> _loadData() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      await _movieRepository.fetchGenres();
      await getIt<NavigationService>().navigateReplace(MoviesScreen());
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          isLoading
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("is Loading ..."),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ),
              )
              : MyErrWidget(errText: errorMessage, errbtnonPress: _loadData),
    );
  }
}
