//
//  JsonModel.swift
//  SwiftyJson Work
//
//  Created by Apple on 10/05/21.
//

import Foundation

struct JsonModel{
    var title: String = ""
//    var trackCensoredName: String = ""
//    var artworkUrl100: String = ""
    init(){
        
    }
    
    init(json:JSON){
        title = json["title"].stringValue
//        trackCensoredName = json["trackCensoredName"].stringValue
//        artworkUrl100 = json["artworkUrl100"].stringValue
    }
}
