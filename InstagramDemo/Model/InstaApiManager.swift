//
//  InstaApiManager.swift
//  InstagramDemo
//
//  Created by mysmac_adm!n on 20/01/20.
//  Copyright © 2020 Mridula. All rights reserved.
//

import Foundation
import ObjectMapper

class InstaApiManager : ApiManager
{
    typealias getPostDetailsCallback = (DataModel?, Error?) -> Void
    class func getPostDetails(onCompletion: @escaping getPostDetailsCallback)
    {
        
       
        if let Response = Mapper<DataModel>().map(JSONString: data){
            onCompletion(Response, nil)
            }
     }
    
    
    typealias getProfileDetailsCallback = (Profile?, Error?) -> Void
    class func getProfileDataDetails(onCompletion: @escaping getProfileDetailsCallback)
    {
        if let Response = Mapper<Profile>().map(JSONString: UserData){
            onCompletion(Response, nil)
            }
     }
}




