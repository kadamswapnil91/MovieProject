//
//  NowDetailViewController.swift
//  SwiftyJson Work
//
//  Created by Apple on 13/05/21.
//

import UIKit
//import SDWebImage

class NowDetailViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var lbl_MovieOverview: UILabel!
    @IBOutlet weak var lbl_Popularity: UILabel!
    @IBOutlet weak var lbl_RunningTime: UILabel!
    @IBOutlet weak var lbl_ReleaseDate: UILabel!
    @IBOutlet weak var lbl_MovieName: UILabel!
    @IBOutlet weak var blackColorView: UIView!
    @IBOutlet weak var backgroundImageview: UIImageView!
    
    var strlblMovieName = String()
    var strOverview = String()
    var imgBackimg = String()
    var percentageVote = String()
    var releaseDateShow = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
     //   self.navigationItem.setHidesBackButton(true, animated: true)
    
        
        navigationController?.navigationBar.barTintColor = UIColor.systemYellow
          blackScreenInfo()
 
    }
        func blackScreenInfo(){
        lbl_MovieName.text = strlblMovieName
        lbl_MovieOverview.text = strOverview
        print(imgBackimg)
        let imageURL = URL(string: imgBackimg)!
        backgroundImageview.sd_setShowActivityIndicatorView(true)
            backgroundImageview.sd_setIndicatorStyle(.medium)
        backgroundImageview.sd_setImage(with: imageURL)
            lbl_ReleaseDate.text = releaseDateShow
            lbl_Popularity.text = (percentageVote)
           // let showVote = (percentageVote * 100)
            let IntShowVote = ((percentageVote as NSString).integerValue) * 10
            print(percentageVote)
            print(IntShowVote)
          
    }
    

}
