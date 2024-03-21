import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:pokebook/app/constants/custom_extensions.dart';
import 'package:pokebook/app/constants/pallets.dart';
import 'package:pokebook/app/cubit/theme_cubit.dart';
import 'package:pokebook/gen/assets.gen.dart';
import 'package:pokebook/l10n/l10n.dart';

class ThemeDialog extends HookWidget {
  const ThemeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              context.l10n.chooseTheme,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          BlocBuilder<ThemeCubit, Color>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ThemeSelector(
                      color: Pallets.blueColor,
                      selected: state == Pallets.blueColor,
                      onTap: () {
                        context
                            .read<ThemeCubit>()
                            .updateTheme(Pallets.blueColor);
                      },
                    ),
                    ThemeSelector(
                      color: Pallets.redColor,
                      selected: state == Pallets.redColor,
                      onTap: () {
                        context
                            .read<ThemeCubit>()
                            .updateTheme(Pallets.redColor);
                      },
                    ),
                    ThemeSelector(
                      color: Pallets.yellowColor,
                      selected: state == Pallets.yellowColor,
                      onTap: () {
                        context
                            .read<ThemeCubit>()
                            .updateTheme(Pallets.yellowColor);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({
    super.key,
    required this.color,
    required this.selected,
    this.onTap,
    this.radius = 68.0,
  });

  final Color color;
  final bool selected;
  final double radius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: radius,
            height: radius,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: selected
                  ? Border.all(
                      color: context.theme.hintColor,
                    )
                  : null,
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Container(
                width: radius - 10,
                height: radius - 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
