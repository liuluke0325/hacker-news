//
//  PostData.swift
//  Hacker News
//
//  Created by Hsueh Chih Liu on 2019/12/12.
//  Copyright © 2019 Luke Liu. All rights reserved.
//

import Foundation

struct Results:Decodable{
    
    let hits:[Post]
}

struct Post:Decodable,Identifiable{
    //identifiable is for the identifiable protocal
    var id:String {
        //this property will automatically be created by the object
        return objectID
    }
    let points:Int
    let title:String
    let url:String?
    let objectID:String
    
}
