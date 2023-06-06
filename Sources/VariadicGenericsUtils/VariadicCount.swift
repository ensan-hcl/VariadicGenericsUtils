//
//  VariadicCount.swift
//
//
//  Created by ensan on 2023/06/06.
//

/// Counts the number of elements in the given sequence.
///
/// - Parameters:
///   - value: A sequence of elements of type `T`.
///
/// - Returns: The number of elements in the sequence.
///
@inlinable public func count<each T>(value: repeat each T) -> Int {
    var count = 0
    func increment(trigger _: some Any, count: inout Int) {
        count += 1
    }
    repeat (increment(trigger: each value, count: &count))
    return count
}
