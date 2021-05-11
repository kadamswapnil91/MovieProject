//
//  ViewController.swift
//  SwiftyJson Work
//
//  Created by Apple on 10/05/21.
//

import UIKit


class ViewController: UIViewController {
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NowPlaying()
       // TopRated()
    }


    
    func NowPlaying(){
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do{
                
                if let json = try? JSON(data: data) {
                    for item in json["results"].arrayValue {
                        print("******************** NOW PLAYING MOVIES ********************")
                        print("Movie Title :",item["title"].stringValue)
                        print("Movie Overview :",item["overview"].stringValue)
                        print("Movie Release Date :",item["release_date"].stringValue)
                        let Posterurl = "https://image.tmdb.org/t/p/w342"
                        print("Movie Poster image path :",Posterurl+item["poster_path"].stringValue)
                        let BackdropImagePath = "https://image.tmdb.org/t/p/original"
                        print("Movie Backdrop image path :",BackdropImagePath + item["backdrop_path"].stringValue)
                        print("\n------------------------------------------------------------------------------------\n")
                        
                       // print(json["dates"])  // shows date array
                        // print(json)     // shows all json data (all response)
                        // print(json["results"])   // shows results array
                    }
                }
                
                DispatchQueue.main.async {
                    // self.tableView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
        
    }
    
    func TopRated(){
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do{
                
                if let json = try? JSON(data: data) {
                    for item in json["results"].arrayValue {
                        
                        print("*TOP RATED MOVIES*")
                        print("Movie Title :",item["title"].stringValue)
                        print("Movie Overview :",item["overview"].stringValue)
                        print("Movie Release Date :",item["release_date"].stringValue)
                        print("Movie Poster image :",item["poster_path"].stringValue)
                        print("\n**********************************************\n")
                        
                      //   print(json)     // shows all json data (all response)
                        // print(json["results"])   // shows results
                    }
                }
                
                DispatchQueue.main.async {
                    // self.tableView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
        
    }
    
    
}

