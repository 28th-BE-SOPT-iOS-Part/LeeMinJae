//
//  NetworkResult.swift
//  iosAssignment1
//
//  Created by 민 on 2021/05/10.
//

// 서버 통신 결과를 처리하기 위한 파일
import Foundation

enum NetworkResult<T> {
    case success(T)     // 서버 통신에 성공했을 때
    case requestErr(T)  // 요청 에러가 발생했을 때
    case pathErr        // 경로 에러가 발생했을 때
    case serverErr      // 서버의 내부적 에러가 발생했을 때
    case NetworkFail    // 네트워크 연결 실패했을 때
}
