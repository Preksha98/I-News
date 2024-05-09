//
//  GamesViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 08/01/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
//    var const = "https://itunes.apple.com/in/app/"
//    var g = ["supercars-racing/id927395373?mt=12","sudoku-epic/id409379399?mt=12","happy-chef-2/id642316071?mt=12","motorbike/id529135494?mt=12"]
    var url = ""
  var i = [String]()
    var u = [String]()
    var nm = [String]()
    var g = [String]()
    var upimg = [UIImage]()
    @IBOutlet weak var gameview: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return i.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "gamecell") as! GameTableViewCell
        cell.gamelbl.text = nm[indexPath.row]
        //cell.gameimg.image = UIImage(named: (i[indexPath.row]  + ".jpeg"))
            var u1 = url1 + i[indexPath.row]
        let reqUrl = URL(string:u1)
        
        let data = NSData(contentsOf: reqUrl!)
        if data != nil
        {
            cell.gameimg.image =  UIImage(data:data as! Data)
        }
        return cell
        
        
        
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        url = u[indexPath.row]
        performSegue(withIdentifier: "Gamesurl", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! WebViewController
        vc.urlname = url
    }
    override func viewDidLoad() {
        super.viewDidLoad()
     POST_Data()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func POST_Data() -> Void
    {
        //Make ADDRESS URL
        let reqUrl = URL(string: url1 + "game.php")
        
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
                            self.parsdata(res1: resDict as! [String : Any])
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
    
    func parsdata(res1 : [String:Any])
    {
        
        var arr = res1["response"] as! [[String:Any]]
        for res in arr
        {
            var id = res["gameid"] as? String
            g.append(id!)
            print(g)
           
            
            
            var n = res["name"] as? String
            nm.append(n!)
            print(nm)
        
            
            
            var ur = res["url"] as? String
            u.append(ur!)
            print(u)
            
            
            
            var image = res["image"] as? String
            i.append(image!)
            
            print(i)
            
//            var ui = res["Imageupload"] as? UIImage
//            upimg.append(ui!)
//
//
            
        }
       gameview.reloadData()
    }
    

   
}
