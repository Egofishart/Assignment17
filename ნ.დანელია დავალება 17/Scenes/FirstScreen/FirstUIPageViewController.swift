//
//  FirstUIPageViewController.swift
//  ნ.დანელია დავალება 17
//
//  Created by NikoDanelia on 16/07/2026.
//

import UIKit


class FirstUIPageViewController: UIPageViewController {
    
  
    private var pages: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        let firstStoryboard = UIStoryboard(name: "FirstScreen", bundle: nil)
        let twoStoryboard = UIStoryboard(name: "TwoScreen", bundle: nil)
        let threeStoryboard = UIStoryboard(name: "ThreeScreen", bundle: nil)
        
        let page1 = twoStoryboard.instantiateViewController(withIdentifier: "Two")
        let page2 = threeStoryboard.instantiateViewController(withIdentifier: "Three")
        let page3 = firstStoryboard.instantiateViewController(withIdentifier: "First")

        pages = [page3 ,page1, page2]
        
        if let firstPage = pages.first {
            setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
        }
    }
}

// MARK: - UIPageViewController DataSource
extension FirstUIPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        let previousIndex = currentIndex - 1
        guard previousIndex >= 0 else { return nil }
        
        return pages[previousIndex]
    }
    

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        let nextIndex = currentIndex + 1
        guard nextIndex < pages.count else { return nil }
    
        return pages[nextIndex]
    }
}


