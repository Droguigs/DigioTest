//
//  ProductList.swift
//  DigioTest
//
//  Created by Douglas Schiavi on 24/06/22.
//

struct ProductList: Decodable {
    
    let spotlights: [SpotLight]?
    let products: [Product]?
    let cash: Cash?
    
    enum CodingKeys: String, CodingKey {
        case spotlights = "spotlight"
        case products
        case cash
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        spotlights = try? values.decode([SpotLight].self, forKey: .spotlights)
        products = try? values.decode([Product].self, forKey: .products)
        cash = try? values.decode(Cash.self, forKey: .cash)
    }
    
    init() {
        spotlights = nil
        products = nil
        cash = nil
    }
}
