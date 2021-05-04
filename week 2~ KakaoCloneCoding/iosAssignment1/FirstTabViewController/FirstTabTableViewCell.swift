//
//  FirstTabTableViewCell.swift
//  iosAssignment1
//
//  Created by 민 on 2021/05/02.
//

import UIKit

class FirstTabTableViewCell: UITableViewCell {

    static let identifier: String = "FirstTabTableViewCell"
    
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(imageName : String,
                 name : String,
                 state : String)
    {
        if let image = UIImage(named: imageName)
        {
            friendImageView.image = image
        }
        titleLabel.text = name
        subtitleLabel.text = state
    }
}
