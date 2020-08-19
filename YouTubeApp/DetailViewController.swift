//
//  DetailViewController.swift
//  YouTubeApp
//
//  Created by Bilgihan Köse on 19.08.2020.
//

import UIKit
import WebKit


class DetailViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    func loadYoutube() {
      if let url = Bundle.main.url(forResource: "youtube", withExtension:"html") {
        let request = URLRequest(url: url)
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.load(request)
      }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadYoutube()
        // Do any additional setup after loading the view.
        
    
    }
    

   }



