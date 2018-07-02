//
//  ViewController.swift
//  BarcodeQRCodeGenerator
//
//  Created by Dharmendra_Mobiloitte on 30/06/18.
//  Copyright © 2018 Dharmendra_Mobiloitte. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var generateBarCodeBtn: UIButton!
    @IBOutlet weak var codeImageView: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        generateButton.layer.cornerRadius = 5.0
        generateBarCodeBtn.layer.cornerRadius = 5.0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtField.resignFirstResponder()
        return true
    }
    
    @IBAction func generateButtonAction(_ sender: UIButton) {
        self.view.endEditing(true)
        
        DQRCodeBarCodeGenerator.sharedInstance.generateQRCode(dataString: txtField.text!) { (img,err) in
            self.codeImageView.image = img
        }
        
    }


    @IBAction func generateBarCodeButtonAction(_ sender: Any) {
        
        DQRCodeBarCodeGenerator.sharedInstance.generateBarcode(dataString: txtField.text!) {
            (img,err) in
            
            self.codeImageView.image = img
            
        }
        
        
        
    }
    
    
}

