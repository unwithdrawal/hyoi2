//
//  PageController.swift
//  hyoi2
//
//  Created by Sota Saito on 2019/04/14.
//  Copyright © 2019 unwithdrawal. All rights reserved.
//
import UIKit

struct PageSettings {
    static let pageControllerIdentifierList : [String] = [
        "Home"
    ]
    
    static func generateViewControllerList() -> [UIViewController] {
        var viewControllers : [UIViewController] = []
        self.pageControllerIdentifierList.forEach{ viewControllerName in
            let viewController = UIStoryboard(name: "Home", bundle: nil) . instantiateViewController(withIdentifier: "\(viewControllerName)")
            
            viewControllers.append(viewController)
        }
        return viewControllers
    }
}

class PageViewController: UIPageViewController {
    
    var viewControllerIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setViewControllers([PageSettings.generateViewControllerList().first!], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PageViewController : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let targetViewControllers : [UIViewController] = PageSettings.generateViewControllerList()
        
        if viewControllerIndex == targetViewControllers.count - 1 {
            return nil
        } else {
            viewControllerIndex = viewControllerIndex + 1
        }
        
        return targetViewControllers[viewControllerIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let targetViewControllers : [UIViewController] = PageSettings.generateViewControllerList()
        
        if viewControllerIndex == 0 {
            return nil
        } else {
            viewControllerIndex = viewControllerIndex - 1
        }
        
        return targetViewControllers[viewControllerIndex]
    }
    
}

        // Do any additional setup after loading the view.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


