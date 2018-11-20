//
//  QuizzesPageTableViewController.swift
//  P5-Quiz
//
//  Created by Adrian on 04/11/2018.
//  Copyright © 2018 Adrian. All rights reserved.
//

import UIKit

class QuizzesPageTableViewController: UITableViewController {

    var model = Model()
    var imagesCache = [String:UIImage]()
    
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.title = "Todos los Quizzes"
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // Initial load
        updateQuizPage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.quizzesAll.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Quiz Cell", for: indexPath)
        
        // print(model.authors ?? "")
        let quiz = model.quizzesAll[indexPath.row]
        cell.textLabel?.text = quiz.author?.username ?? "Anónimo"
        // print(quiz.author?.username)
        cell.detailTextLabel?.text = quiz.question
        //cell.imageView?.image = UIImage(named: .icon)
        
        // Only if quiiz have attachment it can be downloaded
        if let imgUrl = model.quizzesAll[indexPath.row].attachment?.url {
            if let img = imagesCache[imgUrl] {
                cell.imageView?.image = img
            } else {
                cell.imageView?.image = UIImage(named: "none")
                download(imgUrl, for: indexPath)
            }
        }
        return cell
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Lets Play"){
            let pvc = segue.destination as! PlayViewController
            
            if let ip = tableView.indexPathForSelectedRow{
                pvc.myQuiz = model.quizzesAll[ip.row]
            }
        }
        else {}
    }
    
    func updateQuizPage(){
        DispatchQueue.main.async {
            self.refreshButton.isEnabled = false
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        downloadQuizzes()
        DispatchQueue.main.async {
            self.refreshButton.isEnabled = true
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        
    }

    @IBAction func refreshTap(_ sender: UIBarButtonItem) {
        updateQuizPage()
    }
    
    func downloadQuizzes(){
        
        // In the mian is reset the table
        DispatchQueue.main.async {
            self.model.quizzesAll = []
            self.tableView.reloadData()
        }
        
        //        let session = URLSession.shared // Create a session
        download(pagenoIn : 1)
    }
    
    func download(pagenoIn : Int){
        
        //        let session = URLSession.shared // Create a session
        var pageno : Int = pagenoIn// NUmber of the page
        let path = "\(model.apiURL)\(model.quizzesURL)?token=\(model.myToken)&pageno=\(pageno)" // Create the path
        //print("1 Path to decode \(path)")
        guard let url = URL(string: path) else {
            print("Bad Url")
            return
            
        } // Unwrap the url
        
        DispatchQueue.global().async{
            if let data = try? Data(contentsOf: url){
                // If bad, if gives a nil
                // print("!!!!!!!!!!")
                let decoder = JSONDecoder()
                if let quizzesPage = try? decoder.decode(QuizPage.self, from: data) {
                    // print(authorsDown)
                    // If there are more quizzes it gets them
                    if quizzesPage.nextUrl != "" {
                        DispatchQueue.main.async {
                            //print("2!!!!!!!!!!")
                            self.model.quizzesAll.append(contentsOf: quizzesPage.quizzes) // EL count celdas se hace sobre él
                            self.tableView.reloadData()
                            pageno += 1 // Tp the next page
                            //print("2 Pageno after saving \(pageno)")
                            // Se tiene que meter dentro de la cola para que no haya condiciones de carrera
                            // Mete el que se ha calculado
                            //print("3 Pageno request \(pageno)")
                            self.download(pagenoIn: pageno)
                        }
                        
                    }
                    // print("Quit")
                }
            }
        }
    }
    
    // Download an image
    func download(_ urls: String, for indexPath: IndexPath){
        
        DispatchQueue.global().async{
            print("Downloading")
            if let url = URL(string: urls),
                let data = try? Data(contentsOf: url),
                let img = UIImage(data: data){
                DispatchQueue.main.async {
                    self.imagesCache[urls] = img
                    // Not to reload all the data only the specific rows.
                    self.tableView.reloadRows(at: [indexPath], with: .fade)
                }
            } else{
                print("Bad downloading")
            }
            
        }
    }
    
    
}
