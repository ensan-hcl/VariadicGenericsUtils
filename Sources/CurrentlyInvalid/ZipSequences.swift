//
//  ZipSequences.swift
//
//
//  Created by ensan on 2023/06/06.
//

enum NilError: Error {
    case `nil`
}

@available(macOS 14, *)
public struct ZipSequences<each Base: Sequence>: Sequence {
    public init(_ sequences: (repeat each Base)) {
        self.contents = sequences
    }
    
    public typealias Element = (repeat each Base.Element)
    var contents: (repeat each Base)

    public struct Iterator: IteratorProtocol {
        var contents: (repeat each Base)

        mutating public func next() -> (repeat each Base.Element)? {
            func unwrapOrThrow<T>(value: T?) throws -> T {
                if let value {
                    return value
                }
                throw NilError.nil
            }
            do {
                // 2023-06-06
                // Error: Generic parameter 'T' could not be inferred
                // Error: Value of tuple type '(repeat each Base)' has no member 'next'
                let result = repeat (try unwrapOrThrow(value: each contents.next()))
                return result
                return nil
            } catch {
                return nil
            }
        }

        init(sequence: ZipSequences<repeat each Base>) {
            self.contents = sequence.contents
        }
    }

    public func makeIterator() -> Iterator {
        Iterator(sequence: self)
    }
}

@available(macOS 14, *)
@inlinable public func zip<each S: Sequence>(_ sequences: repeat each S) -> ZipSequences<repeat each S> {
    ZipSequences((repeat each sequences))
}
