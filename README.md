# ThenAnimatable

Design and prototype customized UI, interaction, navigation, transition and animation for App Store ready Apps in Interface Builder with ThenAnimatable.
Fork with [IBAnimatable](https://github.com/IBAnimatable/IBAnimatable.git)


## How to install
### Manually install

Copy and paste `ThenAnimatable` folder in your Xcode project.

### [Swift package manager](https://swift.org/package-manager)
To integrate using Apple's Swift package manager, add the following as a dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/ghostcrying/ThenAnimatable.git", .upToNextMajor(from: "0.0.1"))
```

### [CocoaPods](https://cocoapods.org)
Add the following entry in your Podfile:

```ruby
   pod 'ThenAnimatable'
```

### [Carthage](https://github.com/Carthage/Carthage)
Add the following entry in your Cartfile:

```
   github "ghostcrying/ThenAnimatable"
```

### [Accio](https://github.com/JamitLabs/Accio)
Add the following entry in your Package.swift:

```swift
.package(url: "https://github.com/ghostcrying/ThenAnimatable.git", .upToNextMajor(from: "0.0.1")),
```

Next, add `ThenAnimatable` to your App targets dependencies like so:

```swift
.target(
    name: "App",
    dependencies: [
        "ThenAnimatable",
    ]
),
```

## How to animate programmatically
As you saw above, we can prototype an App fully in Interface Builder without a single line of code, but `ThenAnimatable` also provides APIs to let us fully control the UI and animations. `ThenAnimatable` provides simple promise-like APIs. We can easily call them in one line.

```swift
view.animate(.pop(repeatCount: 1)) // pop animation for the view
view.animate(.squeezeFade(way: .in, direction: .left)) // squeeze and fade in from left animation
```

You can play around with all these predefined animations in the [Swift playground Page - Predefined Animations](ThenAnimatable.playground/Pages/Predefined%20Animations.xcplaygroundpage)

### Animation properties
There are some properties we can change to customize the animation. What we need to do is to pass the parameters to `animate()` method to start the animation.

```swift
view.animate(.squeeze(way: .in, direction: .left), duration: 1, damping: 1, velocity: 2, force: 1)
```

You can play around with all animations with different parameters in the [Swift playground Page - Animation Properties](ThenAnimatable.playground/Pages/Animation%20Properties.xcplaygroundpage)

### Chaining animations
Sometimes, we need to run more animation after the previous one. With `ThenAnimatable`, we can easily use promise-like API to chain all animations together to provide a sleek user experience.

```swift
// We can chain the animations together, it is the source code of animated GIF in "Animate in Swift playground" section
view.animate(.squeezeFade(way: .in, direction: .down))
    .then(.pop(repeatCount: 1))
    .then(.shake(repeatCount: 1))
    .then(.squeeze(way: .in, direction: .down))
    .then(.wobble(repeatCount: 1))
    .then(.flip(along: .x))
    .then(.flip(along: .y))
    .then(.slideFade(way: .out, direction: .down))
```

### Delaying animations
We can use `delay` method to delay the next animation.

```swift
view.animate(.squeeze(way: .in, direction: .left))
    .delay(0.5)
    .then(.shake(repeatCount: 3))
```

We can also delay the first animation.

```swift
view.delay(2)
    .then(.squeeze(way: .in, direction: .left))
```

### Completion handler
We can add a completion handler/closure to execute when all animations are completed.

```swift
view.animate(.squeeze(way: .in, direction: .left))
    .completion { print("Animations finished!") }
```


## License
`ThenAnimatable` is released under the MIT license. See [LICENSE](LICENSE) for details.

