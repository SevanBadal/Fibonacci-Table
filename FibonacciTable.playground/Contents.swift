import Foundation
// Sevan Badal
// fast doubling Fibinacci table
// more on fast doubling: https://www.nayuki.io/page/fast-fibonacci-algorithms
struct FibonacciTable {
    static subscript(index: Int) -> Int {
        return fib(n: index)
    }
    private static func fib(n: Int) -> Int {
        var a = 0
        var b = 1
        for i in (0...31).reversed() {
            let d = a * (b * 2 - a)
            let e = a * a + b * b
            a = d
            b = e
            // right shift n by i bits
            if ((UInt(n) >> i) & 1 ) != 0 {
                let c = a + b
                a = b
                b = c
            }
        }
        return a
    }
}

// FibonacciTable[91] -> 4660046610375530309
FibonacciTable[91]

