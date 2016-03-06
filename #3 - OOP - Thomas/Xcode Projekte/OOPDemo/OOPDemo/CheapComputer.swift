class CheapComputer: Computer {
    convenience init() {
        self.init(manufacturer: Company(name: "Acer"), model: "El-Cheapo 9000", components: [Component](), profitInPercent: nil)
    }
    
    func die() {
        print("Oh no! This damn thing broke, you should have invested more money, pal!")
    }
}