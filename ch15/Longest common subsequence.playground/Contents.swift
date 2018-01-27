func PRINT_TABLE_B(b: Array<Array<Character>>, k: Int, s: Int) -> Void {
    for i in 0..<k {
        let bi = b[i]
        for j in 0..<s {
            print("b\(i)\(j): \(bi[j])")

        }
        print("\n")
    }
}

func PRINT_TABLE_C(C: Array<Array<Int>>, k: Int, s: Int) -> Void {
    for i in 0..<k {
        let ci = c[i]
        for j in 0..<s {
            print("c\(i)\(j): \(ci[j])")
            
        }
        print("\n")
    }
}

func LCS_LENGTH<T:Equatable>(X: Array<T>, Y: Array<T>) -> (b: Array<Array<Character>>, c: Array<Array<Int>>) {
    let m = X.count
    let n = Y.count
    
    // Let b[1..m, 1..n] and c[0..m, 0..n] be new tables
    let ib:[Character] = Array(repeating: "🐶", count: n)
    var b:[[Character]] = Array<Array<Character>>(repeating: ib, count: m)
    
    let ic = Array(repeating: 0, count: n)
    var c = Array(repeating: ic, count: m)
    
    for i in 0..<m {
        var ci = c[i]
        let i_1 = max(0, i - 1)
        let ci_1 = c[i_1]
        
        var bi = b[i]
        
        for j in 0..<n {
            let j_1 = max(0, j - 1)
            if X[i] == Y[j] {
                // c[i, j] = c[i - 1, j - 1] + 1
                ci[j] = ci_1[j_1] + 1
                bi[j] = "↖︎"
            }
            else if ci_1[j] >= ci[j_1] {
                ci[j] = ci_1[j]
                bi[j] = "↑"
            }
            else {
                ci[j] = ci[j_1]
                bi[j] = "←"
            }
        }
        // Workaround swift can't direct modify mutiple dimension array
        b[i] = bi
        c[i] = ci
    }
    
//    PRINT_TABLE_B(b: b, k: m, s: n)
    return (b, c)
}

func PRINT_LCS<T:Equatable>(b: Array<Array<Character>>, X: Array<T>, i: Int, j: Int) -> Void {
    if i == 0 || j == 0 {
        return
    }
    
    // Fix index start zero
    let k = i - 1
    let s = j - 1
    
    let bi = b[k]
    
    if bi[s] == "↖︎" {
        PRINT_LCS(b: b, X: X, i: i - 1, j: j - 1)
        print("\(X[k])")
    }
    else if bi[s] == "↑" {
        PRINT_LCS(b: b, X: X, i: i - 1, j: j)
    }
    else {
        PRINT_LCS(b: b, X: X, i: i, j: j - 1)
    }
}

let X = ["A", "B", "C", "B", "D", "A", "B"]
let Y = ["B", "D", "C", "A", "B", "A"]

var (b, c) = LCS_LENGTH(X: X, Y: Y)
//PRINT_TABLE_B(b: b, k: X.count, s: Y.count)
//PRINT_TABLE_C(C: c, k: X.count, s: Y.count)

PRINT_LCS(b: b, X: X, i: X.count, j: Y.count)

let A = [1, 0, 0, 1, 0, 1, 0, 1]
let B = [0, 1, 0, 1, 1, 0, 1, 1, 0]

(b, c) = LCS_LENGTH(X: A, Y: B)

PRINT_LCS(b: b, X: A, i: A.count, j: B.count)
