# FPGSilentLogger

[![CI Status](http://img.shields.io/travis/fpg1503/FPGSilentLogger.svg?style=flat)](https://travis-ci.org/Francesco Perrotti-Garcia/FPGSilentLogger)
[![Version](https://img.shields.io/cocoapods/v/FPGSilentLogger.svg?style=flat)](http://cocoapods.org/pods/FPGSilentLogger)
[![License](https://img.shields.io/cocoapods/l/FPGSilentLogger.svg?style=flat)](http://cocoapods.org/pods/FPGSilentLogger)
[![Platform](https://img.shields.io/cocoapods/p/FPGSilentLogger.svg?style=flat)](http://cocoapods.org/pods/FPGSilentLogger)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### What is FPGSilentLogger?
FPGSilentLogger logs all generated erros and view controller lifecycle automatically! 

### How does it work?
By swizzling methods of our interest all instances of `NSError` and `UIViewController` are magically logged! We use [`JRSwizzle`](https://github.com/rentzsch/jrswizzle) so you are sure that *this package Does The Right Thing&trade;*.

### Customization
Simply conform to `FPGLoggerDelegate` and call `+ [FPGLogger setDelegate:]` with your conformant object!

```objective-c
#pragma mark - FPGLoggerDelegate
- (void)logString:(nonnull NSString *)string {
    CLS_Log(@"%@", string);
}

- (nullable NSString *)logPrefix {
    return @"[FPG] ";
}
```

## Installation

FPGSilentLogger is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "FPGSilentLogger"
```

## Author

Francesco Perrotti-Garcia, fpg1503@gmail.com

## License

FPGSilentLogger is available under the MIT license. See the LICENSE file for more info.
