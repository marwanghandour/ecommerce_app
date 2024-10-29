import 'package:ecommerce_app/src/core/utils/app_icons.dart';
import 'package:ecommerce_app/src/core/utils/app_strings.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/theme/theme_event.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/main_components/home_view_widgets.dart';
import 'package:ecommerce_app/src/features/presentation/widgets/navigation/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        logoUrl: AppStrings.appLogo,
        actions: [
          Container(
                        height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              shape: BoxShape.circle
            ),
            child: IconButton(
              icon: const Icon(AppIcons.switchtheme,size: 25,),
              onPressed: () {
                BlocProvider.of<ThemeBloc>(context).add(ToggleThemeEvent());
              },
            ),
          ),

          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              shape: BoxShape.circle
            ),
            child: IconButton(
              icon: const Icon(AppIcons.notification, size: 25,),
              onPressed: () {
              },
            ),
          ),
        ],
      ),
      body: const HomeViewWidgets(products: [],),
    );
  }
}
