//
//  Message.swift
//  ChatAppDemo
//
//  Created by 박지은 on 2023/07/15.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
//Identifiable means that each message can be uniquely identified with its ID.
//Codable means that it's decodable and Encodable. So that means that we can convert the data that we fetch from Firestore into this model and we can convert it back again, into the Firestore model.