//
//  MultipleChangesVC.swift
//  Multiple Group TableView
//
//  Created by Meghna on 07/04/22.
//

import UIKit

class MultipleChangesVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtGroup1txt3: UITextField!
    @IBOutlet weak var txtGroup1txt2: UITextField!
    @IBOutlet weak var txtGroup1txt1: UITextField!
    @IBOutlet weak var txtGroup2txt1: UITextField!
    @IBOutlet weak var txtGroup2txt2: UITextField!
    @IBOutlet weak var txtGroup2txt3: UITextField!
    @IBOutlet weak var group1Txt: UITextField!
    @IBOutlet weak var group2Txt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        group1Txt.delegate = self
        group2Txt.delegate = self
        
        group1Txt.text = "0"
        group2Txt.text = "0"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
    }
    
    @IBAction func textFieldEditingDidChange(_ sender: Any) {
        print("textField: \((sender as AnyObject).text!)")
        txtGroup1txt1.text = (" \((sender as AnyObject).text!)")
        txtGroup1txt2.text = (" \((sender as AnyObject).text!)")
        txtGroup1txt3.text = (" \((sender as AnyObject).text!)")
        
        
    }
    @IBAction func textFieldEditingDidChangeForGroup2(_ sender: Any) {
        print("textField: \((sender as AnyObject).text!)")
        txtGroup2txt1.text = (" \((sender as AnyObject).text!)")
        txtGroup2txt2.text = (" \((sender as AnyObject).text!)")
        txtGroup2txt3.text = (" \((sender as AnyObject).text!)")
        
    }
    
    @IBAction func group1AddButtonClick(_ sender: UIButton) {
        var baseValue = Int(group1Txt.text ?? "0")
        baseValue =  baseValue! + 1
        group1Txt.text = String(baseValue!)
        txtGroup1txt1.text = String(baseValue!)
        txtGroup1txt2.text = String(baseValue!)
        txtGroup1txt3.text = String(baseValue!)
    }
    
    @IBAction func group1MinusButtonClick(_ sender: UIButton) {
        var baseValue = Int(group1Txt.text ?? "0")
        baseValue =  baseValue! - 1
        group1Txt.text = String(baseValue!)
        txtGroup1txt1.text = String(baseValue!)
        txtGroup1txt2.text = String(baseValue!)
        txtGroup1txt3.text = String(baseValue!)
    }
    @IBAction func group2AddButtonClick(_ sender: UIButton) {
        
        
        var baseValue = Int(group2Txt.text ?? "0")
        baseValue =  baseValue! + 1
        group2Txt.text = String(baseValue!)
        txtGroup2txt1.text = String(baseValue!)
        txtGroup2txt2.text = String(baseValue!)
        txtGroup2txt3.text = String(baseValue!)
        
    }
    @IBAction func group2MinusButtonClick(_ sender: UIButton) {
       
        var baseValue = Int(group2Txt.text ?? "0")
        baseValue =  baseValue! - 1
        group2Txt.text = String(baseValue!)
        txtGroup2txt1.text = String(baseValue!)
        txtGroup2txt2.text = String(baseValue!)
        txtGroup2txt3.text = String(baseValue!)
       
    }
}
