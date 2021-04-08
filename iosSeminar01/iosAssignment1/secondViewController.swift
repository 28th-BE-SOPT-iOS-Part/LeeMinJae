//
//  secondViewController.swift
//  iosAssignment1
//
//  Created by 민 on 2021/04/03.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet weak var idPhone: UILabel!
    
    var printUser : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLabel()
    }
    
    func setLabel() {
        if let user = self.printUser
        {
            idPhone.text = "\(user)님"
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
