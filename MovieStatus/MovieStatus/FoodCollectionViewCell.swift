//
//  FoodCollectionViewCell.swift
//  MovieStatus
//
//  Created by xszhao on 2017-03-25.
//  Copyright © 2017 xszhao. All rights reserved.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {
    var input: UILabel!
    
    override func awakeFromNib() {
        input = UILabel(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: 210))
        input.lineBreakMode = .byWordWrapping // or NSLineBreakMode.ByWordWrapping
        input.numberOfLines = 0
        contentView.addSubview(input)
    }
    
}
