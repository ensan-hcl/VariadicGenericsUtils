//
//  VariadicEqual.swift
//
//
//  Created by ensan on 2023/06/06.
//

/// Checks if two sequences have equal elements.
///
/// - Parameters:
///   - left: A sequence of elements of type `T`.
///   - right: A sequence of elements of type `T`.
///
/// - Returns: `true` if the sequences have equal elements, `false` otherwise.
///
@inlinable public func equal<each T: Equatable>(left: repeat each T, right: repeat each T) -> Bool {
    var result: Bool = true
    func mutatingCompare<U: Equatable>(left: U, right: U) {
        if !result {
            return
        }
        result = left == right
    }
    repeat (mutatingCompare(left: each left, right: each right))
    return result
}
