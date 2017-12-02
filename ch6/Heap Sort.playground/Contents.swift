struct HEAP {
    var heap_size = 0
    var nodes : [Int]
}

func PARENT(i : Int) -> Int {
    
    if i < 1 {
        return 0
    }
    var p = Float(i - 1)
    p = p / 2.0
    p.rounded(.down)
    
    return Int(p)
}

func LEFT(i : Int) -> Int {
    return 2*i + 1
}

func RIGHT(i : Int) -> Int {
    return 2*i + 2
}

func MAX_HEAPIFY(A : inout HEAP, i : Int) {
    let l = LEFT(i: i)
    let r = RIGHT(i: i)
    
    var largest = i
    
    if l <= A.heap_size - 1 && A.nodes[l] > A.nodes[i] {
        largest = l
    }
    
    if r <= A.heap_size - 1 && A.nodes[r] > A.nodes[largest] {
        largest = r
    }
    
    if largest != i {
        // Exchange A[i] with A[largest]
        let tmp = A.nodes[i]
        A.nodes[i] = A.nodes[largest]
        A.nodes[largest] = tmp
        
        MAX_HEAPIFY(A: &A, i: largest)
    }
}

var nodes = [16, 4, 10, 14, 7, 9, 3, 2, 8, 1]

var A = HEAP(heap_size: nodes.count, nodes: nodes)

MAX_HEAPIFY(A: &A, i: 1)

A.nodes

func BUILD_MAX_HEAP(A: inout HEAP) {
    var i = PARENT(i: A.heap_size - 1)
    while i >= 0 {
        MAX_HEAPIFY(A: &A, i: i)
        i = i - 1
    }
}

nodes = [4, 1, 3, 2, 16, 9, 10, 14, 8, 7]

A = HEAP(heap_size: nodes.count, nodes: nodes)

A.nodes

BUILD_MAX_HEAP(A: &A)

A.nodes

func HEAP_SORT(A: inout HEAP) {
    BUILD_MAX_HEAP(A: &A)
    
    var i = A.heap_size - 1
    
    while i >= 1 {
        // Exchange A[0] with A[i]
        let tmp = A.nodes[0]
        A.nodes[0] = A.nodes[i]
        A.nodes[i] = tmp
        
        A.heap_size = A.heap_size - 1
        
        MAX_HEAPIFY(A: &A, i: 0)
        
        i = i - 1
    }
}

nodes = [4, 1, 3, 2, 16, 9, 10, 14, 8, 7]

A = HEAP(heap_size: nodes.count, nodes: nodes)

HEAP_SORT(A: &A)

A.nodes

func HEAP_MAXIMUM(A : HEAP) -> Int {
    return A.nodes[0]
}

func HEAP_EXTRACT_MAX(A : inout HEAP) -> Int {
    if A.heap_size < 1 {
        fatalError("heap underflow")
    }
    
    let max = A.nodes[0]
    
    A.nodes[0] = A.nodes[A.heap_size]
    A.heap_size = A.heap_size - 1
    MAX_HEAPIFY(A: &A, i: 0)
    
    return max
}

func HEAP_INCREASE_KEY(A : inout HEAP, i : inout Int, key : Int) {
    if key < A.nodes[i] {
        fatalError("new key is smaller than current key")
    }
    
    A.nodes[i] = key
    
    while i >= 0 && A.nodes[PARENT(i: i)] < A.nodes[i] {
        // Exchange A[i] with A[parent(i)]
        let tmp = A.nodes[i]
        A.nodes[i] = A.nodes[PARENT(i: i)]
        A.nodes[PARENT(i: i)] = tmp
        
        i = PARENT(i: i)
    }
}

A.nodes
A.heap_size = A.nodes.count

BUILD_MAX_HEAP(A: &A)

A.nodes

func MAX_HEAP_INSERT(A : inout HEAP, key : Int) {
    A.heap_size = A.heap_size + 1
    
    var i = A.heap_size - 1

    A.nodes[i] = Int.min
    
    HEAP_INCREASE_KEY(A: &A, i: &i, key: key)
}
