import 'package:equatable/equatable.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();
}

class OnboardingInitial extends OnboardingState {
  @override
  List<Object> get props => [];
}

class OnboardingPageState extends OnboardingState {
  final int currentPage;

  const OnboardingPageState(this.currentPage);

  @override
  List<Object> get props => [currentPage];
}
