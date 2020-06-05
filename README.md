# CGRectFit

_CGRectFit_ provides extensions for `CGRect` and `CGSize` to calculate _aspect fit_ and _aspect fill_.

```swift
// aspect fit
subview.frame.fit(to: superview.bounds)

// aspect fill
subview.frame.fill(superview.bounds)
```

## Usage

### `CGSize`

Examples of aspect fit to `(width: 100, height: 100)` and aspect fill to `(width: 200, height: 200)`.

```swift
// Static methods
let size = CGSize(width: 200, height: 100)
let aspectFit = CGSize.fitting(to: size, ofAspectRatio: 1)
let aspectFill = CGSize.filling(size, ofAspectRatio: 1)

// Methods
let size1 = CGSize(width: 10, height: 10)
let size2 = CGSize(width: 200, height: 100)
let aspectFit = size1.fitting(to: size2)
let aspectFill = size1.filling(size2)

// `mutating func`
var size1 = CGSize(width: 10, height: 10)
let size2 = CGSize(width: 200, height: 100)
size1.fit(to: size2)
size1.fill(size2)
```

### `CGRect`

Examples of aspect fit to `(x: 150, y: 100, width: 100, height: 100)` and aspect fill to `(x: 100, y: 50, width: 200, height: 200)`.

```swift
// Static methods
let rect = CGRect(x: 100, y: 100, width: 200, height: 100)
let aspectFit = CGRect.fitting(to: rect, ofAspectRatio: 1)
let aspectFill = CGRect.filling(rect, ofAspectRatio: 1)

// Methods
let rect1 = CGRect(x: 0, y: 0, width: 10, height: 10)
let rect2 = CGRect(x: 100, y: 100, width: 200, height: 100)
let aspectFit = rect1.fitting(to: rect2)
let aspectFill = rect1.filling(rect2)

// `mutating func`
var rect1 = CGRect(x: 0, y: 0, width: 10, height: 10)
let rect2 = CGRect(x: 100, y: 100, width: 200, height: 100)
rect1.fit(to: rect2)
rect1.fill(rect2)
```

## License

[MIT](LICENSE)
