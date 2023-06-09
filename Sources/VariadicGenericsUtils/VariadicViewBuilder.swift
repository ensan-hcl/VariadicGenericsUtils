//
//  VariadicViewBuilder.swift
//
//
//  Created by ensan on 2023/06/06.
//

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13, macOS 10.15, tvOS 13, watchOS 6, *)
public extension ViewBuilder {
    @_disfavoredOverload
    static func buildBlock<each Component: View>(_ component: repeat each Component) -> TupleView<(repeat each Component)> {
        TupleView((repeat each component))
    }
}
#endif
