//
//  MaxSubarrayAlgorithm.swift
//  BenchmarkTests
//
//  Created by Meiliang Dong on 03/11/2017.
//  Copyright © 2017 Meiliang Dong. All rights reserved.
//

import Foundation

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
    // When n < 10 force algorithm is better
    if A.count < 10 {
        return FORCE_FIND_MAX_SUBARRAY(A: A)
    }
    
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

func FORCE_FIND_MAX_SUBARRAY(A:[Int]) -> (low: Int, high: Int, sum: Int) {
    var (low, high, max) = (0, 0, 0)
    var subarray_sum = 0;
    
    for i in 0..<(A.count - 1) {
        subarray_sum += A[i]
        
        for j in (i + 1)...(A.count - 1) {
            subarray_sum += A[j]
            if (subarray_sum > max) {
                low = i
                high = j
                max = subarray_sum
            }
        }
        
        subarray_sum = 0
    }
    
    return (low, high, max)
}
