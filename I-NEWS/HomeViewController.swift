//
//  HomeViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 18/10/18.
//  Copyright © 2018 Prexa Patel. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController ,  UITableViewDataSource , UITableViewDelegate {
    
    
    var name = ["News"  , "Games" , "Sports" ,"Business","Entertainment","science","Upload News" , " UploadBlogs","Uploadednews","Uploadedblogs"]
    var image = ["2" , "3" , "4" , "1","4","6" ,"3","8","1","7"]
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "mycell") as! HomeTableViewCell
        cell.catename.text = name[indexPath.row]
        cell.myimg.image = UIImage(named: (image[indexPath.row]  + ".jpg"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
        
        
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
            performSegue(withIdentifier: "news", sender: nil)
        }
//        if indexPath.row == 1
//        {
//            performSegue(withIdentifier: "blogs", sender: nil)
//        }
        if indexPath.row == 1
        {
            performSegue(withIdentifier: "games", sender: nil)
        }
        if indexPath.row == 2
        {
            performSegue(withIdentifier: "sports", sender: nil)
        }
        if indexPath.row == 3
        {
            performSegue(withIdentifier: "business", sender: nil)
        }
        if indexPath.row == 4
        {
            performSegue(withIdentifier: "entertainment", sender: nil)
        }
        
        if indexPath.row == 5
        {
            performSegue(withIdentifier: "science", sender: nil)
        }
//        if indexPath.row == 6
//        {
//            performSegue(withIdentifier: "technology", sender: nil)
//        }
        if indexPath.row == 6
        {
            performSegue(withIdentifier: "uploadnews", sender: nil)
        }
        if indexPath.row == 7
        {
            performSegue(withIdentifier: "uploadblogs", sender: nil)
        }
    
        if indexPath.row == 8
        {
            performSegue(withIdentifier: "viewnews", sender: nil)
        }
        if indexPath.row == 9
        {
            performSegue(withIdentifier: "viewblogs", sender: nil)
        }
        
        
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
