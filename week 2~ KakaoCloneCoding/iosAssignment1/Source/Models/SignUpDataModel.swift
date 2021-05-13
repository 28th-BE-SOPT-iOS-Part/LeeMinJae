//
//  SignUpDataModel.swift
//  iosAssignment1
//
//  Created by 민 on 2021/05/12.
//

import Foundation

// MARK: - SignupDataModel
struct SignupDataModel: Codable {
    let success: Bool
    let message: String
    let data: SignupUserData?   // 성공/실패에 따라 data 있고/없고가 다르기 때문에 ?(옵셔널)형으로 사용
    
    // 서버에서 넘어오는 데이터의 구조가 바뀌었을 때(Key의 이름이 변경되었을 때)를 대비! -> CodingKeys 활용
    enum CodingKeys: String, CodingKey {
        case success
        case message
        case data
    }
    
    // 서버에서 넘어오는 데이터의 구조가 바뀌었을 때(Key-value가 상이할 때)를 대비!
    init(from decoder : Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(SignupUserData.self, forKey: .data)) ?? nil
    }
}

// MARK: - DataClass
struct SignupUserData: Codable {
    let nickname : String

    // 서버에서 넘어오는 데이터의 구조가 바뀌었을 때(Key의 이름이 변경되었을 때)를 대비! -> CodingKeys 활용
    enum CodingKeys: String, CodingKey {
        case nickname = "user_nickname"
    }
}
