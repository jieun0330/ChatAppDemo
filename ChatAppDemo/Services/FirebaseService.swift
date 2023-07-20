//
//  FirebaseService.swift
//  ChatAppDemo
//
//  Created by 박지은 on 2023/07/16.
//

import Combine
import UIKit

import FirebaseFirestore
import FirebaseFirestoreSwift

struct FirebaseService {
    static let db = Firestore.firestore()
    
    //Mark: - User
    /// Create
    // 비동기처리랑 completion: @escaping
    
    // 아무의미없는 주석
    
    /// 유저를 생성합니다.
    static func createUser(user: User, completion: @escaping () -> Void) {
        do {
            let _ = try db.collection("users").addDocument(from: user) { error in
                print("success")
            }
            // 끝나면 다시 되돌아감
            completion()
        } catch {
            print("error")
        }
    }
    
    ///Read
    static func fetchUser(withID userID: String, completion: @escaping (Result<User, Error>) -> Void) {
        db.collection("users").document(userID).getDocument { snapshot, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = snapshot?.data() {
                do {
                    let user = try Firestore.Decoder().decode(User.self, from: data)
                    completion(.success(user))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
    
    
    ///Update
    static func updateUser(user: User, completion: @escaping () -> Void) {
        do {
            let documentRef = db.collection("users").document(user.userID ?? "default") // String
            try documentRef.setData(from: user) { error in
                completion()
            }
        } catch {
            completion()
        }
    }
    
    
    ///Delete
    static func deleteUser(withID userID: String, completion: @escaping (Error?) -> Void) {
        db.collection("users").document(userID).delete { error in
            completion(error)
        }
    }
    
    
    
    
    
//    struct FirebaseService {
//        static let db = Firestore.firestore()
//
//        //MARK: - User
//
//        /// Create
//        static func createUser(user: User, completion: @escaping (Error?) -> Void) {
//            do {
//                _ = try db.collection("users").addDocument(from: user) { error in
//                    if let error = error {
//                        completion(error)
//                    } else {
//                        completion(nil)
//                    }
//                }
//            } catch {
//                completion(error)
//            }
//        }
//
    
    
    
//    func getMessages() {
//        db.collection("messages").addSnapshotListener { QuerySnapshot, error in
//            guard let documents = QuerySnapshot?.documents else {
//                print("Error fetching documents: \(String(describing: error))")
//                return
//            }
//
//            self.messages = documents.compactMap { document -> Message? in
//                do {
//                    return try document.data(as: Message.self)
//                } catch {
//                        print("Error decoding document into Message: \(error)")
//                        return nil
//                    }
//                }
//
//            self.messages.sort { $0.timestamp < $1.timestamp }
//
//            if let id = self.messages.last?.id {
//                self.lastMessageId = id
//
//            }
//
//            }
//
//        }
//
    
    
    
    
    
    
    
    
    
    
    
    
    /// Read
    
    /// Update
    
    /// Delete
    
}

