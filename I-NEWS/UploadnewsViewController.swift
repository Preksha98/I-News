//
//  UploadnewsViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 21/12/18.
//  Copyright © 2018 Prexa Patel. All rights reserved.
//

import UIKit
import GooglePlacePicker
class UploadnewsViewController: UIViewController , UINavigationControllerDelegate , UIImagePickerControllerDelegate {
  var im = UIImagePickerController()
    
    @IBOutlet weak var lblarea: UILabel!
    @IBOutlet weak var lblcity: UILabel!
    var txt = [String]()
 var c = ""
    var lid = ""
    
    var lat : Double = 0
    var long : Double = 0
    
    
    
    @IBOutlet weak var unimg: UIImageView!
    @IBOutlet weak var untxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        lid = UserDefaults.standard.value(forKey: "lid") as! String
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onimage(_ sender: Any) {
        
        im.delegate = self
        im.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(im, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let  imagedata = info[UIImagePickerControllerOriginalImage] as? UIImage
        unimg.image = imagedata
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ontext(_ sender: Any) {
        txt.append(untxt.text!)
        
        
    }
    
    @IBAction func upload(_ sender: Any) {
        
        POST_Data()
        
        
    }
    
    
    func POST_Data() -> Void
    {
        //Make ADDRESS URL
        let reqUrl = URL(string: url1 + "news.php")
        
        //GET DATA FROM TEXT FIELD AND PUT INTO DICTIONARY on KEY NAME
        let reqDict = ["rid":lid,"cid":"","description":untxt.text,"latitude":lat ,"longitude": long ,"area":lblarea.text,"city":lblcity.text] as [String : Any];
        
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
                            self.parsdata(res: resDict as! [String : Any])
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
    
    func parsdata(res : [String:Any])
    {
        var msg = res["msg"] as? String
        print(msg)
        if msg == "news successfully added"
        {
            // performSegue(withIdentifier: "home", sender: nil)
        }
        else{
            
        }
        var id1 = res["id"] as! Int
        var i = String(id1)
        postImage(imageId: i)
        
    }
    
    
    func postImage(imageId:String){
        var u = url1 + "newsimageupload.php?id="+imageId
        let reqUrl = URL(string:u)
        
        // let reqUrl = URL(string: "https://hoven-differences.000webhostapp.com/ChildAdopter_Imageupload.php?////id="+imageId)
        
        var request = URLRequest(url: reqUrl! as URL)
        request.httpMethod = "POST"
        let boundary = "xxxxBoundaryStringxxxx"
        
        request.setValue("multipart/form-data; boundary=\(boundary)",
            
            forHTTPHeaderField: "Content-Type")
        
        if (unimg.image == nil)
            
            
            
        { return }
        //        let image_data = UIImagePNGRepresentation(imageofProduct.image!)
        
        
        let image_data = UIImagePNGRepresentation(self.compressImage(unimg.image!))
        
        let body = NSMutableData()
        
        // let fname = "porch-16.png"
        
        
        
        let fname = imageId+".png"
        
        //  let mimetype = "image/png"
        
        
        
        body.append("\r\n--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
        
        
        
        body.append("Content-Disposition:form-data; name=\"fileUpload\"; filename=\"\(fname)\"\r\n".data(using: String.Encoding.utf8)!)
        
        
        
        body.append("Content-Type: application/octet-stream\r\n\r\n".data(using:String.Encoding.utf8)!)
        
        
        
        body.append(image_data!)
        
        
        
        body.append("\r\n".data(using: String.Encoding.utf8)!)
        
        
        
        body.append("--\(boundary)--\r\n".data(using:String.Encoding.utf8)!)
        
        
        
        request.httpBody = body as Data
        
        
        
        let session = URLSession.shared
        
        
        
        let task = session.dataTask(with: request as URLRequest) {
            
            
            
            (data, response, error) in
            
            
            
            guard let _:Data = data, let _:URLResponse = response , error
                
                
                
                == nil else {
                    
                    print("error")
                    
                    return
                    
            }
            
            
            
            let resDict = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            
            
            
            print(resDict);
            DispatchQueue.main.async(execute:{
                
                self.parsdata1(result: resDict as! [String : Any])
                
            }
                
                
            )
            
            
            //            let dataString = String(data: data!, encoding:String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            
            //            print(dataString)
            
            
            
        }
        
        task.resume()
        
    }
    func compressImage(_ image:UIImage) -> UIImage
        
    {
        
        //        var CompressImage : UIImage = image.correctlyOrientedImage()
        
        
        
        var CompressImage
            
            : UIImage = image
        
        var actualHeight = CompressImage.size.height
        
        var actualWidth = CompressImage.size.width
        
        let maxHeight:CGFloat
        
        let maxWidth:CGFloat
        
        maxHeight = 1080
        
        maxWidth =  1920
        
        //        }
        
        //
        
        
        
        var imageRetio:CGFloat = actualWidth/actualHeight
        
        let maxRetio:CGFloat = maxWidth/maxHeight
        
        print(image.imageOrientation)
        
        
        
        let compressionQuality:CGFloat = 1.0   // 0 percent compression
        
        if actualHeight > maxHeight || actualWidth > maxWidth
            
        {
            
            if imageRetio < maxRetio
                
            {
                
                imageRetio = maxHeight/actualHeight
                
                actualWidth = imageRetio * actualWidth
                
                actualHeight = maxHeight
                
            }
                
            else if imageRetio > maxRetio
                
            {
                
                imageRetio = maxWidth/actualWidth
                
                actualWidth = imageRetio * actualHeight
                
                actualHeight = maxWidth
                
                
                
            }
                
            else
                
            {
                
                actualHeight = maxHeight
                
                actualWidth = maxWidth
                
            }
            
            let rect = CGRect(x: 0.0, y: 0.0, width: actualWidth, height: actualHeight)
            
            UIGraphicsBeginImageContext(rect.size)
            
            CompressImage.draw(in: rect)
            
            if CompressImage.imageOrientation == .up
                
            {
                
                print("True")
                
            }
            
            let img = UIGraphicsGetImageFromCurrentImageContext()
            
            let imageData = UIImageJPEGRepresentation(img!, compressionQuality)
            
            UIGraphicsEndImageContext()
            
            CompressImage = UIImage(data:imageData!)!
            
            CompressImage.imageOrientation
            
        }
        
        return CompressImage
        
    }
    
    func parsdata1(result:[String:Any])
    {
        //        if role == "User"
        //        {
        //
        //            performSegue(withIdentifier: "User", sender: nil)
        //        }
        //        else{
        //            performSegue(withIdentifier: "Volunteer", sender: nil)
        //        }
        print("image added")
        
    }
    
    
    @IBAction func addlocation(_ sender: Any) {
        
        
        
        let center = CLLocationCoordinate2D(latitude: 37.788204, longitude: -122.411937)
        let northEast = CLLocationCoordinate2D(latitude: center.latitude + 0.001, longitude: center.longitude + 0.001)
        let southWest = CLLocationCoordinate2D(latitude: center.latitude - 0.001, longitude: center.longitude - 0.001)
        let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        let config = GMSPlacePickerConfig(viewport: viewport)
        let placePicker = GMSPlacePicker(config: config)
        
        placePicker.pickPlace(callback: {(place, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            if let place = place {
                print(place.formattedAddress)
                var arr =  place.formattedAddress?.components(separatedBy: " ")
                
                var c = arr?.count
               
        self.lblcity.text = arr?[c!-4]
                self.lblarea.text = place.formattedAddress
        
                self.lat = place.coordinate.latitude
                self.long = place.coordinate.longitude
                
                
//                self.txtcity.text = arr?[c! - 4]
//                self.txtpin.text = arr?[c! - 2]
//                self.txtadd.text = place.formattedAddress
//
              
            } else {
                // self.nameLabel.text = "No place selected"
                //self.addressLabel.text = ""
            }
        })
        
        
    }
        
        
        
    }
    
    

