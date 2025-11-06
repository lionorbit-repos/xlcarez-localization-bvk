import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

import '../carousel_controller/flutter_carousel_controller.dart';
import '../enums/carousel_page_changed_reason.dart';
import '../enums/center_page_enlarge_strategy.dart';
import '../indicators/slide_indicator.dart';
import 'base_carousel_options.dart';

/// The [FlutterCarouselOptions] class extends [BaseCarouselOptions] and
/// adds more configuration options specific to the [FlutterCarousel] widget.
class FlutterCarouselOptions extends BaseCarouselOptions {
  FlutterCarouselOptions({
    this.controller,
    this.height,
    super.aspectRatio,
    super.viewportFraction,
    super.initialPage,
    super.enableInfiniteScroll,
    super.reverse,
    super.autoPlay,
    super.autoPlayInterval,
    super.autoPlayAnimationDuration,
    super.autoPlayCurve,
    super.onPageChanged,
    super.onScrolled,
    super.physics,
    super.scrollDirection,
    super.pauseAutoPlayOnTouch,
    super.pauseAutoPlayOnManualNavigate,
    super.pauseAutoPlayInFiniteScroll,
    super.pageViewKey,
    super.keepPage,
    super.showIndicator,
    super.floatingIndicator,
    super.indicatorMargin,
    super.slideIndicator,
    super.clipBehavior,
    super.scrollBehavior,
    super.pageSnapping,
    super.padEnds,
    super.dragStartBehavior,
    super.allowImplicitScrolling,
    super.restorationId,
    super.enlargeCenterPage,
    super.enlargeFactor,
    super.enlargeStrategy,
    super.disableCenter,
  })  : assert(height == null || height > 0.0,
            'height must be a non-negative double');

  /// Set carousel height and overrides any existing [aspectRatio].
  final double? height;

  /// A [MapController], used to control the map.
  final FlutterCarouselController? controller;

  /// Copy With Constructor
  FlutterCarouselOptions copyWith({
    FlutterCarouselController? controller,
    double? height,
    double? aspectRatio,
    double? viewportFraction,
    int? initialPage,
    bool? enableInfiniteScroll,
    bool? reverse,
    bool? autoPlay,
    Duration? autoPlayInterval,
    Duration? autoPlayAnimationDuration,
    Curve? autoPlayCurve,
    Axis? scrollDirection,
    Function(int index, CarouselPageChangedReason reason)? onPageChanged,
    ValueChanged<double?>? onScrolled,
    ScrollPhysics? physics,
    bool? pageSnapping,
    bool? pauseAutoPlayOnTouch,
    bool? pauseAutoPlayOnManualNavigate,
    bool? pauseAutoPlayInFiniteScroll,
    PageStorageKey<dynamic>? pageViewKey,
    bool? enlargeCenterPage,
    double? enlargeFactor,
    CenterPageEnlargeStrategy? enlargeStrategy,
    bool? disableCenter,
    SlideIndicator? slideIndicator,
    bool? showIndicator,
    bool? floatingIndicator,
    double? indicatorMargin,
    bool? keepPage,
    bool? padEnds,
    Clip? clipBehavior,
    DragStartBehavior? dragStartBehavior,
    ScrollBehavior? scrollBehavior,
    bool? allowImplicitScrolling,
    String? restorationId,
  }) {
    return FlutterCarouselOptions(
      controller: controller ?? this.controller,
      height: height ?? this.height,
      aspectRatio: aspectRatio ?? this.aspectRatio,
      viewportFraction: viewportFraction ?? this.viewportFraction,
      initialPage: initialPage ?? this.initialPage,
      enableInfiniteScroll: enableInfiniteScroll ?? this.enableInfiniteScroll,
      reverse: reverse ?? this.reverse,
      autoPlay: autoPlay ?? this.autoPlay,
      autoPlayInterval: autoPlayInterval ?? this.autoPlayInterval,
      autoPlayAnimationDuration:
          autoPlayAnimationDuration ?? this.autoPlayAnimationDuration,
      autoPlayCurve: autoPlayCurve ?? this.autoPlayCurve,
      onPageChanged: onPageChanged ?? this.onPageChanged,
      onScrolled: onScrolled ?? this.onScrolled,
      physics: physics ?? this.physics,
      pageSnapping: pageSnapping ?? this.pageSnapping,
      scrollDirection: scrollDirection ?? this.scrollDirection,
      pauseAutoPlayOnTouch: pauseAutoPlayOnTouch ?? this.pauseAutoPlayOnTouch,
      pauseAutoPlayOnManualNavigate:
          pauseAutoPlayOnManualNavigate ?? this.pauseAutoPlayOnManualNavigate,
      pauseAutoPlayInFiniteScroll:
          pauseAutoPlayInFiniteScroll ?? this.pauseAutoPlayInFiniteScroll,
      pageViewKey: pageViewKey ?? this.pageViewKey,
      keepPage: keepPage ?? this.keepPage,
      enlargeCenterPage: enlargeCenterPage ?? this.enlargeCenterPage,
      enlargeFactor: enlargeFactor ?? this.enlargeFactor,
      enlargeStrategy: enlargeStrategy ?? this.enlargeStrategy,
      disableCenter: disableCenter ?? this.disableCenter,
      showIndicator: showIndicator ?? this.showIndicator,
      floatingIndicator: floatingIndicator ?? this.floatingIndicator,
      indicatorMargin: indicatorMargin ?? this.indicatorMargin,
      slideIndicator: slideIndicator ?? this.slideIndicator,
      padEnds: padEnds ?? this.padEnds,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      dragStartBehavior: dragStartBehavior ?? this.dragStartBehavior,
      scrollBehavior: scrollBehavior ?? this.scrollBehavior,
      allowImplicitScrolling:
          allowImplicitScrolling ?? this.allowImplicitScrolling,
      restorationId: restorationId ?? this.restorationId,
    );
  }
}
