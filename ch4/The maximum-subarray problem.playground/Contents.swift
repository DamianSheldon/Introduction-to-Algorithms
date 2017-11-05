func FIND_MAX_CROSSING_SUBARRAY(A:[Int], low: Int, mid: Int, high: Int) -> (Int, Int, Int) {
    
    var max_left = low, max_right = high
    
    var left_sum = Int.min
    var sum = 0
    
    var i = mid
    while i >= low {
        sum += A[i]
        
        if sum > left_sum {
            left_sum = sum
            max_left = i
        }
        
        i -= 1
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

func FIND_MAXIMUM_SUBARRAY(A: [Int], low: Int, high: Int) -> (Int, Int, Int) {
    if high == low {
        return (low, high, A[low])
    }
    else {
        var n = Float(low + high) / 2.0
        n.round(.down)
        
        let mid = Int(n)
        
        let (left_low, left_high, left_sum) = FIND_MAXIMUM_SUBARRAY(A: A, low: low, high: mid)
        
        let (right_low, right_high, right_sum) = FIND_MAXIMUM_SUBARRAY(A: A, low: mid + 1, high: high)
        
        let (cross_low, cross_high, cross_sum) = FIND_MAX_CROSSING_SUBARRAY(A: A, low: low, mid: mid, high: high)
        
        if left_sum >= cross_sum && left_sum >= right_sum {
            return (left_low, left_high, left_sum)
        }
        else if right_sum >= cross_sum && right_sum >= left_sum {
            return (right_low, right_high, right_sum)
        }
        else {
            return (cross_low, cross_high, cross_sum)
        }
    }
}

func FORCE_FIND_MAX_SUBARRAY(A:[Int], low: Int, high: Int) -> (Int, Int, Int) {
    var (ret_low, ret_high, max) = (0, 0, 0)
    var subarray_sum = 0;
    
    for i in low..<high {
        subarray_sum += A[i]
        
        for j in (i + 1)...high {
            subarray_sum += A[j]
            if (subarray_sum > max) {
                ret_low = i
                ret_high = j
                max = subarray_sum
            }
        }
        
        subarray_sum = 0
    }
    
    return (ret_low, ret_high, max)
}

func LINEAR_FIND_MAX_SUBARRAY(A:[Int], low: Int, high: Int) -> (Int, Int, Int) {
    var sum = 0, sum_low = low
    
    var max_subarray = 0, max_low = low, max_high = low
    
    for i in low...high {
        if sum < 0 {
            sum = A[i]
            sum_low = i
        }
        else {
            sum = sum + A[i]
        }
        
        if sum > max_subarray {
            max_subarray = sum
            max_low = sum_low
            max_high = i
        }
    }
    
    return (max_low, max_high, max_subarray)
}

var A = [13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7]

var (low, high, sum) = FIND_MAXIMUM_SUBARRAY(A: A, low: 0, high: A.count - 1)

low
high
sum

A = [13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7]
(low, high, sum) = FORCE_FIND_MAX_SUBARRAY(A: A, low: 0, high: A.count - 1)

low
high
sum

A = [13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7]
(low, high, sum) = LINEAR_FIND_MAX_SUBARRAY(A: A, low: 0, high: A.count - 1)

low
high
sum

A = [-1, -2, -3, -4, -5, -6, -7, -8, -9, -10]

(low, high, sum) = FIND_MAXIMUM_SUBARRAY(A: A, low: 0, high: A.count - 1)

low
high
sum

A = [-11, -2, -3, -4, -5, -6, -7, -8, -9, -10]

(low, high, sum) = FIND_MAXIMUM_SUBARRAY(A: A, low: 0, high: A.count - 1)

low
high
sum

A = [-11, -2, -3, -4, -5, -6, -7, -8, -9, -10]

(low, high, sum) = LINEAR_FIND_MAX_SUBARRAY(A: A, low: 0, high: A.count - 1)

low
high
sum
