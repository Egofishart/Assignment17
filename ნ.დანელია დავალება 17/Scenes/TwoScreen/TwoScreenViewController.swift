//
//  TwoScreenViewController.swift
//  ნ.დანელია დავალება 17
//
//  Created by NikoDanelia on 16/07/2026.
//

import UIKit

class TwoScreenViewController: UIViewController {
    
    
    @IBOutlet weak var FactLabelMusic: UILabel!
    
    
    private let apiManager = FunFactAPIManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadNewJoke()
    }

    @IBAction func didTapNext(_ sender: UIButton) {
        
        loadNewJoke()
    }
    

    func loadNewJoke() {
        apiManager.getRandomFact(category: "music") { [weak self] fact in
        self?.FactLabelMusic.text = fact?.value
            
        }
    }
}
