//
//  Message.swift
//  ChatAppDemo
//
//  Created by 박지은 on 2023/07/15.
//

import Foundation
import FirebaseFirestoreSwift

w
//    var received: Bool
//    var timestamp: Date
}

struct User: Codable {
    @DocumentID var userID: String?
    var name: String
//    var lastname: String
//    var age: Int
}

//Identifiable means that each message can be uniquely identified with its ID.
//Codable means that it's decodable and Encodable. So that means that we can convert the data that we fetch from Firestore into this model and we can convert it back again, into the Firestore model.
