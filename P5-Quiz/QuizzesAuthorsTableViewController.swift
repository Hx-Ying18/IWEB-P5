//
//  QuizzesAuthorsTableViewController.swift
//  P5-Quiz
//
//  Created by Adrian on 03/11/2018.
//  Copyright © 2018 Adrian. All rights reserved.
//

import UIKit

class QuizzesAuthorsTableViewController: UITableViewController {

    
    let apiURL = "https://quiz2019.herokuapp.com/api"
    let usersURL = "/users"
    let myToken = "15285c6fd5a9426d00fb"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //// It is get the athours array
        // 1. It is used a Data Task pattern to do a get transaction over HTTPS: this gives a data object
        
        let session = URLSession.shared // Create a session
        UIApplication.shared.isNetworkActivityIndicatorVisible = true // SHow activity
        let path = "\(apiURL)\(usersURL)?token=\(myToken)" // Create the path
        guard let url = URL(string: path) else { return } // Unwrap the url
        
        // Create the task
        let task = session.dataTask(with: url){ (data: Data?,
                                                 response: URLResponse?,
                                                 error: Error?) in
            if error == nil && (response as! HTTPURLResponse).statusCode == 200 { // If there are no errors in the connection
                
                guard let data = data else { return } //unwrap the value data
                let dataAsString = String(data: data,
                                                   encoding: .utf8 )
                print(dataAsString)
            }
            
        }
        
        task.resume()
        
//        do {
//            let task = session.dataTask(with: url){
//                (data: Data?,
//                response: URLResponse?,
//                error: Error?) in
//                if error == nil && (response as! HTTPURLResponse).statusCode == 200 {
//                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableCOntainers)
//                    { print(json)
//                    }
//                }
//            }
//        } catch let jsonErr{}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

}
