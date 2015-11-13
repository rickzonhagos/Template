//: Playground - noun: a place where people can play

import UIKit

protocol URLServiceProtocol {
    typealias URLString
    func getURLString()->URLString
}
protocol URLRequestProtocol {
    
}


enum UserURL : URLServiceProtocol{
    case Login
    case UpdateProfile
    
    typealias URLString = String
    func getURLString() -> URLString {
        switch(self) {
            case .Login :
                return "Login"
            case .UpdateProfile:
                return "UpdateProfile"
        }
    }
}