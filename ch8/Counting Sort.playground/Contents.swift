func COUNTING_SORT(inArray A: [Int], outArray B: inout [Int], bound k: Int) -> Void {
    var C = Array(repeating: 0, count: k + 1)
    
    for j in 0..<A.count {
        C[A[j]] += 1
    }
    // C[i] now contains the number of elements equal to i
    C
    
    for i in 1...k {
        C[i] += C[i - 1]
    }
    // C[i] now contains the number of elements less than or equal to i
    C
    
    var j = A.count - 1
    
    while j >= 0 {
        
        B[C[A[j]] - 1] = A[j]
        C[A[j]] -= 1
        
        j -= 1
    }
}

var A = [2, 5, 3, 0, 2, 3, 0, 3]

var B = Array(repeating: 0, count: A.count)

COUNTING_SORT(inArray: A, outArray: &B, bound: 5)

A = [6, 0, 2, 0, 1, 3, 4, 6, 1, 3, 2]

B = Array(repeating: 0, count: A.count)

COUNTING_SORT(inArray: A, outArray: &B, bound: 6)



