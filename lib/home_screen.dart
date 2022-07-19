import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_ui/detail_screen.dart';
import 'package:movie_app_ui/movie_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a1b1a),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1a1b1a),
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Text(
          "MOVIES",
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: model.length,
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => DetailScreen(
                    movieModel: model[index],
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 15,
              ),
              height: 150,
              decoration: const BoxDecoration(
                color: Color(0xFF111010),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: CachedNetworkImage(
                      width: 120,
                      height: 150,
                      fit: BoxFit.fitHeight,
                      imageUrl: model[index].url,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 160,
                        child: Text(
                          model[index].title,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        model[index].date,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFf41f29),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
