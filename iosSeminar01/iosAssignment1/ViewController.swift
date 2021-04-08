//
//  ViewController.swift
//  iosAssignment1
//
//  Created by 민 on 2021/04/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputEmailPhone: UITextField!
    @IBOutlet weak var inputPw: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    // 카카오계정 로그인 버튼 클릭 시
    @IBAction func loginButton(_ sender: Any) {
        
        if inputEmailPhone.text?.isEmpty == false &&
            inputPw.text?.isEmpty == false
        {
            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "secondViewController") as? secondViewController else { return }
            
            nextVC.printUser = inputEmailPhone.text
            
            self.present(nextVC, animated: true, completion: nil)
        }
    
    }
    
    // 새로운 카카오계정 만들기 버튼 클릭 시
    @IBAction func newAccountButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "firstViewController") as? firstViewController else { return }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
