//
//  News_viewViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 04/01/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

protocol commentsdata {
    func Comm(obj : Likesmodal)
}

var consturl = "https://exasperated-sponsor.000webhostapp.com/api/"
class News_viewViewController: UIViewController , UITableViewDelegate , UITableViewDataSource,commentsdata{
   
    var ncid = ""
    
    //@IBOutlet weak var citxt: UITextField!
    func Comm(obj: Likesmodal) {
        ncid = obj.id
        print(obj.id)
        performSegue(withIdentifier: "go", sender: nil)
    }
    
   
    
    
    @IBOutlet weak var mytableview: UITableView!
    var l = [String]()
    var r = [String]()
    var n = [String]()
    var i = [String]()
    var rid = [String]()
     var cid = [String]()
    var d = [String]()
     var lat = [String]()
     var long = [String]()
     var a = [String]()
    var c = [String]()
    var img = [String]()
    
    var arrModal = [Likesmodal]()
    
    var p = [String]()
    var q = [String]()
    var z = [String]()
    var w = [String]()
    
   
    @IBOutlet weak var txtfilter: UITextField!
    
    
    
    
    @IBAction func btnfilter(_ sender: Any) {
        
        
        POST_Data()
        
        
        
        
    }
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrModal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "newsviewcell") as! NewsviewTableViewCell
        var o = arrModal[indexPath.row]
        
        cell.newsview.text = o.des
        
        let reqUrl = URL(string: consturl + o.im)
        let data = NSData(contentsOf: reqUrl!)
        if data != nil
        {
            cell.imgnv.image =  UIImage(data:data as! Data)
            
        }
        
        cell.obj = self
        cell.object = o
      //  cell.imgnv.image = im[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 534
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
         //POST_Data()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func POST_Data() -> Void
    {
        //Make ADDRESS URL
        let reqUrl = URL(string: url1 + "news_view.php")
        
        //GET DATA FROM TEXT FIELD AND PUT INTO DICTIONARY on KEY NAME
        let reqDict = ["City" : txtfilter.text];
        
        
        do {
            
            //DICTIONARY  FORMATE CONVERT JSON FORMATE WITH JSONSERIALIZABLE
          let reqData = try JSONSerialization.data(withJSONObject: reqDict, options: .prettyPrinted)
            
            //FOR URL REQUEST
            var request = URLRequest(url: reqUrl!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 180)
            
            //REQUEST HTTP METHOD
            request.httpMethod = "GET"
            
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
       
        var arr = res1["response"] as! [[String:Any]]
        for res in arr
        {
            
            var obj = Likesmodal()
            obj.id =  (res["Nid"] as? String)!
            obj.idr = (res["Rid"] as? String)!
            obj.idc = (res["Cid"] as? String)!
            obj.des = (res["Description"] as? String)!
            obj.lat = (res["Latitude"] as? String)!
            obj.lon = (res["Longitude"] as? String)!
            obj.ar = (res["Area"] as? String)!
            obj.ci = (res["City"] as? String)!
            obj.im = (res["Image"] as? String)!
            obj.status = (res["Status"] as? String)!
            
            
            arrModal.append(obj)
            
            
            
            
//        var id =
//        i.append(id!)
//        print(i)
//
//        var idr = res["Rid"] as? String
//        rid.append(idr!)
//        print(rid)
//
//        var idc =
//        cid.append(idc!)
//        print(i)
//
//        var des =
//        d.append(des!)
//        print(d)
//
//
//        var latitude =
//        lat.append(latitude!)
//        print(lat)
//
//
//        var longitude =
//        long.append(latitude!)
//        print(long)
//
//        var area =
//        a.append(area!)
//        print(a)
//
//        var city =
//        c.append(city!)
//        print(c)
//
//
//
//                    var image =
//            img.append(image!)
//
//                    print(img)
//
        
       }
        mytableview.reloadData()
    }
    
    
    @IBAction func like(_ sender: Any) {
        
        POST_Datalikes()
        
        
    }
        
        
        func POST_Datalikes() -> Void
        {
            //Make ADDRESS URL
            let reqUrl = URL(string: url1 + "likesnews_view.php")
            
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
                                self.pars(res1: resDict as! [String : Any])
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
    
            
            
            func pars(res1 : [String:Any])
            {
                
                var arr = res1["response"] as! [[String:Any]]
                for res in arr
                {
                    var lid = res["Lid"] as? String
                    l.append(lid!)
                    print(l)
                    
                    var ri = res["Rid"] as? String
                    r.append(ri!)
                    print(rid)
                    
                    var nid = res["Nid"] as? String
                    n.append(nid!)
                    print(i)
                    
                  
                    
                    
                  
                    
                }
                
            }
            
    
    
            @IBAction func comments(_ sender: Any) {
                
              //  POST_Datacomm()
                
    }
    
    
    func POST_Datacomm() -> Void
    {
        //Make ADDRESS URL
        let reqUrl = URL(string: url1 + "newscomm_view.php")
        
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
                            self.pars1(res1: resDict as! [String : Any])
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
    
    
    
    func pars1(res1 : [String:Any])
    {
        
        var arr = res1["response"] as! [[String:Any]]
        for res in arr
        {
            var o = res["Commid"] as? String
            p.append(o!)
            print(p)
            
            var x = res["Rid"] as? String
            q.append(x!)
            print(q)
            
            var y = res["Nid"] as? String
            z.append(y!)
            print(z)
            
            
            var m = res["comments"] as? String
            w.append(m!)
            print(w)
            
            
            
            
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
     
        let vc = segue.destination as! CommentsViewController
        vc.cnid = ncid
        
        
     
    }
    
    
   
}



