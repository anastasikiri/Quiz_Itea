//
//  RatingQuizTableViewCell.swift
//  Quiz_Itea
//
//  Created by Anastasia  Bilous on 2022-06-18.
//

import UIKit

class RatingQuizTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameParticipantLabel: UILabel!
    @IBOutlet weak var scoreParticipantLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
