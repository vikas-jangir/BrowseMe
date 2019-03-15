//
//  settingViewController.swift
//  BrowseMe
//
//  Created by Vikas Kumar Jangir on 14/03/19.
//  Copyright © 2019 eduqa. All rights reserved.
//

import UIKit

class settingViewController: UIViewController {

    @IBOutlet weak var settingView: UIView!
   
    @IBOutlet weak var backgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        roundCorner()
        tapRecognizer()
        // Do any additional setup after loading the view.
    }
    
    
    func roundCorner() {
        settingView.layer.cornerRadius = 20.0
        settingView.layer.masksToBounds = true
        settingView.layer.borderWidth = 1.0
        settingView.layer.borderColor = UIColor.darkGray.cgColor
    }

    
    func tapRecognizer()  {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissVC))
        tap.cancelsTouchesInView = false
        backgroundView.addGestureRecognizer(tap)
    }
    
    @objc func dismissVC()  {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
