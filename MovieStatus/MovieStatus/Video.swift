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
    var input:[String] = []
}

