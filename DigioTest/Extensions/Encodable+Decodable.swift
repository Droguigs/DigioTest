//
//  Encodable+Decodable.swift
//  DigioTest
//
//  Created by Douglas Schiavi on 24/06/22.
//

import Foundation

extension Encodable {
    func encode(with encoder: JSONEncoder = JSONEncoder()) throws -> Data {
        return try encoder.encode(self)
    }
}

extension Decodable {
    static func decode(with decoder: JSONDecoder = JSONDecoder(), from data: Data) throws -> Self {
        return try decoder.decode(Self.self, from: data)
    }
}
