//
//  DataModel.swift
//  InstagramDemo
//
//  Created by mysmac_adm!n on 20/01/20.
//  Copyright © 2020 Mridula. All rights reserved.
//

import Foundation
import ObjectMapper

class DataModel: NSObject, Mappable
{
    var posts : [posts]?

    required init?(map: Map)
    {}

    func mapping(map: Map)
    {
        posts <- map["posts"]
    }
}

class posts: NSObject, Mappable
{
    var id : String?
    var userName : String?
    var vUrl : String?
    var userImageUrl : String?
    var time :String?
    

    required init?(map: Map)
    {}

    func mapping(map: Map)
    {
        id <- map["id"]
        userName <- map["userName"]
        vUrl <- map["vUrl"]
        userImageUrl <- map["userImageUrl"]
        time <- map["time"]
    }
}

class Profile: NSObject, Mappable
{
    var userImageUrl : String?
    var userName : String?
    var title : String?
    var description1 : String?
    var posts :[post]?
    

    required init?(map: Map)
    {}

    func mapping(map: Map)
    {
        userImageUrl <- map["userImageUrl"]
        userName <- map["userName"]
        title <- map["title"]
        description1 <- map["description"]
        posts <- map["posts"]
    }
}

class post: NSObject, Mappable
{
    var id : String?
    var userImageUrl : String?
    
    required init?(map: Map)
    {}

    func mapping(map: Map)
    {
        id <- map["id"]
        userImageUrl <- map["userImageUrl"]
    }
}


