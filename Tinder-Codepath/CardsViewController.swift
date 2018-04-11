//
//  CardsViewController.swift
//  Tinder-Codepath
//
//  Created by Ibukun on 4/3/18.
//  Copyright © 2018 Ibukun. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    var divisor: CGFloat!
    var cardInitialCenter: CGPoint!
    
    var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        divisor = (view.frame.width / 2) / 0.61
        cardInitialCenter = cardImageView.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func unwindToCards(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let translation = sender.translation(in: view)
        let location = sender.location(in: view)
        let xFromCenter = imageView.center.x - view.center.x
        
        imageView.transform = CGAffineTransform(rotationAngle: xFromCenter / divisor)
        imageView.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        
        if sender.state == .began {
            print("Started pan")
        } else if sender.state == .changed {
            if location.y > cardInitialCenter.y {
                
            } else {
                
            }
            
        } else if sender.state == .ended {
            print(translation)
            if imageView.center.x < (view.center.x - 50) {
                //animate to the right
                UIView.animate(withDuration: 0.3, animations: {
                    imageView.center = CGPoint(x: imageView.center.x + self.view.bounds.width, y: imageView.center.y)
                })
            } else if imageView.center.x > (view.center.x + 50) {
                UIView.animate(withDuration: 0.3, animations: {
                    imageView.center = CGPoint(x: imageView.center.x - self.view.bounds.width, y: imageView.center.y)
                })
            } else {
                imageView.transform = CGAffineTransform.identity
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let dest = segue.destination as? ProfileViewController {
            dest.modalPresentationStyle = UIModalPresentationStyle.custom
            fadeTransition = FadeTransition()
            dest.transitioningDelegate = fadeTransition
            fadeTransition.duration = 1.0
            dest.profileImageViewHolder = cardImageView.image
        }
    }
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        //Perform segue
        performSegue(withIdentifier: "ProfileModal", sender: nil)
    }
    
    

}
