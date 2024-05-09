//
//  RegisterViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 18/10/18.
//  Copyright © 2018 Prexa Patel. All rights reserved.
//

import UIKit
import GooglePlacePicker

import IQKeyboardManagerSwift

class RegisterViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate{
var img = UIImagePickerController()
    @IBOutlet weak var lblreg: UILabel!
    @IBOutlet weak var txtnm: UITextField!
    @IBOutlet weak var txtmail: UITextField!
    
    @IBOutlet weak var txtpass: UITextField!
    
    @IBOutlet weak var Rimg: UIImageView!
    //    @IBOutlet weak var rimg: UIImageView!
    @IBOutlet weak var txtcno: UITextField!
    
    @IBOutlet weak var txtadd: UITextField!
    @IBOutlet weak var txtcity: UITextField!
    @IBOutlet weak var txtpin: UITextField!
    
//    rimg = "profileicon"
    
    
    
    
    @IBAction func btnadd(_ sender: Any) {
        
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
                
                self.txtcity.text = arr?[c! - 4]
                self.txtpin.text = arr?[c! - 2]
                self.txtadd.text = place.formattedAddress
                
                // self.nameLabel.text = place.name
                // self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
                //  .joined(separator: "\n")
            } else {
                // self.nameLabel.text = "No place selected"
                //self.addressLabel.text = ""
            }
        })
        
        
    }
    
    
    @IBAction func btnregister(_ sender: Any) {
        
        
        let providedEmailAddress = txtmail.text
        
        
        let isEmailAddressValid = isValidEmailAddress(emailAddressString: providedEmailAddress!)
        
        if isEmailAddressValid
        {
            //print("Email address is valid")
            
            let providepassword = txtpass.text
            let isPasswordValid = isValidPassword(testStr: providepassword!)
            if isPasswordValid
            {
                print("Password correct")
                
                
           // let phone = txtcno.text
                let phoneno = validatecno(value: txtcno.text!)
                if phoneno{
                    print("Cno correct")
                    POST_Data()
                    performSegue(withIdentifier: "home", sender: nil)
                    
                }
                else {
                    print("incorrect contact number")
                    displayAlertMessage(messageToDisplay: "Incorrect Contact Number")
                }
                
           
            }
            
            else{
                                print("incorrect password")
                                displayAlertMessage(messageToDisplay: "Incorrect password")
                            }
            
            
        } else {
            print("Email address is not valid")
            displayAlertMessage(messageToDisplay: "Email address is not valid")
        }
        
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    
    
    
    func validatecno(value: String) -> Bool {
        let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    
    
    
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
            
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
        
    }
    
    func isValidPassword(testStr:String?) -> Bool {
        guard testStr != nil else { return false }
        
        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 6 characters total
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{6,}")
        return passwordTest.evaluate(with: testStr)
   }
    
    
    
    
    
    
    
    
//    @IBAction func imagepick(_ sender: Any) {
//        
//        img.delegate = self
//        img.sourceType = UIImagePickerControllerSourceType.photoLibrary
//        present(img, animated: true, completion: nil)
//        
//    }
//    
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        let  imagedata = info[UIImagePickerControllerOriginalImage] as? UIImage
//        rimg.image = imagedata
//        dismiss(animated: true, completion: nil)
//    }
//   
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            let vc = segue.destination as! UploadnewsViewController
//            vc.c = txtcity.text!
//        
//        
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func POST_Data() -> Void
    {
        //Make ADDRESS URL
        let reqUrl = URL(string: url1 + "registration.php")
        
        //GET DATA FROM TEXT FIELD AND PUT INTO DICTIONARY on KEY NAME
        let reqDict = ["email":txtmail.text,"password":txtpass.text,"no":txtcno.text,"name":txtnm.text,"pincode":txtpin.text,"city":txtcity.text,"address":txtadd.text];
        
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
        var msg =   res["msg"] as? String
        print(msg)
        if msg == "succes regi"
        {
           // performSegue(withIdentifier: "home", sender: nil)
        }
        else{
            
        }
        var id1 = res["id"] as! Int
        var i = String(id1)
        //postImage(imageId: i)
        
    }
    
    
//    func postImage(imageId:String){
//        var u = "https://exasperated-sponsor.000webhostapp.com/api/imageupload.php?id="+imageId
//        let reqUrl = URL(string:u)
//
//        // let reqUrl = URL(string: "https://hoven-differences.000webhostapp.com/ChildAdopter_Imageupload.php?////id="+imageId)
//
//        var request = URLRequest(url: reqUrl! as URL)
//        request.httpMethod = "POST"
//        let boundary = "xxxxBoundaryStringxxxx"
//
//        request.setValue("multipart/form-data; boundary=\(boundary)",
//
//            forHTTPHeaderField: "Content-Type")
//
//        if (rimg.image == nil)
//
//
//
//        { return }
//        //        let image_data = UIImagePNGRepresentation(imageofProduct.image!)
//
//
//        let image_data = UIImagePNGRepresentation(self.compressImage(rimg.image!))
//
//        let body = NSMutableData()
//
//        // let fname = "porch-16.png"
//
//
//
//        let fname = imageId+".png"
//
//        //  let mimetype = "image/png"
//
//
//
//        body.append("\r\n--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
//
//
//
//        body.append("Content-Disposition:form-data; name=\"fileUpload\"; filename=\"\(fname)\"\r\n".data(using: String.Encoding.utf8)!)
//
//
//
//        body.append("Content-Type: application/octet-stream\r\n\r\n".data(using:String.Encoding.utf8)!)
//
//
//
//        body.append(image_data!)
//
//
//
//        body.append("\r\n".data(using: String.Encoding.utf8)!)
//
//
//
//        body.append("--\(boundary)--\r\n".data(using:String.Encoding.utf8)!)
//
//
//
//        request.httpBody = body as Data
//
//
//
//        let session = URLSession.shared
//
//
//
//        let task = session.dataTask(with: request as URLRequest) {
//
//
//
//            (data, response, error) in
//
//
//
//            guard let _:Data = data, let _:URLResponse = response , error
//
//
//
//                == nil else {
//
//                    print("error")
//
//                    return
//
//            }
//
//
//
//            let resDict = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments)
//
//
//
//            print(resDict);
//            DispatchQueue.main.async(execute:{
//
//                self.parsdata1(result: resDict as! [String : Any])
//
//            }
//
//
//            )
//
//
//            //            let dataString = String(data: data!, encoding:String.Encoding(rawValue: String.Encoding.utf8.rawValue))
//
//            //            print(dataString)
//
//
//
//        }
//
//        task.resume()
//
//    }
//
//
//
//    func compressImage(_ image:UIImage) -> UIImage
//
//    {
//
//        //        var CompressImage : UIImage = image.correctlyOrientedImage()
//
//
//
//        var CompressImage
//
//            : UIImage = image
//
//        var actualHeight = CompressImage.size.height
//
//        var actualWidth = CompressImage.size.width
//
//        let maxHeight:CGFloat
//
//        let maxWidth:CGFloat
//
//        maxHeight = 1080
//
//        maxWidth =  1920
//
//        //        }
//
//        //
//
//
//
//        var imageRetio:CGFloat = actualWidth/actualHeight
//
//        let maxRetio:CGFloat = maxWidth/maxHeight
//
//        print(image.imageOrientation)
//
//
//
//        let compressionQuality:CGFloat = 1.0   // 0 percent compression
//
//        if actualHeight > maxHeight || actualWidth > maxWidth
//
//        {
//
//            if imageRetio < maxRetio
//
//            {
//
//                imageRetio = maxHeight/actualHeight
//
//                actualWidth = imageRetio * actualWidth
//
//                actualHeight = maxHeight
//
//            }
//
//            else if imageRetio > maxRetio
//
//            {
//
//                imageRetio = maxWidth/actualWidth
//
//                actualWidth = imageRetio * actualHeight
//
//                actualHeight = maxWidth
//
//
//
//            }
//
//            else
//
//            {
//
//                actualHeight = maxHeight
//
//                actualWidth = maxWidth
//
//            }
//
//            let rect = CGRect(x: 0.0, y: 0.0, width: actualWidth, height: actualHeight)
//
//            UIGraphicsBeginImageContext(rect.size)
//
//            CompressImage.draw(in: rect)
//
//            if CompressImage.imageOrientation == .up
//
//            {
//
//                print("True")
//
//            }
//
//            let img = UIGraphicsGetImageFromCurrentImageContext()
//
//            let imageData = UIImageJPEGRepresentation(img!, compressionQuality)
//
//            UIGraphicsEndImageContext()
//
//            CompressImage = UIImage(data:imageData!)!
//
//            CompressImage.imageOrientation
//
//        }
//
//        return CompressImage
//
//    }
//
//    func parsdata1(result:[String:Any])
//    {
//        //        if role == "User"
//        //        {
//        //
//        //            performSegue(withIdentifier: "User", sender: nil)
//        //        }
//        //        else{
//        //            performSegue(withIdentifier: "Volunteer", sender: nil)
//        //        }
//
//    }
//
//
//
//}
   //@IBOutlet weak var Rimg: UIImageView!
}

