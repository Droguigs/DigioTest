//
//  Cash.swift
//  DigioTest
//
//  Created by Douglas Schiavi on 24/06/22.
//

struct Cash: Decodable  {
    let title: String?
    let bannerURL: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case bannerURL
        case description
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try? values.decode(String.self, forKey: .title)
        bannerURL = try? values.decode(String.self, forKey: .bannerURL)
        description = try? values.decode(String.self, forKey: .description)
    }
}
