//interface for implementing an animation class that
//depend on third party package
//--ensure an easy modification
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

abstract class AnimationService {
  List<Widget> animateFadeEffect(
      List<Widget> children, double intervalInMilSec, double durationInMilSec);
  List<Widget> animateBlurEffect(
      List<Widget> children, double intervalInMilSec, double durationInMilSec);

  Widget fadeOutIn(Widget child, double durationInMilSec, String? key,
      ScrollController? scrollController);

  Widget scrollAdapterAnimation(
      Widget child, ScrollController scrollController);
}

extension WidgetAnimationServiceEx on Widget {
  Widget fadeOutIn(
      {double durationInMilSec = 600,
      String? key,
      ScrollController? scrollController}) {
    final service = GetIt.instance<AnimationService>();
    return service.fadeOutIn(this, durationInMilSec, key, scrollController);
  }
}

extension WidgetsAnimationServiceEx on List<Widget> {
  List<Widget> animateFadeEffect(
      {double intervalInMilSec = 400, double durationInMilSec = 300}) {
    final service = GetIt.instance<AnimationService>();
    return service.animateFadeEffect(this, intervalInMilSec, durationInMilSec);
  }

  List<Widget> animateBlurEffect(
      {double intervalInMilSec = 400, double durationInMilSec = 300}) {
    final service = GetIt.instance<AnimationService>();
    return service.animateFadeEffect(this, intervalInMilSec, durationInMilSec);
  }
}

extension ScrollAnimationServiceEx<T extends ScrollView> on T {
  Widget scrollAdapterAnimation({required ScrollController scrollController}) {
    final service = GetIt.instance<AnimationService>();
    return service.scrollAdapterAnimation(this, scrollController);
  }
}
