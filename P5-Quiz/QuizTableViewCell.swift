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
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var starButton: UIButton!
    
    var indexPathRow : Int = 0
    
    //Encender el favorito
    // volver a poner
    var closureReload : () -> () = {}
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func favTap(_ sender: UIButton) {
        
//        let quiz = Model.quizzesAll[indexPathRow]
//        if (quiz.favourite) {
//            Model.quizzesAll[indexPathRow].favourite = false
//            closureReload
//        }
        
        // DOes not realod properly
        if let mitabla = superview as? UITableView  {
            if let ip = mitabla.indexPath(for: self)  {
                print("Index path \(ip)")
                // NO need to look only to index

                let quiz = Model.quizzesAll[ip.row]
                if (quiz.favourite) {
                    Model.quizzesAll[ip.row].favourite = false
                    mitabla.reloadRows(at: [ip], with: .fade)
                    
                    // starButton.setImage(#imageLiteral(resourceName: "starOff"), for: .normal)
                    // To realod the value
                    //mitabla.reloadData()
//                    if let mitablaController = superview as? QuizzesPageTableViewController{
//                         mitablaController.reloadRows(at: [ip], with: .fade)
//                    }
                    let urlDelete = "\(Model.apiURL)/users/tokenOwner/favourites/\(Model.quizzesAll[ip.row].id)?token=\(Model.myToken)"
                    deleteFavourites(urlDelete)
                    print("\(Model.apiURL)/users/tokenOwner/favourites/\(Model.quizzesAll[ip.row].id)?token=\(Model.myToken)")
                    
                }
                else  {
                    Model.quizzesAll[ip.row].favourite = true
                    //starButton.setImage(#imageLiteral(resourceName: "starOn"), for: .normal)
                    mitabla.reloadRows(at: [ip], with: .fade)
                    let urlPut = "\(Model.apiURL)/users/tokenOwner/favourites/\(Model.quizzesAll[ip.row].id)?token=\(Model.myToken)"
                    putFavourites(urlPut)
                }
//
////                for quiz in Model.quizzesAll {
////                    // It has been filled with the indexPath.row
////                    if(quiz.id ==
//
               }
             }
            
            
//        let star = quizStar.image ? UIImage(named: "starOn") : UIImage(named: "starOff")
//        cell.starButton.setImage(star, for: .normal)
        //Put
        //Users/())/favourites/:quizId
    }
    
    func putFavourites(_ urls : String) {
        DispatchQueue.global().async{
            let url = URL(string: urls)
            var request = URLRequest(url: url!)
            request.httpMethod = "PUT"
            let task = URLSession.shared.dataTask(with: request){
                data, response, error in
                guard let data = data, error == nil else{
                    print("error=\(error)")
                    return
                }
                
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(response)")
                }
                
                let responseString = String(data: data, encoding: .utf8)
                print("responseString = \(responseString)")
            }
            task.resume()
            
        }
    }
    func deleteFavourites(_ urls : String) {
        DispatchQueue.global().async{
            let url = URL(string: urls)
            var request = URLRequest(url: url!)
            request.httpMethod = "DELETE"
            let task = URLSession.shared.dataTask(with: request){
                data, response, error in
                guard let data = data, error == nil else{
                    print("error=\(error)")
                    return
                }
                
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(response)")
                }
                
                let responseString = String(data: data, encoding: .utf8)
                print("responseString = \(responseString)")
            }
            task.resume()
            
        }
    }
}
