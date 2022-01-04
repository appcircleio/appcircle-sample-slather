public class FizzBuzzKit {

    private var rules: [(Int, String)]

    /// Initialize FizzBuzzKit
    /// - Parameter rules: Array of tuples which sets the rules.
    /// - Default values are `3` for **Fizz** and `5` for **Buzz**
    public init(rules: [(Int, String)] =  [(3, "Fizz"), (5, "Buzz")] ) {
        self.rules = rules
    }

    /// Handle the number according to rules
    /// - Parameter number: Number to check
    /// - Returns: Result of the check
    public func handle(number: Int) -> String {
        if number == 0 {
            return "0"
        }
        let filtered = rules.filter { number % $0.0 == 0 }
        var result = filtered.map { $0.1 }.joined()
        if result == "" {
            result = "\(number)"
        }
        return result
    }

    /// Handle multiple numbers according to rules
    /// - Parameter numbers: Array of numbers to check.
    /// - Returns: Result array of each check
    public func handle(numbers: [Int]) -> [String] {
        return numbers.compactMap { handle(number: $0) }
    }

}
