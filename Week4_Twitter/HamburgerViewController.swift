//
//  HamburgerViewController.swift
//  Week4_Twitter
//
//  Created by Phillip Pang on 11/3/16.
//  Copyright © 2016 Phillip Pang. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var leftMarginConstraint: NSLayoutConstraint!
    
    var originalLeftMargin: CGFloat!
    
    var menuViewController:UIViewController! {
        didSet {
            view.layoutIfNeeded()
            menuView.addSubview(menuViewController.view)
        }
    }
    
    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        
        if sender.state == UIGestureRecognizerState.began{
            originalLeftMargin = leftMarginConstraint.constant
        } else if sender.state == UIGestureRecognizerState.changed  {
            leftMarginConstraint.constant = originalLeftMargin + translation.x
        } else if sender.state == UIGestureRecognizerState.ended {
            
            UIView.animate(withDuration: 0.3, animations: {
                
                if velocity.x > 0 {
                    self.leftMarginConstraint.constant = self.view.self.frame.size.width - 50
                }else{
                    self.leftMarginConstraint.constant = 0
                }
                self.view.layoutIfNeeded()
            })

        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}