//
//  PlayViewController.swift
//  P5-Quiz
//
//  Created by Adrian on 05/11/2018.
//  Copyright © 2018 Adrian. All rights reserved.
//

import UIKit
import Foundation

class PlayViewController: UIViewController {

    var model = Model()
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerText: UITextField!
    @IBOutlet weak var quizImage: UIImageView!
    
    var myQuiz : Quiz? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Responda:"
        questionLabel.text = myQuiz?.question
        
    }

    @IBAction func playOnTapped(_ sender: UIButton) {
        play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Tips"{
            let ttvc = segue.destination as! TipsTableViewController
            
            ttvc.myTips = myQuiz?.tips
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // Get the value in the text field get teh data contentes,
    // do the call, and present an alert
    func play(){
        
        let answerString = answerText.text
//        if (answerText.text == "Optional("")") {
//            answerString = ""
//        }
        let replaced = answerString?.replacingOccurrences(of: " ", with: "+")
        
        print(replaced)
        let urls = "\(model.apiURL)\(model.quizzesURL)/1/check?answer=\(replaced!)&token=\(model.myToken)" // Create the path
        print(urls)
        //print("1 Path to decode \(path)")
        guard let url = URL(string: urls) else {
            print("Bad Url")
            return
            
        } // Unwrap the url
        
        DispatchQueue.global().async{
            if let data = try? Data(contentsOf: url){
                // If bad, if gives a nil
                // print("!!!!!!!!!!")
                let decoder = JSONDecoder()
                if let answer = try? decoder.decode(Answer.self, from: data) {
                    // print(authorsDown)
                    // If there are more quizzes it gets them
                    DispatchQueue.main.async {
                        if (!answer.result) {
                            print("alert")
                            let alert = UIAlertController(title: "Fallaste", message: "Más bien pensaba en otra respuesta. . .", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title:"ok", style:.default, handler: {(aa :UIAlertAction) in print("")}))
                            self.present(alert, animated: true)
                        } else {
                            
                            let alert2 = UIAlertController(title: "Correcto", message: "Eres un campeón", preferredStyle: .alert)
                            alert2.addAction(UIAlertAction(title:"ok", style:.default, handler: {(aa :UIAlertAction) in print("")}))
                            self.present(alert2, animated: true)
                        }
                    }
                }
                // print("Quit")
            }
        }
    }
        

    }

