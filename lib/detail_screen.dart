import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_ui/movie_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.movieModel,
  }) : super(key: key);

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: movieModel.youtubeId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        hideControls: true,
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            imageUrl: movieModel.url,
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            leading: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
            actions: const [
              Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 15,
              )
            ],
          ),
          Positioned(
            top: 220,
            left: 22,
            child: SizedBox(
              width: 350,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: YoutubePlayer(
                  controller: controller,
                  liveUIColor: Colors.amber,
                ),
              ),
            ),
          ),
          Positioned(
              top: 485,
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black38,
                ),
                child: Text(
                  movieModel.desc,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
