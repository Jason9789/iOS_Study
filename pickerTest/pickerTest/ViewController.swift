//
//  ViewController.swift
//  pickerTest
//
//  Created by 판근 on 2020/08/25.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit

//class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
//
//    // 배변 종류 선택 text Field
//       @IBOutlet weak var kindPicker: UITextField!
//
//    var selectedKind: String?
//    let kind = ["제 1형", "제 2형", "제 3형", "제 4형" , "제 5형", "제 6형", "제 7형"]
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        kindPicker.tintColor = .clear
//        createPickerView()
//        dismissPickerView()
//
//
//    }
//
//    // Kind Picker
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return kind.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return kind[row]
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        selectedKind = kind[row]
//        kindPicker.text = selectedKind
//    }
//
//    func createPickerView() {
//        let pickerView = UIPickerView()
//        pickerView.delegate = self
//        kindPicker.inputView = pickerView
//    }
//
//    func dismissPickerView() {
//
//        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 35))
//        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.pickerDone))
//        toolBar.setItems([button], animated: true)  // 툴바에 Done 버튼 추가
//
//        toolBar.updateConstraintsIfNeeded()
//        toolBar.isUserInteractionEnabled = true
//        kindPicker.inputAccessoryView = toolBar
//    }
//
//    @objc func pickerDone() {
//        view.endEditing(true)
//    }
//}

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    
    var selectedCountry: String?
    var countryList = ["Algeria", "Andorra", "Angola", "India", "Thailand"]
    @IBOutlet weak var textFiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        createPickerView()
        dismissPickerView()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryList[row]
       
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountry = countryList[row]
        textFiled.text = selectedCountry
        print("\(textFiled.text!)")
    }
    
    func createPickerView() {
        print("create")
        let pickerView = UIPickerView()
        pickerView.delegate = self
        textFiled.inputView = pickerView
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
//        toolBar.sizeToFit()
        toolBar.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35)
        
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        textFiled.inputAccessoryView = toolBar
    }
    
    @objc func action() {
        print("Done")
       view.endEditing(true)
    }


}
