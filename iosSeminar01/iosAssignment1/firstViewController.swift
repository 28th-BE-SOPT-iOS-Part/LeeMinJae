//
//  firstViewController.swift
//  iosAssignment1
//
//  Created by 민 on 2021/04/03.
//

import UIKit

class firstViewController: UIViewController {

    @IBOutlet weak var startEmailPhone: UITextField!
    @IBOutlet weak var startPw: UITextField!
    @IBOutlet weak var startPwCheck: UITextField!
    
//    @IBOutlet weak var viewLoad: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    @IBAction func completeMessage(_ sender: Any)
    {
        if startEmailPhone.text?.isEmpty == false &&
            startPw.text?.isEmpty == false && startPwCheck.text?.isEmpty == false && startPw.text == startPwCheck.text
        {
            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "secondViewController") as? secondViewController else { return }
            
            nextVC.printUser = startEmailPhone.text
            
            self.present(nextVC, animated: true, completion: nil)
        }
        else
        {
           
        }
//        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "secondViewController") as? secondViewController else { return }
//
//        nextVC.printUser = startEmailPhone.text
//
//        self.navigationController?.pushViewController(nextVC, animated: true)
   }
    
}
