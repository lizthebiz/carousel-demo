//
//  TutorialViewController.swift
//  carousel
//
//  Created by Liz Dalay on 10/14/15.
//  Copyright © 2015 Liz Dalay. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var tutorialScrollView: UIScrollView!
    
    @IBOutlet weak var tutorialImageView: UIImageView!
    
    @IBOutlet weak var tutorialPageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    tutorialScrollView.contentSize = tutorialImageView.image!.size
        
    tutorialScrollView.delegate = self
        
    func scrollViewDidEndDecelerating(ScrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(tutorialScrollView.contentOffset.x / 320))
            
        // Set the current page, so the dots will update
        tutorialPageControl.currentPage = page
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
