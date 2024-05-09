//
//  BlogViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 19/12/18.
//  Copyright © 2018 Prexa Patel. All rights reserved.
//

import UIKit

class BlogViewController: UIViewController , UICollectionViewDelegate ,UICollectionViewDataSource {
    
    var b = [String]()
    var bi = [UIImage]()
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return b.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "blogcell", for: indexPath) as! BlogCollectionViewCell
        cell.blogdes.text = b[indexPath.row]
        cell.blogimg.image = bi[indexPath.row]
        return cell
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
