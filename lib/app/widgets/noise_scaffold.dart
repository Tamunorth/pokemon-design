import 'package:flutter/material.dart';
import 'package:pokebook/gen/assets.gen.dart';

class NoiseScaffold extends StatelessWidget {
  const NoiseScaffold({
    required this.body,
    super.key,
    this.appBar,
    this.bottomNavigationBar,
  });

  final Widget body;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.images.noiseBackground.path,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
