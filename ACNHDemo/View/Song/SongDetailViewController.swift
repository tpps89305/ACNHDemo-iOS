//
//  SongDetailViewController.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/9.
//

import UIKit
import AVFoundation

class SongDetailViewController: UIViewController {

    var song: Song?
    var player: AVPlayer?
    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var labelSource: UILabel!
    @IBOutlet weak var viewLoading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.viewLoading.startAnimating()
        title = song!.name.nameTWzh
        imageAvatar.loadUrl(url: song!.imageURI, onLoadingCompleted: {() in
            self.viewLoading.stopAnimating()
        })
        player = AVPlayer.init(url: URL(string: song!.musicURI)!)
        
        var source = "Source: K.K. concert"
        if song!.isOrderable {
            source += ", Nook Shopping Daily Selection"
        }
        labelSource.text = source
    }
    
    @IBAction func btnPlayPress(_ sender: UIButton) {
        if player?.timeControlStatus == .playing {
            player?.pause()
        } else if player?.timeControlStatus == .paused {
            player?.play()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
