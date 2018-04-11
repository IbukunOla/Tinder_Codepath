//
//  ProfileViewController.swift
//  Tinder-Codepath
//
//  Created by Ibukun on 4/10/18.
//  Copyright © 2018 Ibukun. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    var profileImageViewHolder: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.image = profileImageViewHolder
        
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
