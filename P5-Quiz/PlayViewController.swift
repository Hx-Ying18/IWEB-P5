//
//  PlayViewController.swift
//  P5-Quiz
//
//  Created by Adrian on 05/11/2018.
//  Copyright © 2018 Adrian. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerText: UITextField!
    
    @IBOutlet weak var quizImage: UIImageView!
    
    @IBOutlet weak var checkButton: UILabel!
    
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
        
        if true {
            print("alert")
            let alert = UIAlertController(title: "Fallaste", message: "Más bien pensaba en otra respuesta. . .", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"ok", style:.default, handler: {(aa :UIAlertAction) in print("")}))
            present(alert, animated: true)
        } else {
        
        let alert2 = UIAlertController(title: "Correcto", message: "Eres un campeón", preferredStyle: .alert)
        alert2.addAction(UIAlertAction(title:"ok", style:.default, handler: {(aa :UIAlertAction) in print("")}))
        present(alert2, animated: true)
        }
    }

}
