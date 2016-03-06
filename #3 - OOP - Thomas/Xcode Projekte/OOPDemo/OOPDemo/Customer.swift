class Customer {
    let name: String
    let moneyInPockets: Double
    
    init(name: String, moneyInPockets: Double) {
        self.name = name
        self.moneyInPockets = moneyInPockets
    }
    
    convenience init() {
        self.init(name: "Thomas", moneyInPockets: 100.0)
    }
}