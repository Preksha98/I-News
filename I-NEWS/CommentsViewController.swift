//
//  CommentsViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 14/02/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return c.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "commcell") as! CommentsTableViewCell
        cell.lblcomm.text = c[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
        
        
    }
    
    
    var h = ""
    var cnid = ""
    
    var r = [String]()
    var l = [String]()
    var c = [String]()
  var n = [String]()
    
    
    @IBOutlet weak var txtcomm: UITextField!
   
    @IBOutlet weak var commtableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 POST_Data()
        commtableview.dataSource = self
        
    }
        func POST_Data() -> Void
        {
            //Make ADDRESS URL
            let reqUrl = URL(string: url1 + "newscomm_view.php")
            var rid = UserDefaults.standard.integer(forKey: "Rid");
            
            
            //GET DATA FROM TEXT FIELD AND PUT INTO DICTIONARY on KEY NAME
            let reqDict = ["id":cnid]
            
            do {
                
                //DICTIONARY  FORMATE CONVERT JSON FORMATE WITH JSONSERIALIZABLE
                let reqData = try JSONSerialization.data(withJSONObject: reqDict, options: .prettyPrinted)
                
                //FOR URL REQUEST
                var request = URLRequest(url: reqUrl!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60)
                
                //REQUEST HTTP METHOD
                request.httpMethod = "POST"
                
                //REQUEST DATA HTTPBODY JSON
                request.httpBody = reqData
                
                //REQUEST SETVALUE
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
                //SESSION
                let session = URLSession.shared
                
                let task = session.dataTask(with: request, completionHandler: { (resData, response, error) in
                    if (error != nil){
                        print(error.debugDescription)
                    }else{
                        do {
                            
                            let resDict = try JSONSerialization.jsonObject(with: resData!, options: .allowFragments)
                            print(resDict)
                            
                            DispatchQueue.main.async(execute:{
                                self.parsdata(res2: resDict as! [String : Any])
                                // self.parsdata(result: resDict as! [String : Any])
                                
                            }
                                
                                
                            )
                            
                            
                            
                        }catch{
                            print(exception())
                        }
                    }
                })
                task.resume()
            }
            catch{
                print(exception())
            }
            
        }
        
        func parsdata(res2 : [String:Any])
        {
            var arr = res2["response"] as! [[String:Any]]
            for res in arr
            {
                var co = res["comments"] as? String
                          c.append(co!)
                print(c)
            }
              commtableview.reloadData()
            //var id1 = res["id"] as! Int
            
            
            //         var arr = res1["response"] as! [[String:Any]]
            //
            //        for res in arr
            //        {
            //            var cid = res["Commid"] as? String
            //            l.append(cid!)
            //            print(l)
            //
            //            var ri = res["Rid"] as? String
            //            r.append(ri!)
            //            print(r)
            //
            //
            //            var nid = res["Nid"] as? String
            //            n.append(nid!)
            //            print(n)
            //
            //
            //
            //          var co = res["comments"] as? String
            //            c.append(co!)
            //        print(c)
            
            
        }
        
        
        
    

        
        
        
        
        
        
        
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnaddcomm(_ sender: Any) {
        
        
        POST_Data1()
        
    }
    
    func POST_Data1() -> Void
    {
        //Make ADDRESS URL
        let reqUrl = URL(string: url1 + "commentsinsert.php")
        var rid = UserDefaults.standard.integer(forKey: "Rid");
        
        
        //GET DATA FROM TEXT FIELD AND PUT INTO DICTIONARY on KEY NAME
        let reqDict = ["Rid":rid,"Nid":cnid,
                       "comments":txtcomm.text!] as [String : Any]
        
        do {
            
            //DICTIONARY  FORMATE CONVERT JSON FORMATE WITH JSONSERIALIZABLE
            let reqData = try JSONSerialization.data(withJSONObject: reqDict, options: .prettyPrinted)
            
            //FOR URL REQUEST
            var request = URLRequest(url: reqUrl!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60)
            
            //REQUEST HTTP METHOD
            request.httpMethod = "POST"
            
            //REQUEST DATA HTTPBODY JSON
            request.httpBody = reqData
            
            //REQUEST SETVALUE
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            //SESSION
            let session = URLSession.shared
            
            let task = session.dataTask(with: request, completionHandler: { (resData, response, error) in
                if (error != nil){
                    print(error.debugDescription)
                }else{
                    do {
                        
                        let resDict = try JSONSerialization.jsonObject(with: resData!, options: .allowFragments)
                        print(resDict)
                        
                        DispatchQueue.main.async(execute:{
                            self.parsdata1(res1: resDict as! [String : Any])
                            // self.parsdata(result: resDict as! [String : Any])
                            
                        }
                            
                            
                        )
                        
                        
                        
                    }catch{
                        print(exception())
                    }
                }
            })
            task.resume()
        }
        catch{
            print(exception())
        }
        
    }
    
    func parsdata1(res1 : [String:Any])
    {
        var msg = res1["msg"] as? String
        print(msg)
        if msg == "commented"
        {
            // performSegue(withIdentifier: "home", sender: nil)
        }
        else{
            
        }
        
         //var id1 = res["id"] as! Int
        
        
//         var arr = res1["response"] as! [[String:Any]]
//
//        for res in arr
//        {
//            var cid = res["Commid"] as? String
//            l.append(cid!)
//            print(l)
//
//            var ri = res["Rid"] as? String
//            r.append(ri!)
//            print(r)
//
//
//            var nid = res["Nid"] as? String
//            n.append(nid!)
//            print(n)
//
//
//
//          var co = res["comments"] as? String
//            c.append(co!)
//        print(c)
        
            
        }
    
    
    
   

}
