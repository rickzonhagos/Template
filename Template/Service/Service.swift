//
//  Service.swift
//  Template
//
//  Created by Cirrena on 13/11/2015.
//  Copyright © 2015 Rickzon Hagos. All rights reserved.
//

import UIKit

enum HTTPErrorType : CustomStringConvertible {
    case NoInternetConnection
    case JSONDataError
    case ServerError
    
    var description : String {
        switch (self) {
        case .NoInternetConnection:
            return  ""
        default :
            return ""
        }
    }
}
typealias successCompletionBlock = (data : BaseModelData) -> Void
typealias failedCompletionBlock = (errorType : HTTPErrorType) -> Void

class Service : NSObject , NSURLSessionDelegate{
    var mySession : NSURLSession!
    
    private static let timeOutInterval : NSTimeInterval = 30.0
    private static let allowCellularAccess = true
    
    
    init(session : NSURLSession!){
        mySession = session
    }
    convenience override init(){
        let theSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        self.init(session : theSession)
    }
    
    private func sendRequest(httpMethod : String="POST")(urlRequest : NSMutableURLRequest!,
        returnData : BaseModelData.Type!,
        returnParameters : [String : AnyObject]?,
        successCompletionHandler : successCompletionBlock,
        failedCompletionHandler : failedCompletionBlock){
        
        let myTask : NSURLSessionDataTask =  mySession.dataTaskWithRequest(urlRequest, completionHandler: {(myData : NSData?, myResponse :  NSURLResponse?, myError : NSError?) -> Void in
            
            dispatch_async(dispatch_get_main_queue(), {
                if let URLRequestError  = myError ,
                    code : Int = URLRequestError.code  ,
                    domain : String = URLRequestError.domain
                    where code == NSURLErrorNotConnectedToInternet && domain  == NSURLErrorDomain{
                        failedCompletionHandler(errorType: HTTPErrorType.NoInternetConnection)
                        return
                }
                if let returnedData = myData{
                    //let newStr = NSString(data: returnedData, encoding: NSUTF8StringEncoding)
                    do {
                        let jsonObject : AnyObject?  = try NSJSONSerialization.JSONObjectWithData(returnedData, options: NSJSONReadingOptions.MutableContainers)
                        if let jsonDictionary  = jsonObject as? [String : AnyObject] {
                            let result = returnData.init(data :jsonDictionary, returnParams :  returnParameters)
                            successCompletionHandler(data: result)
                        }else{
                            //JSON is empty
                            failedCompletionHandler(errorType : HTTPErrorType.ServerError)
                        }
                    } catch let parseError as NSError {
                        //error
                        //Flurry.logError("HTTPRequestError", message: "failedCompletionHandler", error: parseError)
                        failedCompletionHandler(errorType : HTTPErrorType.ServerError)
                        
                    } catch {
                        failedCompletionHandler(errorType : HTTPErrorType.ServerError)
                    }
                    
                }else{
                    failedCompletionHandler(errorType : HTTPErrorType.ServerError)
                }
            })
            
        })
        myTask.resume()
    }
    deinit{
        print("\(self) deinit")
        print("\(self.mySession) deinit")
        
        self.mySession.finishTasksAndInvalidate()
        
    }
    
    
    // MARK:
    // MARK: Create Request
    // MARK:
    
    
    func Post(urlRequest : NSMutableURLRequest!,
        returnParameters : [String : AnyObject]?,
        returnData : BaseModelData.Type!,
        successCompletionHandler : successCompletionBlock! ,
        failedCompletionHandler : failedCompletionBlock!){
            
            sendRequest()(urlRequest: urlRequest,
                returnData: returnData,
                returnParameters: returnParameters,
                successCompletionHandler: successCompletionHandler,
                failedCompletionHandler: failedCompletionHandler)
    }
    
    
    func Get(urlRequest : NSMutableURLRequest!,
        returnParameters : [String : AnyObject]?,
        returnData : BaseModelData.Type!,
        successCompletionHandler : successCompletionBlock! ,
        failedCompletionHandler : failedCompletionBlock!){
            
            sendRequest("GET")(urlRequest: urlRequest,
                returnData: returnData,
                returnParameters: returnParameters,
                successCompletionHandler: successCompletionHandler,
                failedCompletionHandler: failedCompletionHandler)
    }
       
}