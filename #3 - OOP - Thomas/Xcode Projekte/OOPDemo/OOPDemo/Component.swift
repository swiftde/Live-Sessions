class Component {
    let manufacturer: Company
    let name: String
    let price: Double?
    
    init(manufacturer: Company, name: String, price: Double) {
        self.manufacturer = manufacturer
        self.name = name
        self.price = price
    }
    
    init(manufacturer: Company, name: String) {
        self.manufacturer = manufacturer
        self.name = name
        self.price = nil
    }
}