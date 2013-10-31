# HLLFont

Set UIFont style(Bold,Italic,Light,Oblique and combo).

* HLLFont extends UIFont using category.
* Use 1 method to set style
* Use combo style, like (BoldOblique)
* If not find font, return nil.

```objective-c
+ (UIFont*)fontWithFont:(UIFont*)font style:(NSString*)style.
```

## Installation

### From CocoaPods

Add `pod 'HLLFont'` to your Podfile or `pod 'HLLFont', :head` if you're feeling adventurous.

### Manually

_**Important note if your project doesn't use ARC**: you must add the `-fobjc-arc` compiler flag to `UIFont+HLLFont.m` in Target Settings > Build Phases > Compile Sources._

* Drag the `HLLFont` folder into your project.
* Import `UIFont+HLLFont.h`

## Usage

(see sample Xcode project in `/HLLFontDemo`)

### Setting Font Bold Style

```objective-c
font=[UIFont fontWithFont:font style:UIFONT_BOLD];
```

### Setting Font Combo Style

_**For exmaple:setting combo style with bold and oblique**

```objective-c
font=[UIFont fontWithFont:font style:[UIFONT_BOLD stringByAppendingString:UIFONT_OBLIQUE]];
```
