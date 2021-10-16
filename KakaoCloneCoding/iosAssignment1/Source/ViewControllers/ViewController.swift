//
//  ViewController.swift
//  iosAssignment1
//
//  Created by 민 on 2021/04/03.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputEmailPhone: UITextField!
    @IBOutlet weak var inputPw: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // '카카오계정 로그인' 버튼 클릭 시
    @IBAction func loginButton(_ sender: Any) {
        // 버튼이 눌리면, makeRequestAlert를 통해 창을 띄우게 함
        self.makeRequestAlert(title: "알림",
                              message: "로그인을 하시겠습니까",
                              // okAction을 누를 경우 로그인을 처리하는 loginAction() 수행
                              okAction: {_ in self.loginAction()})
    }
    
    func loginAction()
    {
        // shared를 통해 싱글턴 인스턴스에 접근, 각각 TextField에 있는 text를 넘김 -> 통신의 결괏값이 result로 반환
        LoginService.shared.login(email: self.inputEmailPhone.text!, password: self.inputPw.text!) {result in switch result {
        // 성공적으로 result값이 내려왔을 경우
        case .success(let message):
            if let message = message as? String {
                // ok버튼 눌렀을 때 하고싶은 동작을 okAction에 삽입
                self.makeAlert(title: "알림", message: message, okAction: { _ in
                    guard let nextVC = self.storyboard?.instantiateViewController(identifier: "UITabBarController") as? UITabBarController else { return }
                    
                    self.navigationController?.pushViewController(nextVC, animated: true)
                })
            }
        // result값이 내려오는 것이 실패일 경우
        case .requestErr(let message):
            if let message = message as? String {
                self.makeAlert(title: "알림", message: message)
            }
        default:
            print("ERROR")
        }
    }
}
    
    // '새로운 카카오계정 만들기' 버튼 클릭 시
    @IBAction func newAccountButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "firstViewController") as? firstViewController else { return }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

    
// ViewController를 확장해서 makeRequestAlert 함수와 makeAlert 함수를 추가
// Extension 형태로 만들어두면, 아무 뷰컨에서나 호출이 가능함 (=자주 쓰는 기능을 빠르게 구현)
extension UIViewController
{
    func makeRequestAlert(title : String,
                          message : String,
                          okAction : ((UIAlertAction) -> Void)?,
                          cancelAction : ((UIAlertAction) -> Void)? = nil,
                          completion : (() -> Void)? = nil)
    {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
            
        let alertViewController = UIAlertController(title: title, message: message,
                                                    preferredStyle: .alert)
            
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
            
            
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: cancelAction)
        alertViewController.addAction(cancelAction)
            
            
        self.present(alertViewController, animated: true, completion: completion)
    }
        
        
    func makeAlert(title : String,
                   message : String,
                   okAction : ((UIAlertAction) -> Void)? = nil,
                   completion : (() -> Void)? = nil)
    {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
            
        let alertViewController = UIAlertController(title: title, message: message,
                                                    preferredStyle: .alert)
            
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
            
            
        self.present(alertViewController, animated: true, completion: completion)
    }
}
