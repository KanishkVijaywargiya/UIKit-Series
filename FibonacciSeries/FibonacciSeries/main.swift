//
//  main.swift
//  FibonacciSeries
//
//  Created by Kanishk Vijaywargiya on 12/11/22.
//

import Foundation


func fibo(n: Int) {
    var n1 = 0
    var n2 = 1
    
    if n == 0 {
        print("Invalid")
    } else if n == 1 {
        print(n1)
    } else if n == 2 {
        print(n1, n2)
    } else {
        var arr = [n1,n2]
        print(arr)//[0,1]
        for _ in 2..<n {
            var n3 = n1 + n2
            n1 = n2
            n2 = n3
            arr.append(n3)
        }
        print(arr)
    }
}

fibo(n: 10)

