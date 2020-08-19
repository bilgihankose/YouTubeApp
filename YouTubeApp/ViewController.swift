//
//  ViewController.swift
//  YouTubeApp
//
//  Created by Bilgihan Köse on 19.08.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var videos = [Video]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
    }

    func loadData(){
        guard let jsonURL = Bundle.main.url(forResource: "videos", withExtension: "json"), let data = try? Data(contentsOf: jsonURL) else {
            return
        }
        
        DispatchQueue.main.async {
            do {
                self.videos = try JSONDecoder().decode([Video].self, from: data)
                self.tableView.rowHeight = 310
                self.tableView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VideoTableViewCell
        
        let video = videos[indexPath.row]
        
        cell.prepare(video: video)
        return cell
    }
    
    
}

