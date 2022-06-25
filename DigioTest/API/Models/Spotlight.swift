//
//  Spotlight.swift
//  DigioTest
//
//  Created by Douglas Schiavi on 24/06/22.
//

struct SpotLight: Decodable  {
    let name: String?
    let bannerURL: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case bannerURL
        case description
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try? values.decode(String.self, forKey: .name)
        bannerURL = try? values.decode(String.self, forKey: .bannerURL)
        description = try? values.decode(String.self, forKey: .description)
    }
}
