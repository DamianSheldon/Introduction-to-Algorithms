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

func QUICKSORT(A: inout [Int], p: Int, r: Int) {
    if p < r {
        let q = PARTITION(A: &A, p: p, r: r)
        
        QUICKSORT(A: &A, p: p, r: q - 1)
        QUICKSORT(A: &A, p: q + 1, r: r)
    }
}

var A = [2, 8, 7, 1, 3, 5, 6, 4]

QUICKSORT(A: &A, p: 0, r: A.count - 1)

A = [13, 19, 9, 5, 12, 8, 7, 4, 21, 2, 6, 11]

QUICKSORT(A: &A, p: 0, r: A.count - 1)

func PARTITION_ASC_VERSION(A: inout [Int], p: Int, r: Int) -> Int {
    let x = A[r]
    
    var i = p - 1;
    
    for j in p...r - 1 {
        if A[j] >= x {
            i = i + 1
            A.swapAt(i, j)
        }
    }
    
    A.swapAt(i + 1, r)
    
    return i + 1
}

func QUICKSORT_ASC_VERSION(A: inout [Int], p: Int, r: Int) {
    if p < r {
        let q = PARTITION_ASC_VERSION(A: &A, p: p, r: r)
        
        QUICKSORT_ASC_VERSION(A: &A, p: p, r: q - 1)
        QUICKSORT_ASC_VERSION(A: &A, p: q + 1, r: r)
    }
}

A = [2, 8, 7, 1, 3, 5, 6, 4]

QUICKSORT_ASC_VERSION(A: &A, p: 0, r: A.count - 1)

A = [13, 19, 9, 5, 12, 8, 7, 4, 21, 2, 6, 11]

QUICKSORT_ASC_VERSION(A: &A, p: 0, r: A.count - 1)
