//
//  Product.swift
//  DigioTest
//
//  Created by Douglas Schiavi on 24/06/22.
//

struct Product: Decodable {
    let name: String?
    let imageURL: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageURL
        case description
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try? values.decode(String.self, forKey: .name)
        imageURL = try? values.decode(String.self, forKey: .imageURL)
        description = try? values.decode(String.self, forKey: .description)
    }
}
