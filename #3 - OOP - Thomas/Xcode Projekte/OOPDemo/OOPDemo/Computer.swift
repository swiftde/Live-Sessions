class Computer: Machine, ShopItem {
    let manufacturer: Company
    let model: String
    var components: [Component]
    var profitInPercent: Double?
    static var hasPower = true
    var price: Double? {
        var price: Double = 0.0
        
        for component in components {
            if let componentPrice = component.price {
                price += componentPrice
            }
        }
        
        if price != 0.0 {
            if let profitInPercent = self.profitInPercent  {
                price += (price / 100) * profitInPercent
            }
            
            return price
        }
        
        return nil
    }
    
    init(manufacturer: Company, model: String, components: [Component], profitInPercent: Double?) {
        self.manufacturer = manufacturer
        self.model = model
        self.components = components
        self.profitInPercent = profitInPercent
    }
    
    convenience init(manufacturer: Company, model: String) {
        self.init(manufacturer: manufacturer, model: model, components: [Component](), profitInPercent: nil)
    }
    
    convenience init(model: String) {
        self.init(manufacturer: Company(name: "Apple"), model: model, components: [Component](), profitInPercent: nil)
    }
    
    convenience init() {
        self.init(manufacturer: Company(name: "Apple"), model: "MacBook Pro 13\"", components: [Component](), profitInPercent: nil)
    }
    
    func addComponent(component component: Component) {
        self.components.append(component)
    }
    
    func removeComponent(component component: Component) -> Bool {
        let indexOfComponent = self.components.indexOf{$0 === component}
        
        if let index = indexOfComponent {
            self.components.removeAtIndex(index)
            
            return true
        }
        
        return false
    }
    
    func turnOn() {
        if Computer.hasPower {
            print("The computer \(self.manufacturer.name) \(self.model) has been turned on.");
        } else {
            print("There's no juice, how the heck should this computer turn on?!")
        }
    }
    
    func turnOff() {
        if Computer.hasPower {
            print("The computer \(self.manufacturer.name) \(self.model) has been turned off.");
        } else {
            print("There's no juice, so the computer couldn't power up in the first place or it has crashed.")
        }
    }
    
    func buy(customer customer: Customer) -> Bool {
        print("The computer has been bought.")
        
        return true
    }
}