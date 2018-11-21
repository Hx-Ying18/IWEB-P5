//
//  QuizTableViewCell.swift
//  P5-Quiz
//
//  Created by Adrian on 20/11/2018.
//  Copyright © 2018 Adrian. All rights reserved.
//

import UIKit

class QuizTableViewCell: UITableViewCell {

    @IBOutlet weak var quizImage: UIImageView!
    
    @IBOutlet weak var quizStar: UIImageView!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    let starButton = UIButton(type: .system)
    starButton.setImage(starOn, for: .normal)
    starButton.frame = CGRect(x:0, y:0, width: 50, heigth: 50)
    accesortyView = starButton

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
