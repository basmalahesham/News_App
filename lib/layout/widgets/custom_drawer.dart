import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/theme/app_theme.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: media.height * 0.2,
            color: AppTheme.primaryColor,
            child: Text(
              'News App!',
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          //SizedBox(height: 30,),
          GestureDetector(
            onTap: () {
              // if (onPressed != null) {
              //   onPressed!();
              // }
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 18),
              child: ListTile(
                title: Text(
                  'Categories',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                leading: const Icon(
                  Icons.list,
                  size: 40,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                title: Text(
                  'Settings',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                leading: const Icon(
                  Icons.settings,
                  size: 40,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
