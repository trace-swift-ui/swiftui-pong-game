# Pong Game for iOS

This iOS app is a simple Pong game built using SwiftUI and Combine. The app features a black background with two white paddles on either side and a white ball that bounces between them. The left paddle moves automatically to follow the ball, while the right paddle can be controlled by the user through touch gestures.

![App Preview](https://login.trace.zip/storage/v1/object/public/trace/f8ca39ab-2853-4efb-913f-0988562e748a.png)

This app was built using [Trace AI](https://trace.zip), and you can demo this particular project at [https://trace.zip/c/f8ca39ab-2853-4efb-913f-0988562e748a](https://trace.zip/c/f8ca39ab-2853-4efb-913f-0988562e748a).

## Building the App

To build the app, follow these steps:

1. Clone the repository to your local machine.
2. Open the Xcode project file.
3. Build and run the app on an iOS simulator or a physical device.

## App Structure

The app's primary view is `ContentView`, which contains the following elements:

- A black background that ignores safe area edges.
- Two white paddles (left and right) represented by `Rectangle` views.
- A white ball represented by a `Circle` view.

The left paddle's position is updated automatically to follow the ball's vertical position, while the right paddle's position can be controlled by the user through touch gestures.

The ball's position and direction are updated using a timer that fires every 0.1 seconds. The ball bounces off the screen edges and the paddles, reversing its direction when a collision occurs.

## Acknowledgements

This app was generated using [Trace AI](https://trace.zip).
