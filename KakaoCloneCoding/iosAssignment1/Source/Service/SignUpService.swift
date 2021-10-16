//
//  SignUpService.swift
//  iosAssignment1
//
//  Created by 민 on 2021/05/12.
//

import Foundation
import Alamofire

struct SignUpService{
    // static을 활용해서 shared라는 이름으로 SignUpService 싱글턴 인스턴스 선언
    static let shared = SignUpService()
    
    // makeParameter 함수: 아이디, 비밀번호를 매개변수로 받아서 parameter 형태로 return
    private func makeParameter(email : String, password : String) -> Parameters
    {
        return ["email" : email,
                "password" : password,
                "sex" : "0",
                "nickname" : "sopt-test",
                "phone" : "010-1111-1111",
                "birth" : "2000-03-28"]
    }
    
    // login 메서드: @escape 키워드를 사용해 escape closure 형태로 completion 정의
    // 해당 네트워크 작업이 끝날 때 -> completion closure에 네트워크의 결과를 담아서 호출
    func signUp(email : String,
               password : String,
               completion : @escaping (NetworkResult<Any>) -> Void)
    {
        // json 형태로 받아오기 위해 header 작성 -> 필요한 헤더를 Key-Value의 형태로 작성
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        // dataRequest: 주소를 가지고, post 방식으로, 인코딩 방식으로, 헤더 정보와 함께 요청을 보내기 위한 정보(요청서)
        let dataRequest = AF.request(APIConstants.signupURL,
                                     method: .post,
                                     parameters: makeParameter(email: email, password: password),
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        // dataRequest 요청서를 가지고 서버에 보내서 통신 request를 함 -> 결과는 dataResponse로 도착
        dataRequest.responseData { dataResponse in
            
            // dataResponse 안에는 통신에 대한 결과물이 들어있음
            dump(dataResponse)
            
            // dataResponse.result: 통신 성공했는지 실패했는지에 대한 여부
            switch dataResponse.result {
            case .success:
                
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure: completion(.pathErr)
                
            }
        }
        
    }
    
    // 서버에서 주는 값중에서 message만 빼서 밖으로 전달
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(SignupDataModel.self, from: data)
        else { return .pathErr}
        
        switch statusCode {
        
        case 200: return .success(decodedData.message)
        case 400: return .requestErr(decodedData.message)
        case 500: return .serverErr
        default: return .NetworkFail
        }
    }
    
    
    
}
