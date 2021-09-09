extension Int {
    func toUInt32() -> UInt32 {
        return UInt32(self)
    }

    func toFloat64() -> Float64 {
        return Float64(self)
    }

    func toDouble() -> Double {
        return Double(self)
    }
}

extension UInt32 {
    func toInt64() -> Int64 {
        return Int64(self)
    }

    func toInt() -> Int {
        return Int(self)
    }
}

extension Float {
    func toFloat64() -> Float64 {
        return Float64(self)
    }
}

extension Double {
    func toInt() -> Int {
        return Int(self)
    }

    func toUInt32() -> UInt32 {
        return UInt32(self)
    }
}