import 'package:equatable/equatable.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();
}

class PageChangedEvent extends OnboardingEvent {
  final int pageIndex;

  const PageChangedEvent(this.pageIndex);

  @override
  List<Object> get props => [pageIndex];
}
