import Foundation

func PARTITION(A: inout [Int], p: Int, r: Int) -> Int {
    let x = A[r]
    
    var i = p - 1;
    
    for j in p...r - 1 {
        if A[j] <= x {
            i = i + 1
            A.swapAt(i, j)
        }
    }
    
    A.swapAt(i + 1, r)
    
    return i + 1
}

public func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
    let length = Int64(range.upperBound - range.lowerBound + 1)
    let value = Int64(arc4random()) % length + Int64(range.lowerBound)
    return T(value)
}

func RANDOM_PARTITION(A: inout [Int], p: Int, r: Int) -> Int {
    let i = randomNumber(inRange: p...r)
    
    A.swapAt(i, r)
    
    return PARTITION(A: &A, p: p, r: r)
}

func RANDOM_SELECT(A: inout [Int], p: Int, r: Int, i: Int) -> Int {
    if p == r {
        return A[p]
    }
    
    let q = RANDOM_PARTITION(A: &A, p: p, r: r)
    
    let k = q + 1 - p // The pivot is the answer
    
    if i == k {
        return A[q]
    }
    else if i < k {
        return RANDOM_SELECT(A: &A, p: p, r: q - 1, i: i)
    }
    else {
        return RANDOM_SELECT(A: &A, p: q + 1, r: r, i: i - k)
    }
}

var A = [3, 2, 9, 0, 7, 5, 4, 8, 6, 1]

let i = RANDOM_SELECT(A: &A, p: 0, r: A.count - 1, i: 10)
