
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/models/heatmap_placement_provider.dart';
import 'package:habit_tracker/theme/theme_provider.dart';
import 'package:provider/provider.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            spacing: 24,
            children: [
              // dark mode switch
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.dark_mode,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      SizedBox(width: 12,),
                      Text(
                        "Dark Mode",
                        style: GoogleFonts.inter(
                          fontSize: 15.8,
                        ),
                      ),
                    ],
                  ),
                  
                  CupertinoSwitch(
                    value: Provider.of<ThemeProvider>(context).darkModeEnabled,
                    onChanged: (value) => 
                      Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
                    activeTrackColor: Colors.amber.shade600,
                  ),
                ]
              ),

              // heatmap placement switch
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.border_bottom,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      SizedBox(width: 12,),
                      Text(
                        "Place heatmap at the bottom",
                        style: GoogleFonts.inter(
                          fontSize: 15.8,
                        ),
                      ),
                    ],
                  ),
                  
                  CupertinoSwitch(
                    value: Provider.of<HeatmapPlacementProvider>(context).placedBottom,
                    onChanged: (value) => 
                      Provider.of<HeatmapPlacementProvider>(context, listen: false).togglePlacement(),
                    activeTrackColor: Colors.amber.shade600,
                  ),
                ]
              )
            ],
          ),
        ),
    );
  }
}