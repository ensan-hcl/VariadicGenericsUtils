//
//  TupleConcat.swift
//
//
//  Created by ensan on 2023/06/06.
//

///Concatenates two tuples.
///
///- Parameters:
///  - left: A sequence of elements of type `(repeat each T)`.
///  - right: A sequence of elements of type `(repeat each U)`.
///
///- Returns: A tuple containing two sequences. The first sequence contains the elements from `left`, and the second sequence contains the elements from `right`.
///
@inlinable public func concat<each T, each U>(left: (repeat each T), right: (repeat each U)) -> (repeat each T, repeat each U) {
    // 2023-06-06
    // Error: 'each' cannot be applied to non-pack type '(repeat each T)'
    // Error: 'each' cannot be applied to non-pack type '(repeat each U)'
    return (repeat each left, repeat each right)
}
