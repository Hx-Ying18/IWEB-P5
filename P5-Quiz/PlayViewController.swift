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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
