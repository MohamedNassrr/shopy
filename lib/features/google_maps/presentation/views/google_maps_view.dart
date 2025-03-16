import 'package:flutter/material.dart';
import 'widgets/google_maps_view_body.dart';

class GoogleMapsView extends StatelessWidget {
  const GoogleMapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: GoogleMapsViewBody()),
    );
  }
}
