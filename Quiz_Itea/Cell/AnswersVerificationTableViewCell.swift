//
//  AnswersVerificationTableViewCell.swift
//  Quiz_Itea
//
//  Created by Anastasia  Bilous on 2022-06-17.
//

import UIKit

class AnswersVerificationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    @IBOutlet weak var yourAnswerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
