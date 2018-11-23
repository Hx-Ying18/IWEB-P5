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

    @IBOutlet weak var starButton: UIButton!
    
    var id : Int = 0
    
    //Encender el favorito
    // volver a poner
    var closureOn : () -> () = {}
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func favTap(_ sender: UIButton) {
        if let mitabla = superview as? UITableView  {
            if let ip = mitabla.indexPath(for: self)  {
                print(ip)
                
               }
             }
            
            
//        let star = quizStar.image ? UIImage(named: "starOn") : UIImage(named: "starOff")
//        cell.starButton.setImage(star, for: .normal)
        //Put
        //Users/())/favourites/:quizId
    }
}
