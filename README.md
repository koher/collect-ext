# CollectExt

_CollectExt_ provides some convenient extensions for Swift's `Collection`s.

```swift
let range: Range<Date> = ...
let items = history
    .dropLast(while: { $0.date >= range.upperBound })
    .suffix(while: { $0.date >= range.lowerBound })
```

## License

[MIT](License)
