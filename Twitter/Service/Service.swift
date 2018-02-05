//
//  Service.swift
//  Twitter
//
//  Created by Mauricio Takashi Kiyama on 1/30/18.
//  Copyright © 2018 a+. All rights reserved.
//

import Foundation
import Firebase

var docRef: DocumentReference!

let group = DispatchGroup()

struct Service {
    
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource) -> ()) {
        print("Fetching home feed")
        
        loadUser1()
        loadUser2()
        loadUser3()
        loadTweet1()
        loadTweet2()

        let homeDatasource = HomeDatasource()
        
        completion(homeDatasource)
    }
    
    func loadUser1() {
            
        group.enter()
        docRef = Firestore.firestore().document("users/user1")
        docRef.getDocument { (docSnapshot, error) in
            guard let docSnapshot = docSnapshot, docSnapshot.exists else { return }
            let myData = docSnapshot.data()
            let fName = myData!["name"] as? String ?? ""
            let fUsername = myData!["username"] as? String ?? ""
            let fBioText = myData!["bioText"] as? String ?? ""
            let fprofileImageUrl = myData!["profileImageUrl"] as? String ?? ""
            let user = User(name: fName, username: fUsername, bioText: fBioText, profileImageUrl: fprofileImageUrl)
            group.leave()
            
            user1 = user
        }
    }
    
    func loadUser2() {
        
        group.enter()
        docRef = Firestore.firestore().document("users/user2")
        docRef.getDocument { (docSnapshot, error) in
            guard let docSnapshot = docSnapshot, docSnapshot.exists else { return }
            let myData = docSnapshot.data()
            let fName = myData!["name"] as? String ?? ""
            let fUsername = myData!["username"] as? String ?? ""
            let fBioText = myData!["bioText"] as? String ?? ""
            let fprofileImageUrl = myData!["profileImageUrl"] as? String ?? ""
            let user = User(name: fName, username: fUsername, bioText: fBioText, profileImageUrl: fprofileImageUrl)
            group.leave()
            
            user2 = user
            
        }
    }
    
    func loadUser3() {
        
        group.enter()
        docRef = Firestore.firestore().document("users/user3")
        docRef.getDocument { (docSnapshot, error) in
            guard let docSnapshot = docSnapshot, docSnapshot.exists else { return }
            let myData = docSnapshot.data()
            let fName = myData!["name"] as? String ?? ""
            let fUsername = myData!["username"] as? String ?? ""
            let fBioText = myData!["bioText"] as? String ?? ""
            let fprofileImageUrl = myData!["profileImageUrl"] as? String ?? ""
            let user = User(name: fName, username: fUsername, bioText: fBioText, profileImageUrl: fprofileImageUrl)
            group.leave()
            
            user3 = user
        }
    }
    
    func loadTweet1() {
        
        group.enter()
        docRef = Firestore.firestore().document("tweets/tweet1")
        docRef.getDocument { (docSnapshot, error) in
            guard let docSnapshot = docSnapshot, docSnapshot.exists else { return }
            let myData = docSnapshot.data()
            let message = myData!["message"] as? String ?? ""
            group.leave()
            
            group.notify(queue: .main) {
            let tweet = Tweet(user: user1, message: message)
            tweet1 = tweet
            }
        }
    }
    
    func loadTweet2() {
        
        group.enter()
        docRef = Firestore.firestore().document("tweets/tweet2")
        docRef.getDocument { (docSnapshot, error) in
            guard let docSnapshot = docSnapshot, docSnapshot.exists else { return }
            let myData = docSnapshot.data()
            let message = myData!["message"] as? String ?? ""
            group.leave()
            
            group.notify(queue: .main) {
                let tweet = Tweet(user: user2, message: message)
                tweet2 = tweet
            }
            
        }
    }
}
