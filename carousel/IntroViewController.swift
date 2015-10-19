//
//  IntroViewController.swift
//  carousel
//
//  Created by Liz Dalay on 10/13/15.
//  Copyright © 2015 Liz Dalay. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introScrollView: UIScrollView!
    
    @IBOutlet weak var introImageView: UIImageView!
    
    @IBOutlet weak var tile1ImageView: UIImageView!
    
    @IBOutlet weak var tile2ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        introScrollView.delegate = self
        
        introScrollView.contentSize = introImageView.image!.size
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func scrollViewDidScroll(introScrollView: UIScrollView) {
        // This method is called as the user scrolls
        
        tile1ImageView.transform = CGAffineTransformMakeScale(0.25, 0.25)
        tile1ImageView.transform = CGAffineTransformRotate(view.transform, CGFloat(345 * M_PI / 180))
    
    }
    
    func scrollViewDidEndDecelerating(introScrollView: UIScrollView) {
        
        tile1ImageView.transform = CGAffineTransformMakeScale(1, 1)
        tile1ImageView.transform = CGAffineTransformRotate(view.transform, CGFloat(0 * M_PI / 180))
        tile1ImageView.transform = CGAffineTransformMakeTranslation(12, 405)
    }

}
