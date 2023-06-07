//
//  VariadicLessThan.swift
//
//
//  Created by ensan on 2023/06/06.
//

/// Checks if the elements in the left sequence are less than the corresponding elements in the right sequence.
///
/// - Parameters:
///   - left: A sequence of elements of type `T`.
///   - right: A sequence of elements of type `T`.
///
/// - Returns: `left < right`. If the elements in the right sequence are greater or equal than the corresponding elements in the left sequence, and left and right is not totally equal.

@inlinable public func lessThan<each T: Comparable>(left: repeat each T, right: repeat each T) -> Bool {
    var result: Bool? = nil
    func mutatingCompare<U: Comparable>(left: U, right: U, result: inout Bool?) {
        if result != nil {
            return
        }
        result = if left < right {
            true
        } else if left > right {
            false
        } else {
            nil
        }
    }
    repeat (mutatingCompare(left: each left, right: each right, result: &result))
    return result == true
}
