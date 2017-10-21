// 2.1-2

func INSERTION_SORT(array: inout [Int]) -> Void {
    
    for j in 1..<array.count {
        let key = array[j]
        
        var i = j - 1
        
        while i >= 0 && array[i] < key {
            array[i + 1] = array[i]
            i = i - 1
        }
        
        array[i + 1] = key
    }
}

var a = [31, 41, 59, 26, 41, 58]

INSERTION_SORT(array: &a)

// 2.1-4

func N_BIT_INTEGER_ADD(lhs: [Int], rhs: [Int]) -> [Int] {
    var flag = 0
    var c = Array(repeating: 0, count: lhs.count + 1)
    
    var j = lhs.count - 1
    while j >= 0 {
        c[j + 1] = lhs[j] + rhs[j] + flag
        
        if c[j + 1] > 1 {
            c[j + 1] = c[j + 1] % 2
            
            flag = 1
        }
        else {
            flag = 0
        }
        
        j = j - 1
    }
    c[j + 1] = flag
    
    return c
}

let A = [1, 0, 1, 1, 0, 1, 1, 0, 1, 1]
let B = [0, 1, 1, 1, 0, 1, 0, 1, 1, 1]

let C = N_BIT_INTEGER_ADD(lhs: A, rhs: B)


