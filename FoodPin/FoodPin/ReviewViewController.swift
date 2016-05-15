//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Even201314 on 16/5/14.
//  Copyright © 2016年 Even. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var ratingStackView: UIStackView!
    
    @IBOutlet var disLikeButton: UIButton!
    @IBOutlet var goodButton: UIButton!
    @IBOutlet var greatButton: UIButton!
    
    var rating: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let blurEffect = UIBlurEffect(style: .Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
//        ratingStackView.transform = CGAffineTransformMakeScale(0.0, 0.0)
        
//        let scale = CGAffineTransformMakeScale(0.0, 0.0)
        let translate = CGAffineTransformMakeTranslation(0, 500)
        
        disLikeButton.transform = translate
        goodButton.transform = translate
        greatButton.transform = translate
        
//        ratingStackView.transform = CGAffineTransformConcat(scale, translate)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
//        UIView.animateWithDuration(0.4, delay: 0.0, options: [],animations: {
//            self.ratingStackView.transform = CGAffineTransformIdentity
//        }, completion: nil)
        
        //Spring Animation
        UIView.animateWithDuration(1, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.disLikeButton.transform = CGAffineTransformIdentity
        }, completion: nil)
        UIView.animateWithDuration(1, delay: 0.1, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.goodButton.transform = CGAffineTransformIdentity
            }, completion: nil)
        UIView.animateWithDuration(1, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.greatButton.transform = CGAffineTransformIdentity
            }, completion: nil)
    }
    
    @IBAction func ratingSelected(sender: UIButton){
        switch sender.tag {
        case 100:
            rating = "dislike"
        case 200:
            rating = "good"
        case 300:
            rating = "great"
        default:
            break;
        }
        
        performSegueWithIdentifier("unwindToDetailView", sender: sender)
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
