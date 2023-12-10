enum ButtonSize {
  small,
  xSmall,
  normal,
  large,
  xlarge
}

extension ButtonSizeExtension on ButtonSize {
  double get height {
    switch (this) {
      case ButtonSize.small:
        return 30;
      case ButtonSize.xSmall:
        return 32;
      case ButtonSize.normal:
        return 35;
      case ButtonSize.large:
        return 39;
      case ButtonSize.xlarge:
        return 42;
    }
  }
}
