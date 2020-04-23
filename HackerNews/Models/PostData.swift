//
//  PostData.swift
//  HackerNews
//
//  Created by Ángeles Vázquez Parra on 23/04/2020.
//  Copyright © 2020 Ángeles Vázquez Parra. All rights reserved.
//

import Foundation

struct PostData : Decodable{
    let hits: [Post]
}

struct Post: Decodable, Identifiable{
    var id : String {
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String
}
