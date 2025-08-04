import 'package:figma_squircle/figma_squircle.dart';

const double appbarRightPadding = 24;

const Duration animationDuration = Duration(milliseconds: 700);
const Duration animationDelay = Duration(milliseconds: 500);
const Duration pageTransitionDuration = Duration(milliseconds: 500);

///
const Duration pageSwitchAnimation = Duration(milliseconds: 600);
const Duration pageReverseSwitchAnimation = Duration(milliseconds: 400);

///Corner radius
SmoothRadius _getSmoothRadius(double radius, double cornerSmoothing) {
  return SmoothRadius(
    cornerRadius: radius,
    cornerSmoothing: cornerSmoothing,
  );
}

SmoothRadius kSmoothRadius(double radius, {double cornerSmoothing = 0.5}) =>
    _getSmoothRadius(radius, cornerSmoothing);

///ZERO
SmoothBorderRadius kSmoothBorderRadiusZero = SmoothBorderRadius.zero;

///ALL
SmoothBorderRadius kRadiusAll(double value, {double cornerSmoothing = 0.5}) {
  return SmoothBorderRadius.all(_getSmoothRadius(value, cornerSmoothing));
}

SmoothBorderRadius kRadiusTopLeftRight(double value,
    {double cornerSmoothing = 0.5}) {
  return SmoothBorderRadius.only(
    topRight: _getSmoothRadius(value, cornerSmoothing),
    topLeft: _getSmoothRadius(value, cornerSmoothing),
  );
}

SmoothBorderRadius kRadiusBottomLeftRight(double value,
    {double cornerSmoothing = 0.5}) {
  return SmoothBorderRadius.only(
    bottomLeft: _getSmoothRadius(value, cornerSmoothing),
    bottomRight: _getSmoothRadius(value, cornerSmoothing),
  );
}

SmoothBorderRadius kRadiusOnlyTopLeft(double value,
    {double cornerSmoothing = 0.5}) {
  return SmoothBorderRadius.only(
    topLeft: _getSmoothRadius(value, cornerSmoothing),
  );
}

SmoothBorderRadius kRadiusOnlyTopRight(double value,
    {double cornerSmoothing = 0.5}) {
  return SmoothBorderRadius.only(
    topRight: _getSmoothRadius(value, cornerSmoothing),
  );
}

SmoothBorderRadius kRadiusLeftTopBottom(double value,
    {double cornerSmoothing = 0.5}) {
  return SmoothBorderRadius.only(
    topLeft: _getSmoothRadius(value, cornerSmoothing),
    bottomLeft: _getSmoothRadius(value, cornerSmoothing),
  );
}

SmoothBorderRadius kRadiusRightTopBottom(double value,
    {double cornerSmoothing = 0.5}) {
  return SmoothBorderRadius.only(
    topRight: _getSmoothRadius(value, cornerSmoothing),
    bottomRight: _getSmoothRadius(value, cornerSmoothing),
  );
}

SmoothBorderRadius kRadiusOnlyBottomRight(double value,
    {double cornerSmoothing = 0.5}) {
  return SmoothBorderRadius.only(
    bottomRight: _getSmoothRadius(value, cornerSmoothing),
  );
}

SmoothBorderRadius kRadiusOnlyBottomLeft(double value,
    {double cornerSmoothing = 0.5}) {
  return SmoothBorderRadius.only(
    bottomLeft: _getSmoothRadius(value, cornerSmoothing),
  );
}
