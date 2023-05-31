//
//  BaseAPIService.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/26.
//

import Foundation

class BaseAPIService {
    
}

extension BaseAPIService {
    
    private func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, of type: T) -> NetworkResult<Any> {
        switch statusCode {
        case 200...299: return isValidData(data: data, of: type)
        case 400...499: return isValidData(data: data, of: type)
        case 500: return .serverError
        default: return .networkError
        }
    }
    
    private func isValidData<T: Codable>(data: Data, of type: T) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else { return .pathError }
        return .success(decodedData as Any)
    }
    
}
