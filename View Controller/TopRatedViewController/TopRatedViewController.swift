//
//  TopRatedViewController.swift
//  SwiftyJson Work
//
//  Created by Apple on 26/05/21.
//

import UIKit
import Alamofire

class TopRatedViewController: UIViewController {
    var arrData = [JsonModel]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
      //  fetchFilms()
      //  getAllUsreDataAF()
        jsonParsing()
        
    }
    
   // to hide navigation bar use following two methods
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        super.viewWillDisappear(animated)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    

}
extension TopRatedViewController {
  func fetchFilms() {
    // 1
    let request = AF.request("https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")
    // 2
    request.responseJSON { (data) in
      print(data)
    }
  }
    

    
    func jsonParsing(){
        let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do{
                let json = try JSON(data:data)
                let results = json["results"]
                for arr in results.arrayValue{
                    self.arrData.append(JsonModel(json: arr))
                    print(json)
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}
    
extension TopRatedViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newCollectionViewCell", for: indexPath as IndexPath) as! newCollectionViewCell
        
     
        cell.lbl_TopMovieName.text = self.arrData[indexPath.row].title
       cell.lbl_TopMovieOverview.numberOfLines = 0
        cell.lbl_TopMovieOverview.text = self.arrData[indexPath.row].overview
        let defaultlink = "https://image.tmdb.org/t/p/w342"
        let completelink = defaultlink + arrData[indexPath.row].backdrop_path
        cell.img_TopMovie.downloaded(from: completelink)
       cell.img_TopMovie.layer.masksToBounds = true
        cell.img_TopMovie.contentMode = .scaleAspectFill
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "TopDetailViewController") as? TopDetailViewController
        vc?.strlblMovieNameTop = arrData[indexPath.row].title
        print(arrData[indexPath.row].title)
        vc?.strOverviewTop = arrData[indexPath.row].overview
        let defaultlink = "https://image.tmdb.org/t/p/w342"
        let completelink = defaultlink + arrData[indexPath.row].poster_path
        print(completelink)
        vc?.imgBackimgTop = completelink
        print(arrData[indexPath.row].release_date)
        print(arrData[indexPath.row].vote_average)
        vc?.percentageVoteTop = (arrData[indexPath.row].vote_average)
        vc?.releaseDateShowTop = arrData[indexPath.row].release_date
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

