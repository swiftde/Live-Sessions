protocol ShopItem {
    func buy(customer customer: Customer) -> Bool
}

extension ShopItem {
    func buy(customer customer: Customer) -> Bool {
        if customer.moneyInPockets > 0.0 {
            print("The customer seems to have money, so I think he can buy stuff...")
            
            return true
        }
        
        return false
    }
}