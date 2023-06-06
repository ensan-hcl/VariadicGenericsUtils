//
//  VariadicSortedOn.swift
//
//
//  Created by ensan on 2023/06/06.
//

public extension Sequence {
    func sorted<each T: Comparable>(on parameters: repeat KeyPath<Element, each T>) -> [Element] {
        func compareByKeyPath(left: Element, right: Element) -> Bool {
            // 2023-06-06
            // Error: Type of expression is ambiguous without more context
            let result = greater(
                left: repeat (left[keyPath: each parameters]),
                right: repeat (right[keyPath: each parameters])
            )
            return result
        }

        return self.sorted(by: compareByKeyPath)
    }
}
