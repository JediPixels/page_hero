# Hero Animation and PageRouteBuilder
## Video Tutorial
[YouTube Video](https://youtu.be/EtImGX-5xvI)

[Blog](https://jedipixels.dev/flutter-hero-widget-and-pageroutebuilder-animation)

![](readmeassets/hero-animation-ios.gif)
## Using Hero, Navigator and PageRouteBuilder to create custom Transitions
In this project, you are going to take a look at:
- How `Hero` animation allows a widget transition to fly into place from one page to another
- How to use the `PageRouteBuilder` to create custom navigation transitions with `Hero` animation

## Hero Widget
The `Hero` widget is a great out-of-the-box animation to convey the navigation action of a widget flying into place from one page to another. The `Hero` animation is a shared element transition (animation) between two different pages.

To visualize the animation, imagine seeing a superhero flying into action. For example, you have a list of journal entries with a photo thumbnail, the user selects an entry, and you see the photo thumbnail transition to the detail page by moving and growing to full size. The photo thumbnail is the superhero, and when tapped, it flies into action by moving from the list page to the detail page and lands perfectly on the correct location at the top of the detail page showing the full photo. When the detail page is dismissed, the Hero widget flies back to the original page, position, and size.

## Hero Widget Code
The `Hero` widget has the animation features built in; there’s no need to write custom code to handle the size and animation between pages.

The `Hero` child widget is marked for hero animation. When the `Navigator` pushes or pops a `PageRoute`, the entire screen’s content is replaced. This means during the animation transition the `Hero` widget is not shown in the original position in both the old and new routes, but it moves and resizes from one page to another. Very important, each `Hero` tag must be unique and match on both the originating and landing pages.

```dart
// Home Page
Hero(
  tag: 'image',
  child: Image.asset('assets/image.png'),
)
```

```dart
// Details page
Hero(
  tag: 'image',
  child: Image.asset('assets/image.png'),
)
```

## PageRouteBuilder
The `PageRouteBuilder` class is used to create custom route transitions.
`PageRouteBuilder` provides an `Animation` object. This `Animation` can be used with `Tween` and `Curve` objects to customize the transition animation. 

You need to define a `pageBuilder` function to create the route's content and define the `transitionBuilder` function to add transition animation.

```dart
Navigator.of(context).push(
  PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 1000),
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Details();
    },
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) {
      return Align(
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  ),
);
```

## How it Works

### Hero Widget 
The hero animation is a powerful built-in animation to convey an action by automatically animating a widget from one page to another to the correct size and position. When you navigate back to the previous page, the `Hero` animates back to the original position. Each `Hero` tag must be unique and match on both the originating and landing pages.

### Navigator PageRouteBuilder 
The `PageRouteBuilder` class is used to create custom route transitions.
`PageRouteBuilder` provides an ``Animation`` object. This `Animation` can be used with `Tween` and `Curve` objects to customize the transition animation.

## [License: MIT](LICENSE.md)
