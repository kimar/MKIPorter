# MKIPorter

Gets you a random free TCP Port using C APIs

[![CI Status](http://img.shields.io/travis/Marcus Kida/MKIPorter.svg?style=flat)](https://travis-ci.org/Marcus Kida/MKIPorter)
[![Version](https://img.shields.io/cocoapods/v/MKIPorter.svg?style=flat)](http://cocoadocs.org/docsets/MKIPorter)
[![License](https://img.shields.io/cocoapods/l/MKIPorter.svg?style=flat)](http://cocoadocs.org/docsets/MKIPorter)
[![Platform](https://img.shields.io/cocoapods/p/MKIPorter.svg?style=flat)](http://cocoadocs.org/docsets/MKIPorter)

## Usage

You may use a Singleton Instance of MKIPorter to allocate a free TCP Port like this like this:

```
MKIPorter *porter = [MKIPorter sharedInstance];
NSError *error;
NSInteger port = [porter allocatePort:&error];
if (error) {
	NSLog(@"An error occured: %@", error);
	return;
}
NSLog(@"Free Port: %d", port);
```

## Requirements

## Installation

MKIPorter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "MKIPorter"

## Author

Marcus Kida, marcus@kida.io

## License

MKIPorter is available under the MIT license. See the LICENSE file for more info.

