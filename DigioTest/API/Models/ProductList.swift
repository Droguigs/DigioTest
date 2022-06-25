//
//  ProductList.swift
//  DigioTest
//
//  Created by Douglas Schiavi on 24/06/22.
//

struct ProductList: Decodable {
    
    let spotlights: [SpotLight]?
    let products: [Product]?
    let cashes: [Cash]?
    
    enum CodingKeys: String, CodingKey {
        case spotlights = "spotlight"
        case products = "product"
        case cashes = "cash"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        spotlights = try? values.decode([SpotLight].self, forKey: .spotlights)
        products = try? values.decode([Product].self, forKey: .products)
        cashes = try? values.decode([Cash].self, forKey: .cashes)
    }
}
