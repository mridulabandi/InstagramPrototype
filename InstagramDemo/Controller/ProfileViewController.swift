//
//  ProfileViewController.swift
//  InstagramDemo
//
//  Created by mysmac_adm!n on 20/01/20.
//  Copyright © 2020 Mridula. All rights reserved.
//

import UIKit
import AlamofireImage
import SDWebImage

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var usrname: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var ProfileView: UIView!
    
    var images :[String] = []
    
    //Mark - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.SetLayout()
    }
    
    
    //MARK - load data
    func loadData()
    {
        InstaApiManager.getProfileDataDetails{
            (response, Error) in
            if response != nil
            {
                self.name.text = response?.userName
                self.usrname.text = response?.title
                self.Description.text = response?.description1
                if self.Description.text == ""
                {
                    self.Description.isHidden = true
                }
                let profileImage = response?.userImageUrl! ?? " "
                let url = URL(string: profileImage)
                self.ProfileImage.sd_setImage(with: url! as URL)
                self.ProfileImage.layer.cornerRadius = 45
               
                
                for image in response!.posts!
                {
                    self.images.append(image.userImageUrl!)
                }
            }
        }
    }
    
    //MARK - override the existing collectionview layout
    func SetLayout()
    {
        let width = (UIScreen.main.bounds.width - 43) / 3
        let height = width + ( width / 3 )
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0,left: 0,bottom: 10,right: 0)
        layout.itemSize = CGSize(width: width, height: height)
        
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        CollectionView.collectionViewLayout = layout
    }
    
    //Mark - cancel action
    @IBAction func CancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.view.removeFromSuperview()
        
    }
   
}

//Mark - Add data to cell
extension ProfileViewController : UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProfileCollectionViewCell
        
        if self.images.count > 0
        {
            let url = URL(string: images[indexPath.row])
            if url != nil
            {cell.Image.af_setImage(withURL: url!)}
        }
        
        return cell
    }
   
}



