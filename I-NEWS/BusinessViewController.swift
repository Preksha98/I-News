//
//  BusinessViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 31/03/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

class BusinessViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    
    @IBOutlet weak var busineestableview: UITableView!
    var cont = ""
    var t = [Int]()
    //    var i = ["rose","rose","rose"]
    var author = [String]()
    var s = [String]()
    var name = [String]()
    var id = [String]()
    var ti = [String]()
    var u = [String]()
    var pub = [String]()
    var ui = [String]()
    var des = [String]()
    var c = [String]()
   
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return ti.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "businesscell") as! BusinessTableViewCell
        cell.businesslbl.text = ti[indexPath.row]
        //        cell.simg.image = UIImage(named: (ti[indexPath.row] + ".jpg"))
        
        let reqUrl = URL(string:ui[indexPath.row])
        let data = NSData(contentsOf: reqUrl!)
        if data != nil
        {
            cell.businessimg.image =  UIImage(data:data as! Data)
        }
        
        return cell
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 575
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cont = c[indexPath.row]
        print(cont)
        performSegue(withIdentifier: "bucontent", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! BusinesscontentViewController
        vc.tb = cont
        
        
    }

    @IBOutlet weak var businessimg: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
POST_Data()
        // Do any additional setup after loading the view.
    }
    

    
    
    
    func POST_Data() -> Void
    {
        //Make ADDRESS URL
        let reqUrl = URL(string: "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=68837ddffe7343d69a232fba9e7fc178")
        
        
        //GET DATA FROM TEXT FIELD AND PUT INTO DICTIONARY on KEY NAME
        //        let reqDict = ["Nid":"","Rid":"" ,"Cid":"","Description":"","Latitude":"" ,"Longitude":""  ,"Area":"" ,"City":"", "Image": "" ] as [String : Any];
        
        
        do {
            
            //DICTIONARY  FORMATE CONVERT JSON FORMATE WITH JSONSERIALIZABLE
            //  let reqData = try JSONSerialization.data(withJSONObject: reqDict, options: .prettyPrinted)
            
            //FOR URL REQUEST
            var request = URLRequest(url: reqUrl!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60)
            
            //REQUEST HTTP METHOD
            request.httpMethod = "GET"
            
            //REQUEST DATA HTTPBODY JSON
            // request.httpBody = reqData
            
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
                            self.dataparsdata(res1: resDict as! [String : Any])
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
        
    }//var arr = res1["response"] as! [[String:Any]]
    
    func dataparsdata(res1:[String:Any])
    {
        
        var status = res1["status"] as! String
        s.append(status)
        print(s)
        
        var tr = res1["totalResults"] as! Int
        t.append(tr)
        print(t)
        
        var  arti = res1["articles"] as? [[String:Any]]
        
        
        for res in arti! {
            
            
            if let so = res["source"] as? [String:Any]
            {
                if let i = so["id"] as? String
                {
                    id.append(i)
                    print(id)}
                
                
                
                if let n = so["name"] as? String{
                    name.append(n)
                    print(name)
                }
                
            }
            if let au = res["author"] as? String
            {
                author.append(au)
                print(author)
            }
            
            
            
            
            
            if let title = res["title"] as? String
            {
                ti.append(title)
                print(ti)
            }
            
            if let d = res["description"] as? String
            {
                des.append(d)
                print(des)
            }
            if let url = res["url"] as? String{
                u.append(url)
                print(u)
            }
            
            
            if let urli = res["urlToImage"] as? String{
                
                
                ui.append(urli)
                print(ui)
            }
            
            
            
            if let p = res["publishedAt"] as? String
            { pub.append(p)
                print(pub)}
            
            if let co = res["content"] as? String
            {c.append(co)
                print(c)
            }
            
        }
        busineestableview.reloadData()
    }
    
    
    
    
    
    
    
    
}
