//
//  DQRCodeBarCodeGenerator.swift
//  BarcodeQRCodeGenerator
//
//  Created by Dharmendra_Mobiloitte on 30/06/18.
//  Copyright © 2018 Dharmendra_Mobiloitte. All rights reserved.
//

import UIKit
import Foundation

enum CodeError: Error {
    case notGenerated(String)
}

class DQRCodeBarCodeGenerator: NSObject {

    static let sharedInstance = DQRCodeBarCodeGenerator()

    public func generateQRCode (dataString:String , completion :  @escaping (UIImage,Error) -> Void) {
        let data = dataString.data(using: String.Encoding.ascii)
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                let error = NSError(domain:"Generated", code:200, userInfo:nil)
                completion(UIImage(ciImage: output),error)
            } else {
                let error = NSError(domain:"Not Generated", code:0, userInfo:nil)
                completion(UIImage(),error)
            }
        }
    }
    
    
    public func generateBarcode(dataString: String,completion :  @escaping (UIImage,Error) -> Void) {
        let data = dataString.data(using: String.Encoding.ascii)
        if let filter = CIFilter(name: "CICode128BarcodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            if let output = filter.outputImage?.transformed(by: transform) {
                let error = NSError(domain:"Generated", code:200, userInfo:nil)
                completion(UIImage(ciImage: output),error)
            }else {
                let error = NSError(domain:"Not Generated", code:0, userInfo:nil)
                completion(UIImage(),error)
            }
        }
    }
    
    
    
    
    
}
