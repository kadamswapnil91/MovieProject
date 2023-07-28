//
//  ViewController.swift
//  SwiftyJson Work
//
//  Created by Apple on 10/05/21.
//

import UIKit
import SDWebImage

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


class ViewController: UIViewController ,UISearchBarDelegate{
    @IBOutlet weak var tabbar: UITabBar!
    
    @IBOutlet weak var topRatedTab: UITabBarItem!
    @IBOutlet weak var nowPlayingTab: UITabBarItem!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!


 //   @IBOutlet var tableView: UITableView!
    var arrData = [JsonModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        overrideUserInterfaceStyle = .light
        
        print(arrData)
        jsonParsing()
        
       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        super.viewWillDisappear(animated)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    var filterdata:[String]!
    var isSearching = false
    var searcheCountry = [String]()
    /// searchbar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        print("search = \(searchText)")
        let searchedCountry = arrData.filter {
        return (($0.title ).lowercased().contains(searchText.lowercased()))
        
        
        }
        print(searchedCountry)
        //tableview.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        tableview.reloadData()
    }
    

    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    
    

    func jsonParsing(){
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do{
                let json = try JSON(data:data)
                let results = json["results"]
                for arr in results.arrayValue{
                    self.arrData.append(JsonModel(json: arr))
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        cell.lbl_MovieName.text = arrData[indexPath.row].title
        cell.lbl_MovieOverview.text = arrData[indexPath.row].overview
        
        let defaultlink = "https://image.tmdb.org/t/p/w342"
        let completelink = defaultlink + arrData[indexPath.row].backdrop_path
        cell.imgView.downloaded(from: completelink)
       cell.imgView.layer.masksToBounds = true
        cell.imgView.contentMode = .scaleAspectFill
    

        return cell
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(identifier: "NowDetailViewController") as? NowDetailViewController
        vc?.strlblMovieName = arrData[indexPath.row].title
        vc?.strOverview = arrData[indexPath.row].overview
        let defaultlink = "https://image.tmdb.org/t/p/w342"
        let completelink = defaultlink + arrData[indexPath.row].poster_path
        print(completelink)
        vc?.imgBackimg = completelink
        print(arrData[indexPath.row].release_date)
        print(arrData[indexPath.row].vote_average)
        vc?.percentageVote = (arrData[indexPath.row].vote_average)
        vc?.releaseDateShow = arrData[indexPath.row].release_date
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}
