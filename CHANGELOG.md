## [2.1.1]
  - add: shield with the pub version
  - fix: assert condition in the Onboarding widget when calling .of
  - fix: update readme to demo the null-safety.
  - fix: check for null in the example instead of '!'

## [2.1.0]

  - add: handling arrows on the label box
  - add: default arrow height
  - add: exports for the LabelPainter and the ArrowPosition enum
  - add: docs
  - change: the label box styling it is now a custom painter
  - change: use flutter_lints from now on
  - change: replace Container with SizeBox where possible
  - change: the position of the Label when the overlay is not full screen
  - change: update example app to demo the label box arrows


## [2.0.1+1] - add visual demo (gif).

## [2.0.1] - formatting.

## [2.0.0] - Migrate to null safety.

- internal restructure

## [1.0.0] - Initial release.

- change: rename library
- change: use Overlay instead of Navigator to show the onboarding
- change: use the Onboarding as ancestor widget instead of method call onboard
- change: position the label title and bodyText with Positioned widget
- add: possibility to add rounded overlay
- add: possibility to add title and body and be able to style them
- add: possibility to change the overlay color
- add: possibility to listen to onChange and onEnd callbacks
- add: possibility to start from arbitrary initial index
- add: possibility to show the onboarding only with a partial set of the steps
- remove: control via stream
- remove: unfinished callbacks on steps
- remove: usage of Label painter

## [0.0.1] - Forked from [onboard_overlay](https://github.com/lucaslcode/onboard_overlay)
