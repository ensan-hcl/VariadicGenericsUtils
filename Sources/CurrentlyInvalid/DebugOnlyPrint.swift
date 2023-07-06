//
//  DebugOnlyPrint.swift
//
//
//  Created by ensan on 2023/06/08.
//

/// print passed values iff DEBUG is defined.
/// - Parameters:
///  - firstValue: first value to print
///  - value: rest values to print. At call site, `firstValue` and `value` is not needed to be distinguished.
/// - Note:
///  - Implementation can be simplified with support of  `repeat each value` syntax in value-variadic call position; e.g. `print(repeat each value)`. Until that, current implementation is usable as workaround.
func debugOnlyPrint<First, each T>(_ firstValue: @autoclosure () -> First, _ value: repeat (@autoclosure () -> each T)) {
#if DEBUG
    func printWithPrefixSpace<U>(value: U) {
        print(" ", terminator: "")    // 空白を出力
        print(value, terminator: "")  // 値を出力
    }
    print(firstValue(), terminator: "")
    repeat printWithPrefixSpace(value: (each value)()) // 各値について「空白+値の文字列」を出力していく
    print()   // 最後の改行を出力する
#endif
}
