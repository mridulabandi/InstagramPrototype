//
//  PlayerViewClass.swift
//  InstagramDemo
//
//  Created by mysmac_adm!n on 20/01/20.
//  Copyright © 2020 Mridula. All rights reserved.
//

import UIKit
import ARKit
import AVFoundation

class PlayerViewClass : UIView
{
    
    override static var layerClass : AnyClass
        {return AVPlayerLayer.self;}
    
    var playerLayer: AVPlayerLayer
    { return layer as! AVPlayerLayer;}
    
    var player : AVPlayer?
    {
        get{return playerLayer.player;}
        set{playerLayer.player = newValue;}
    }
    
}
