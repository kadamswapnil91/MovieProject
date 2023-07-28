//
//  JsonModel.swift
//  SwiftyJson Work
//
//  Created by Apple on 10/05/21.
//

import Foundation

struct JsonModel{
    var title: String = ""
    var overview: String = ""
    var poster_path: String = ""
    var release_date: String = ""
    var backdrop_path: String = ""
    var vote_average: String = ""
    init(){
        
    }
    
    init(json:JSON){
        title = json["title"].stringValue
        overview = json["overview"].stringValue
        poster_path = json["poster_path"].stringValue
        release_date = json["release_date"].stringValue
        backdrop_path = json["backdrop_path"].stringValue
        vote_average = json["vote_average"].stringValue
        
    }
}
