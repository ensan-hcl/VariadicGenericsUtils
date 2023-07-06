//
//  VariadicConcat.swift
//
//
//  Created by ensan on 2023/06/06.
//

///Concatenates two sequences of potentially different element types.
///
///- Parameters:
///  - left: A sequence of elements of type `T`.
///  - right: A sequence of elements of type `U`.
///
///- Returns: A tuple containing two sequences. The first sequence contains the elements from `left`, and the second sequence contains the elements from `right`.
///
///- Note: The sequences `left` and `right` can have different element types. The resulting tuple will have the same element types as the input sequences.
///
@_disfavoredOverload
@inlinable public func concat<each T, each U>(left: repeat each T, right: repeat each U) -> (repeat each T, repeat each U) {
    return (repeat each left, repeat each right)
}


///Concatenates two tuples.
///
///- Parameters:
///  - left: A sequence of elements of type `(repeat each T)`.
///  - right: A sequence of elements of type `(repeat each U)`.
///
///- Returns: A tuple containing two sequences. The first sequence contains the elements from `left`, and the second sequence contains the elements from `right`.
///
@inlinable public func concat<each T, each U>(left: (repeat each T), right: (repeat each U)) -> (repeat each T, repeat each U) {
    return (repeat each left, repeat each right)
}
