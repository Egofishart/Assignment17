//
//  ViewController.swift
//  ნ.დანელია დავალება 17
//
//  Created by NikoDanelia on 16/07/2026.
//

import UIKit

class ViewController: UIViewController {

    
    
   
    @IBOutlet weak var FactLabel: UILabel!
    var selectedCategory: String = "history"
    
    private var apiManager: FunFactAPIManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiManager = FunFactAPIManager()
        
        loadNewJoke()
    }

    @IBAction func didTapNextJoke(_ sender: UIButton) {
        loadNewJoke()
    }
    

   
    func loadNewJoke() {
        apiManager?.getRandomFact(category: selectedCategory) { [weak self] fact in
            self?.FactLabel.text = fact?.value
        }
    }
}
    

