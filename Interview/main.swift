//
//  main.swift
//  Interview
//
//  Created by ömer şanlı on 18.02.2024.
//

import Foundation


// MARK: QUESTION 1 VOWEL COUNT

/*
 Have the function VowelCount (str) take the str string parameter being passed and
 return the number of vowels the string contains
 
 Ünlü harflerin sayısını return ettirme
 */

// MARK: QUESTION 1 - VOWEL COUNT

public func vowelCount(_ str: String) -> Int {
    let vowels: Set<Character> = ["a", "e", "ı" ,"i", "o", "u", "ü"]
    var count = 0
    
    for char in str.lowercased() {
        if vowels.contains(char) {
            count += 1
        }
    }
    
    return count
}

print(vowelCount("şemsi paşa pasajında sesi büzüşesiceler")) // 16


// MARK: QUESTION 2 - Number Addition

/*
 Have the function NumberAddition (str) take the str parameter, search for all the numbers in the string, add them together, then return that final number. For example: if str is
 "88Hello 3World!" the output should be 91.
 
 String içindeki sayıları bulup toplama, "10 2One" için 12
 */

public func NumberAddition(_ str: String) -> Int {
    let numbers = str.components(separatedBy: CharacterSet.decimalDigits.inverted) // Decimal harici karakterleri alıyor
    return numbers.compactMap { Int($0) }.reduce(0, +)
}

print(NumberAddition("K23RAKTER34DENEM1E")) // 23 + 34 + 1 = 58

// MARK: QUESTION 3 - Simple Mode

/*
 Find mode in array (frequently repeated term), Mode yoksa -1 döndürsün
 Dizi içinde en çok tekrar eden sayıyı bulma
 */

public func SimpleMode(_ arr: [Int]) -> Int {
    var dict = [Int: Int]()
    for num in arr {
        dict[num, default: 0] += 1
    }
    let max = dict.values.max()
    return max == 1 ? -1 : dict.first { $0.value == max }!.key
}

print(SimpleMode([10, 4, 5, 2]))


// MARK: QUESTION 4 - MINIMUM DIFFERENCE SUM

/*
 Given an od number arr, rearrange them so that
 the sum of the absolute differences of all adjacent
 elements is minimized. Then, compute the sum of
 those absolute differences.
 */

public func minimumDifferenceSum(_ arr: [Int]) -> Int {
    var absSum = 0
    guard arr.count > 1 else { return absSum }
    let sortedArr = arr.sorted()
    for i in 0..<sortedArr.count - 1 {
        absSum += abs(sortedArr[i] - sortedArr[i + 1])
    }
    return absSum
}

print(minimumDifferenceSum([1, 2, 3, 56])) // 55;  1 + 1 + 53


// MARK: QUESTION 5 - UNIQUE WAYS TO CLIMB STAIRS - AMAZON Interview Question

/*
There's a staircase with N steps, and you can climb 1 or 2 steps at a time. Given N, write a function that returns the number of unique ways you can climb the staircase. The order of the steps matters.

For example, if N is 4, then there are 5 unique ways:

1, 1, 1, 1
2, 1, 1
1, 2, 1
1, 1, 2
2, 2
What if, instead of being able to climb 1 or 2 steps at a time, you could climb any number from a set of positive integers X? For example, if X = {1, 3, 5}, you could climb 1, 3, or 5 steps at a time. Generalize your function to take in X.
X is the array that user write to use functiion
 */

public func staircase(_ n: Int, _ X: [Int]) -> Int {
    var cache = [Int](repeating: 0, count: n + 1)
    cache[0] = 1
    
    for i in 1...n {
        for x in X where i - x >= 0 {
            cache[i] += cache[i - x]
        }
    }
    
    return cache[n]
}

print(staircase(4, [1, 3, 5])) // 3 , 1-1-1-1 , 1-4, 3-1


