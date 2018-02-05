//
//  HomeDatasource.swift
//  Twitter
//
//  Created by Mauricio Takashi Kiyama on 1/24/18.
//  Copyright © 2018 a+. All rights reserved.
//

import LBTAComponents
import Firebase
import UIKit

class HomeDatasource: Datasource {
    
    lazy var users: [User] = [user1, user2, user3]
    lazy var tweets: [Tweet] = [tweet1, tweet2]
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
}

