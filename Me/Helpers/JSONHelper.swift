//
//  JSONHelper.swift
//  Me
//
//  Created by Sihem MOHAMED on 9/29/20.
//  Copyright © 2020 Simo. All rights reserved.
//

import Foundation

enum JSONError: LocalizedError, Equatable {
    case missingUrl
    case notConvertable
    case otherError(message: String)
    
    var errorDescription: String? {
        switch self {
        case .missingUrl:
            return "Oops!! Url not found"
        case .notConvertable:
            return "Oops!! Error while converting JSON"
        case .otherError(let message):
            return message
        }
    }
}

protocol JSONHelperProtocol {
    func readDataFromJsonURL<T: Decodable>(_ url: String, decode to: T.Type, completion: @escaping (Result<T, JSONError>) -> Void)
    func readDataFromJsonFile<T: Decodable>(_ file: String, decode to: T.Type, completion: @escaping (Result<T, JSONError>) -> Void)
}

final class JSONHelper: JSONHelperProtocol {
    
    func readDataFromJsonFile<T>(_ file: String, decode to: T.Type, completion: @escaping (Result<T, JSONError>) -> Void) where T:
        Decodable{
        guard let path = Bundle.main.path(forResource: file, ofType: "json", inDirectory: nil) else {
            completion(.failure(.missingUrl))
            return
        }
        let url = URL(fileURLWithPath: path)
        
        let jsonResult = decode(fromUrl: url, to: T.self)
        switch jsonResult {
        case .success(let model):
            completion(.success(model))
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    func readDataFromJsonURL<T>(_ url: String, decode to: T.Type, completion: @escaping (Result<T, JSONError>) -> Void) where T : Decodable {
        guard let url = URL(string: url) else {
            completion(.failure(.missingUrl))
            return
        }
        let jsonResult = decode(fromUrl: url, to: T.self)
        switch jsonResult {
        case .success(let model):
            completion(.success(model))
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    private func decode<JsonObject: Decodable>(fromUrl url: URL, to: JsonObject.Type) -> Result<JsonObject, JSONError> {
        do {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            return .success(try jsonDecoder.decode(JsonObject.self, from: data))
        }
        catch {
            print("decode Error = \(error)")
            return .failure(.otherError(message: error.localizedDescription))
        }
    }
    
    func getExperienceFromJSON(file: String, callback: @escaping (Result<[Experience], JSONError>) -> Void) {
        self.readDataFromJsonFile(file, decode: [Experience].self) { (result) in
            switch result {
            case .success(let experience):
                callback(.success(experience))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
    func getEducationFromJSON(file: String, callback: @escaping (Result<[Education], JSONError>) -> Void) {
        self.readDataFromJsonFile(file, decode: [Education].self) { (result) in
            switch result {
            case .success(let experience):
                callback(.success(experience))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
    func getProfileFromJSON(file: String, callback: @escaping (Result<Profile, JSONError>) -> Void) {
        self.readDataFromJsonFile(file, decode: Profile.self) { (result) in
            switch result {
            case .success(let profile):
                callback(.success(profile))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
    func getSkillsFromJSON(file: String, callback: @escaping (Result<[Skill], JSONError>) -> Void) {
        self.readDataFromJsonFile(file, decode: [Skill].self) { (result) in
            switch result {
            case .success(let skills):
                callback(.success(skills))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}
