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
Merdiven basamak sayısı verildi; 1 veya 2 adım atarak kaç farklı şekilde çıkabileceğini bulabilirsin 
Eğer basamakları verilen dizi içerisindeki sayılarla çıkılabiliyorsa, kaç farklı yol vardır çıkmak için ? 

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
    print(cache)
    
    return cache[n]
}

print(staircase(4, [1, 3, 5])) // 3 , 1-1-1-1 , 1-4, 3-1


// MARK: QUESTION 6 - MAXIMUM PASSENGERS

/*
Matris formatında yol pathi veriliyor. Taksici tren istasyonuna gidecek dönüşte yolcu alabilir ve ilk noktasına geri dönecek
Giderken sağa ve aşağı, dönerken sola ve yukarı gelebilecek.
 -1'li alana giremeyecek
 Yolcular 1 olarak gözüküyor, yolcuyu aldıktan sonra matris elemanı 0 olacak.
 Bu koşulları sağlarken alınacak en yüksek yolcu sayısını bul.
*/

func cost(grid: [[Int]], row1: Int, col1: Int, row2: Int, col2: Int) -> Int {
    if row1 == row2 && col1 == col2 {
        return grid[row1][col1] == 1 ? 1 : 0
    }

    var ans = 0

    if grid[row1][col1] == 1 {
        ans += 1
    }

    if grid[row2][col2] == 1 {
        ans += 1
    }

    return ans
}

func solve(n: Int, m: Int, grid: [[Int]], dp: inout [[[Int]]], row1: Int, col1: Int, row2: Int) -> Int {
    let col2 = (row1 + col1) - row2

    if row1 == n - 1 && col1 == m - 1 && row2 == n - 1 && col2 == m - 1 {
        return 0
    }

    if row1 >= n || col1 >= m || row2 >= n || col2 >= m {
        return -1 * Int.max
    }

    if dp[row1][col1][row2] != -1 {
        return dp[row1][col1][row2]
    }

    var ch1 = -1 * Int.max
    var ch2 = -1 * Int.max
    var ch3 = -1 * Int.max
    var ch4 = -1 * Int.max

    if col1 + 1 < m && row2 + 1 < n && grid[row1][col1 + 1] != -1 && grid[row2 + 1][col2] != -1 {
        ch1 = cost(grid: grid, row1: row1, col1: col1 + 1, row2: row2 + 1, col2: col2) + solve(n: n, m: m, grid: grid, dp: &dp, row1: row1, col1: col1 + 1, row2: row2 + 1)
    }

    if col1 + 1 < m && col2 + 1 < m && grid[row1][col1 + 1] != -1 && grid[row2][col2 + 1] != -1 {
        ch2 = cost(grid: grid, row1: row1, col1: col1 + 1, row2: row2, col2: col2 + 1) + solve(n: n, m: m, grid: grid, dp: &dp, row1: row1, col1: col1 + 1, row2: row2)
    }

    if row1 + 1 < n && col2 + 1 < m && grid[row1 + 1][col1] != -1 && grid[row2][col2 + 1] != -1 {
        ch3 = cost(grid: grid, row1: row1 + 1, col1: col1, row2: row2, col2: col2 + 1) + solve(n: n, m: m, grid: grid, dp: &dp, row1: row1 + 1, col1: col1, row2: row2)
    }

    if row1 + 1 < n && row2 + 1 < n && grid[row1 + 1][col1] != -1 && grid[row2 + 1][col2] != -1 {
        ch4 = cost(grid: grid, row1: row1 + 1, col1: col1, row2: row2 + 1, col2: col2) + solve(n: n, m: m, grid: grid, dp: &dp, row1: row1 + 1, col1: col1, row2: row2 + 1)
    }

    dp[row1][col1][row2] = max(ch1, max(ch2, max(ch3, ch4)))
    return dp[row1][col1][row2]
}

func initializeDp(dp: inout [[[Int]]], item: Int) {
    for i in 0..<6 {
        for j in 0..<6 {
            for k in 0..<6 {
                dp[i][j][k] = item
            }
        }
    }
}

func collectMax(n: Int, m: Int, grid: inout [[Int]]) -> Int {
    var ans = 0
    var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 6), count: 6), count: 6)
    initializeDp(dp: &dp, item: -1)

    if grid[n - 1][m - 1] == -1 || grid[0][0] == -1 {
        ans = -1 * Int.max
    }

    if grid[0][0] == 1 {
        ans += 1
    }
    grid[0][0] = 0

    if grid[n - 1][m - 1] == 1 {
        ans += 1
    }
    grid[n - 1][m - 1] = 0

    ans += solve(n: n, m: m, grid: grid, dp: &dp, row1: 0, col1: 0, row2: 0)
    return max(ans, 0)
}

let n = 3
let m = 3
var arr = [[0, 1, -1], [1, 0, -1], [1, 1, 1]]

let result = collectMax(n: n, m: m, grid: &arr)
print(result)



