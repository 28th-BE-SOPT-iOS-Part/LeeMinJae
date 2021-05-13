//
//  FifthTabCollectionViewCell.swift
//  iosAssignment1
//
//  Created by 민 on 2021/05/03.
//

import UIKit

class FifthTabCollectionViewCell: UICollectionViewCell {
    
    static let identifier : String = "FifthTabCollectionViewCell"
    
    @IBOutlet weak var talkButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setData(name : String)
    {
        titleLabel.text = name
    }
}
