import 'package:ecommerce_app/src/core/utils/app_colors.dart';
import 'package:ecommerce_app/src/features/home/data/models/onboarding_model.dart';
import 'package:ecommerce_app/src/features/home/presentation/app_routes.dart';
import 'package:ecommerce_app/src/features/home/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:ecommerce_app/src/features/home/presentation/blocs/onboarding/onboarding_event.dart';
import 'package:ecommerce_app/src/features/home/presentation/blocs/onboarding/onboarding_state.dart';
import 'package:ecommerce_app/src/features/home/presentation/views/on_boarding/onboarding_page.dart';
import 'package:ecommerce_app/src/features/home/presentation/widgets/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingView extends StatelessWidget {
  final PageController _controller = PageController();

  OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<OnboardingBloc, OnboardingState>(
            builder: (context, state) {
              return PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                onPageChanged: (index) {
                  context
                      .read<OnboardingBloc>()
                      .add(PageChangedEvent(index));
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return OnboardingPage(data: onboardingData[index]);
                },
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: BlocBuilder<OnboardingBloc, OnboardingState>(
              builder: (context, state) {
                int currentPage = (state is OnboardingPageState)
                    ? state.currentPage
                    : 0;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (currentPage != onboardingData.length - 1)
                      CustomButton(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        color: AppColors.onBackgroundLight,
                        onPressed: () {
                          _controller.jumpToPage(onboardingData.length - 1);
                        },
                        text: 'SKIP',
                      ),
                    if (currentPage == onboardingData.length - 1)
                      CustomButton(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                        color: AppColors.onBackgroundLight,
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, 
                          AppRoutes.signup, 
                          (Route<dynamic> route) => false,
                          );
                        },
                        text: 'GET STARTED',
                      ),
                    Row(
                      children: List.generate(onboardingData.length, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: currentPage == index
                                ? AppColors.primaryLight
                                : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
