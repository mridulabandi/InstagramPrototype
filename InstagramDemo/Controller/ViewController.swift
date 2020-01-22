//
//  ViewController.swift
//  InstagramDemo
//
//  Created by mysmac_adm!n on 20/01/20.
//  Copyright © 2020 Mridula. All rights reserved.
//

import UIKit
import AVFoundation
import SDWebImage



class ViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    
    var videoUrl : [String] = []
     var ImageUrl : [String] = []
     var time : [String] = []
     var name : [String] = []
    var cell : DataCellClass?
    
    //MARK - view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        
    }
    
    //MARK - load data on screen
    func loadData()
    {
        InstaApiManager.getPostDetails{
            (Response ,Error) in
            if Response != nil
            {
                for i in Response!.posts!
                {
                    self.videoUrl.append(i.vUrl!)
                    self.ImageUrl.append(i.userImageUrl!)
                    self.name.append(i.userName!)
                    self.time.append(i.time!)
                                  
                 }
          
                self.TableView.reloadData()
            }
        }
    }
    
    
    //MARK - navigate to profile page
    @IBAction func NavigateProfile(_ sender: Any)
  {
        let popUpObject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.addChild(popUpObject)
        popUpObject.view.frame = self.view.frame
        self.view.addSubview(popUpObject.view)
        popUpObject.didMove(toParent: self)
    }
}

//MARK - table view methods
extension ViewController : UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.videoUrl.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        cell = tableView.dequeueReusableCell(withIdentifier: "cellView", for: indexPath) as? DataCellClass
       
        if self.videoUrl.count > 0
        {
            let url = self.videoUrl[indexPath.row]
            let videoUrl = NSURL(string: url)
            let avPlayer = AVPlayer(url: videoUrl! as URL)
            cell!.PlayerView.playerLayer.player = avPlayer
            cell!.PlayerView.player?.pause()
        }
        
        if self.ImageUrl.count > 0
        {
            let url = URL(string: ImageUrl[indexPath.row])
            cell!.ProfileImage.af_setImage(withURL: url!)
            cell?.ProfileImage.layer.cornerRadius = 20
            cell?.ProfileImage.layer.masksToBounds = true
            cell?.ProfileImage.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0).cgColor
            cell?.ProfileImage.layer.borderWidth = 2
        }
        
        if self.name.count > 0
        {
            cell?.username.text = self.name[indexPath.row]
            
        }
        
        if self.time.count > 0
        {
            cell?.time.text = self.time[indexPath.row]
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
       if self.videoUrl.count > 0
        {
            let url = self.videoUrl[indexPath.row]
            let videoUrl = NSURL(string: url)
            let avPlayer = AVPlayer(url: videoUrl! as URL)
            cell!.PlayerView.playerLayer.player = avPlayer
            cell!.PlayerView.player?.play()
        }
    }
}
