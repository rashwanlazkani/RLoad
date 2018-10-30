# RLoad

[![CI Status](https://img.shields.io/travis/rashwanlazkani/RLoad.svg?style=flat)](https://travis
ci.org/rashwanlazkani/RLoad)
[![Version](https://img.shields.io/cocoapods/v/RLoad.svg?style=flat)](https://cocoapods.org/pods/RLoad)
[![License](https://img.shields.io/cocoapods/l/RLoad.svg?style=flat)](https://cocoapods.org/pods/RLoad)
[![Platform](https://img.shields.io/cocoapods/p/RLoad.svg?style=flat)](https://cocoapods.org/pods/RLoad)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

![](https://media.giphy.com/media/1fhHiqdwEdl6c2An7q/giphy.gif)

## Requirements

## Installation

RLoad is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RLoad'
```

There are four methods you can use:

<h5>create(x: CGFloat, y: CGFloat, radius: CGFloat, begin: Bool)</h5>

Creates the indicator. Four parameters:

```
x: x-position of the indicator
y: y-position of the indicator
radis: radius of the indicator
begin: if you want to indicator to start
```

<h5>start()</h5>
Starts the indicator
<h5>stop()</h5>
Stops the indicator
<h5>remove()</h5>
Removes the indicator from your view

<h4>To quickly get started, simply just add the following:</h4>

```
let rload = RLoadIndicator()
rload.create(x: view.frame.midX - 50, y: view.frame.midY - 50, radius: 50, begin: true)
view.addSubview(rload)
```

Your´re able to change the colors by either:

```
Adding additional colors:
rload.colors.append(.gray)

Or adding a new list:
rload.colors = [.green, .gray, .magenta]
```

## Author

rashwanlazkani, rashwan87@gmail.com

## License

RLoad is available under the MIT license. See the LICENSE file for more info.
