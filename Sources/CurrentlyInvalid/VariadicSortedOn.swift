//
//  VariadicSortedOn.swift
//
//
//  Created by ensan on 2023/06/06.
//

public extension Sequence {
    /// Returns a sorted array of the sequence's elements using the given closures.
    ///  ```swift
    ///  // you can path keyPaths
    ///  let result = array.sorted(on: \.firstKey, \.secondKey)
    ///  // you can also path closures
    ///  let result = array.sorted(on: { -$0.firstKey }, \.secondKey, \.thirdKey, { -$0.forthKey })
    ///  ```
    /// - Parameter key: keys to sort on.
    /// - Returns: A sorted array of the sequence's elements.
    func sorted<each T: Comparable>(on key: repeat (Element) -> each T) -> [Element] {
        func compareByKeyPath(left: Element, right: Element) -> Bool {
            // 2023-06-08
            // Error: Type of expression is ambiguous without more context
            lessThan(
                left: repeat ((each key)(left)),
                right: repeat ((each key)(right))
            )
        }

        return self.sorted(by: compareByKeyPath)
    }
}
