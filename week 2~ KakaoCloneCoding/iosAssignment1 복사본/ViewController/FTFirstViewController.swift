//
//  FTFirstViewController.swift
//  iosAssignment1Tests
//
//  Created by 민 on 2021/04/16.
//

import UIKit

class FTFirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func ProfileButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "FTSecondViewController") as? FTSecondViewController else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        
    }
    
}
