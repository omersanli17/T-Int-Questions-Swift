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
(ie. "All cows eat grass and moo" would return 8). Do not count y as a vowel for this
 
 Ünlü harflerin sayısını return ettirme
*/


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

print(vowelCount("şemsi paşa pasajında sesi büzüşesiceler"))

