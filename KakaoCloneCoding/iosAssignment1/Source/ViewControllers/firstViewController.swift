////
////  firstViewController.swift
////  iosAssignment1
////
////  Created by 민 on 2021/04/03.
////
//
//import UIKit
//
//class firstViewController: UIViewController {
//
//    @IBOutlet weak var startEmailPhone: UITextField!
//    @IBOutlet weak var startPw: UITextField!
//    @IBOutlet weak var startPwCheck: UITextField!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    // '새로운 카카오 계정 만들기' 버튼 클릭 시
//    @IBAction func completeMessage(_ sender: Any)
//    {
//        // 3개의 텍스트 필드가 모두 공백이 아니고, 비밀번호/비밀번호 확인의 값이 같다면 수행하는 조건문
//        if startEmailPhone.text?.isEmpty == false &&
//            startPw.text?.isEmpty == false && startPwCheck.text?.isEmpty == false && startPw.text == startPwCheck.text
//        {
//            // 버튼이 눌리면, makeRequestAlert를 통해 창을 띄우게 함
//            self.makeRequestAlert(title: "알림",
//                                  message: "회원가입을 하시겠습니까",
//                                  // okAction을 누를 경우 회원가입을 처리하는 signUpAction() 수행
//                                  okAction: {_ in self.signUpAction()})
//        }
//    }
//
//    func signUpAction()
//    {
//        // shared를 통해 싱글턴 인스턴스에 접근, 각각 TextField에 있는 text를 넘김 -> 통신의 결괏값이 result로 반환
//        SignUpService.shared.signUp(email: self.startEmailPhone.text!, password: self.startPw.text!) {result in switch result {
//            case .success(let message):
//                if let message = message as? String {
//                    self.makeAlert(title: "알림", message: message, okAction: { _ in
//                        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "UITabBarController") as? UITabBarController else { return }
//
//                        self.navigationController?.pushViewController(nextVC, animated: true)
//                })
//            }
//            case .requestErr(let message):
//                if let message = message as? String {
//                    self.makeAlert(title: "알림", message: message)
//                }
//            default:
//                print("ERROR")
//            }
//        }
//    }
//
//}
//
