func FIND_MAX_CROSSING_SUBARRAY(A:[Int], low: Int, mid: Int, high: Int) -> (Int, Int, Int) {
    
    var max_left = low, max_right = high
    
    var left_sum = Int.min
    var sum = 0
    
    var i = mid
    while i >= low {
        sum += A[i]
     
        i -= 1
        
        if sum > left_sum {
            left_sum = sum
            max_left = i
        }
    }
    
    var right_sum = Int.min
    sum = 0
    
    for j in (mid+1)...high {
        sum += A[j]
        
        if sum > right_sum {
            right_sum = sum
            max_right = j
        }
    }
    
    return (max_left, max_right, left_sum+right_sum)
}
