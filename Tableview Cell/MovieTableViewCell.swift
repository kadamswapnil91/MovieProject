//
//  MovieTableViewCell.swift
//  SwiftyJson Work
//
//  Created by Apple on 12/05/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var lbl_MovieOverview: UILabel!
    @IBOutlet weak var lbl_MovieName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
