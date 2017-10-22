
func MERGE(A: inout [Int], p: Int, q: Int, r: Int) -> Void {
    let n1 = q - p + 1
    let n2 = r - q
    
    var L = Array(repeating: 0, count: n1 + 1)
    var R = Array(repeating: 0, count: n2 + 1)
    
    for i in 0..<n1 {
        L[i] = A[p + i]
    }
    
    for j in 0..<n2 {
        R[j] = A[q + 1 + j]
    }
    
    L[n1] = Int.max
    R[n2] = Int.max
    
    var i = 0
    var j = 0
    
    for k in p...r {
        if L[i] <= R[j] {
            A[k] = L[i]
            i = i + 1
        }
        else {
            A[k] = R[j]
            j = j + 1
        }
    }
}

var A = [2, 4, 5, 7, 1, 2, 3, 6]

MERGE(A: &A, p: 0, q: 3, r: 7)

func MERGE_WITHOUT_SENTRY(A: inout [Int], p: Int, q: Int, r: Int) -> Void {
    let n1 = q - p + 1
    let n2 = r - q
    
    var L = Array(repeating: 0, count: n1)
    var R = Array(repeating: 0, count: n2)
    
    for i in 0..<n1 {
        L[i] = A[p + i]
    }
    
    for j in 0..<n2 {
        R[j] = A[q + 1 + j]
    }
    
    var i = 0
    var j = 0
    
    for k in p...r {
        if i == n1 {
            A[k] = R[j];
            j = j + 1
        }
        else if j == n2 {
            A[k] = L[i]
            i = i + 1
        }
        else {
            if L[i] <= R[j] {
                A[k] = L[i]
                i = i + 1
            }
            else {
                A[k] = R[j]
                j = j + 1
            }
        }
    }
}

A = [2, 4, 5, 7, 1, 2, 3, 6]

MERGE_WITHOUT_SENTRY(A: &A, p: 0, q: 3, r: 7)

func MERGE_SORT(A: inout [Int], p: Int, r: Int) {
    if p < r {
        var sum = Float(p + r) / 2.0
        sum.round(FloatingPointRoundingRule.down)
        let q = Int(sum)
        
        MERGE_SORT(A: &A, p: p, r: q)
        MERGE_SORT(A: &A, p: q + 1, r: r)
//        MERGE(A: &A, p: p, q: q, r: r)
        MERGE_WITHOUT_SENTRY(A: &A, p: p, q: q, r: r)
    }
}

A = [2, 4, 5, 7, 1, 2, 3, 6]

MERGE_SORT(A: &A, p: 0, r: A.count - 1)
