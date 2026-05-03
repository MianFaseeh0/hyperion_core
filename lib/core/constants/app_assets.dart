class AppAssets {
  static const String appLogo = 'packages/holaride_core/assets/svgs/app_logo.svg';
  static const String driverAppLogo = 'packages/holaride_core/assets/svgs/driver_app_logo.svg';
  static const String bike = 'packages/holaride_core/assets/svgs/bike-motorcycle-icon.svg';
  static const String rideABike = 'packages/holaride_core/assets/images/ride-a-bike.png';
  static const String getARideLottie = 'packages/holaride_core/assets/lottie/Old Rider.json';
  static const String customerEnv = 'packages/holaride_core/.env';

  static String getOnboardingSVG({required int index}) {
    return 'packages/holaride_core/assets/svgs/customer_onboarding_$index.svg';
  }
}
