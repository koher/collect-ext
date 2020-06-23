extension BidirectionalCollection {
    public func dropLast(while predicate: (Element) throws -> Bool) rethrows -> SubSequence {
        guard let i = try lastIndex(where: { try !predicate($0) }) else {
            return prefix(0)
        }
        return self[...i]
    }
    
    public func suffix(while predicate: (Element) throws -> Bool) rethrows -> SubSequence {
        guard let i = try lastIndex(where: { try !predicate($0) }) else {
            return self[...]
        }
        return self[index(after: i)...]
    }
}
