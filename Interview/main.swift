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
    let numbers = str.components(separatedBy: CharacterSet.decimalDigits.inverted)
    return numbers.compactMap { Int($0) }.reduce(0, +)
}

print(NumberAddition("K23RAKTER34DENEM1E")) // 23 + 34 + 1 = 58
