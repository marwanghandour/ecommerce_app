class OnboardingData {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingData({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

const List<OnboardingData> onboardingData = [
  OnboardingData(
    imagePath: 'assets/images/onboarding.png',
    title: 'Welcome to EcoMart',
    description: 'Dive into a world of exclusive deals and seamless shopping. Discover products tailored just for you.',
  ),
  OnboardingData(
    imagePath: 'assets/images/onboarding2.png',
    title: 'Stay Ahead with Flash Sales ',
    description: 'Never miss a bargain! Get instant notifications on flash sales and limited-time offers. Your savings start here.',
  ),
  OnboardingData(
    imagePath: 'assets/images/onvoarding3.png',
    title: 'Your Cart, Anytime, Anywhere',
    description: 'Start shopping now and save your favorite items. Access your cart from any device, anytime.',
  ),
];
