print("Welcome to the UW Calculator Playground")

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

func calculate(_ args: [String]) -> Int {
    var hasAction = false
    var counter = 0
    var action = ""
    while (hasAction == false) {
        let curr = args[counter]
        if (!curr.isInt) {
            hasAction = true
            action = curr
        }
        counter += 1
    }
    
    if (args.count == 1) {
        return 0
    }
    
    var result = 0
    
    switch action {
    case "count":
        for i in args {
            if (i.isInt) {
                result += 1
            }
        }
    case "avg":
        for i in args {
            var divisor = 0
            if (i.isInt) {
                result += Int(i)!
                divisor += 1
            }
            result / divisor
        }
    case "fact":
        for i in args {
            if (i.isInt) {
                var curr = Int(i)!
                if curr == 0 {
                    result = 1
                } else {
                    result = curr
                }
                while curr > 1 {
                    curr -= 1
                    result *= curr
                }
            }
        }
    default:
        var nums = [Int]()
        for i in args {
            if (i.isInt) {
                nums.append(Int(i)!)
            }
        }
        if (nums.count == 2) {
        switch action {
            case "+":
                result = nums[0] + nums[1]
            case "-":
                result = nums[0] - nums[1]
            case "*":
                result = nums[0] * nums[1]
            case "/":
                result = nums[0] / nums[1]
            default:
                result = nums[0] % nums[1]
            }
        }
    }
    return result
}

func calculate(_ arg: String) -> Int {
    let arr = arg.split(separator: " ")
    var stringArr = [String]()
    for i in arr {
        stringArr.append(String(i))
    }
    return calculate(stringArr)
}

// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly

calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers
/*
calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5
*/
 
// Implement calculate([String]) and calculate(String)
// to use floating-point values
/*
func calculate(_ args: [String]) -> Double {
    return -1.0
}
func calculate(_ arg: String) -> Double {
    return -1.0
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5
*/
