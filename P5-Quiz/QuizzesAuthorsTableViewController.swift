//
//  QuizzesAuthorsTableViewController.swift
//  P5-Quiz
//
//  Created by Adrian on 03/11/2018.
//  Copyright © 2018 Adrian. All rights reserved.
//

import UIKit


class QuizzesAuthorsTableViewController: UITableViewController {    
    
    // let model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.title = "Autores de los Quizzes"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // When it is loaded authors are loaded
        downloadAuthors()
        
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
        
        // When view did load initially call this download
        return Model.authors.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Author Cell", for: indexPath)

        // print(model.authors ?? "")
        let author = Model.authors[indexPath.row]
        cell.textLabel?.text = author.username

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
    
    // Download quiz page and realod data in table view
//    func updateAuthors() {
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true // SHow activity
//        model.downloadAuthors()
//        DispatchQueue.main.async {
//            UIApplication.shared.isNetworkActivityIndicatorVisible = false
//            self.tableView.reloadData()
//        }
//    }

    // Stores a new downloaded value author
    func downloadAuthors() {
        
        //        let session = URLSession.shared // Create a session
        let path = "\(Model.apiURL)\(Model.usersURL)?token=\(Model.myToken)" // Create the path
        guard let url = URL(string: path) else {
            print("Bad Url")
            return
            
        } // Unwrap the url
        
        DispatchQueue.global().async{
            if let data = try? Data(contentsOf: url){
                // If bad, if gives a nil
                // print("!!!!!!!!!!")
                let decoder = JSONDecoder()
                if let authorsDown = try? decoder.decode([Author].self, from: data) {
                    // print(authorsDown)
                    DispatchQueue.main.async {
                        // print("2!!!!!!!!!!")
                        Model.authors = authorsDown
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }

        // As download blocks, it is done in anotehr thread.
//        DispatchQueue.global().async{
//            if let data = try? Data(contentsOf: url){
//                // If bad, if gives a nil
//
//                if let authorsSerialized = (try? JSONSerialization.jsonObject(with: data)) as? [Author] {
//                    DispatchQueue.main.async {
//                        self.model.authors = authorsSerialized
//                        self.tableView.reloadData()
//                    }
//                }
//            }
//        }
//    }
//        let task = session.dataTask(with: url){ (data: Data?,
//            response: URLResponse?,
//            error: Error?) in
//            if error == nil && (response as! HTTPURLResponse).statusCode == 200 { // If there are no errors in the connection
//
//                guard let data = data else { return } //unwrap the value data
//                //                let dataAsString = String(data: data,
//                //                                                   encoding: .utf8 )
//                //                print(dataAsString)
//
//                do{
//                    self.authors = try JSONDecoder().decode([Author].self, from: data)
//                    // print(self.authors)
//                }catch let jsonErr {
//                    print("Error serializing json", jsonErr)
//                }
//            } else { print("Error downloading") }
//
//        }
//
        


 
}
