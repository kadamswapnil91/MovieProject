//
//  TopDetailViewController.swift
//  SwiftyJson Work
//
//  Created by Apple on 04/06/21.
//

import UIKit

class TopDetailViewController: UIViewController {
    @IBOutlet weak var lbl_MovieOverview: UILabel!
    @IBOutlet weak var img_Background: UIImageView!
    @IBOutlet weak var lbl_MoviePercentage: UILabel!
    @IBOutlet weak var lbl_movieRunningTime: UILabel!
    @IBOutlet weak var view_details: UIView!
    @IBOutlet weak var lbl_Date: UILabel!
    @IBOutlet weak var lbl_MovieName: UILabel!
    
    var strlblMovieNameTop = String()
    var strOverviewTop = String()
    var imgBackimgTop = String()
    var percentageVoteTop = String()
    var releaseDateShowTop = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        navigationController?.navigationBar.barTintColor = UIColor.systemYellow
        blackScreenInfo()
        // Do any additional setup after loading the view.
    }
    
    func blackScreenInfo(){
    lbl_MovieName.text = strlblMovieNameTop
        print(strlblMovieNameTop)
    lbl_MovieOverview.text = strOverviewTop
    print(imgBackimgTop)
    let imageURL = URL(string: imgBackimgTop)!
    img_Background.sd_setShowActivityIndicatorView(true)
        img_Background.sd_setIndicatorStyle(.medium)
    img_Background.sd_setImage(with: imageURL)
        lbl_Date.text = releaseDateShowTop
        lbl_MoviePercentage.text = (percentageVoteTop)
       // let showVote = (percentageVote * 100)
        let IntShowVote = ((percentageVoteTop as NSString).integerValue) * 10
        print(percentageVoteTop)
        print(IntShowVote)
      
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
