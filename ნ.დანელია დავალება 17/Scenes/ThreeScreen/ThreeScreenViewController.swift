//
//  ThreeScreenViewController.swift
//  ნ.დანელია დავალება 17
//
//  Created by NikoDanelia on 16/07/2026.
//

import UIKit

class ThreeScreenViewController: UIViewController {

    private let ApiManager = FunFactAPIManager()
    
    
    @IBOutlet weak var MovieLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNewJoke()
        
    }
    

    
    @IBAction func DidTapMovie(_ sender: UIButton) {
        
        loadNewJoke()
    }
    
    func loadNewJoke() {
        ApiManager.getRandomFact(category: "movie") { [weak self] result in
            self?.MovieLabel.text = result?.value
        }
    }
    
}
