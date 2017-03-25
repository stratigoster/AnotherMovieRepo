//
//  Video.swift
//  MovieStatus
//
//  Created by xszhao on 2017-03-25.
//  Copyright © 2017 xszhao. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: Date?
    var overView: String?
    var popularity: String?
    
    var channel: Channel?
    var desc: DetailModel?
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}

class DetailModel: NSObject {
    
    var vote_average:Double?
    var budget: String?
    var genre: [String]?
    var homepage: String?
    var imdb: String?
    var original_language: String?
    var production_companies: [String]?
    var release_date: String?
    var spoken_languages: [String]?
    var tagline: String?
    var average_vote: Double?
    var average_cnt: Double?
    var id: String?
    var status: String?
    var revenue: Double?
    var popularity: String?
    var runtime: Double?
    var title: String?
    var belongs_to_collection: [String]?
    var cnt: Int?
}

