//
//  AddViewController.swift
//  ToDoLIst
//
//  Created by 전판근 on 2021/01/14.
//

import UIKit

class AddViewController: ViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    
    @IBAction func doneButton(_ sender: Any) {
        
        let title = titleTextField.text!
        let content = contentTextView.text ?? ""
        
        let item: TodoList = TodoList(title: title, content: content)
        list.append(item)
        print(item)
        print(list)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentTextView.layer.borderColor = UIColor.gray.cgColor  // 테두리 색상
        contentTextView.layer.borderWidth = 0.3 // 테두리 두께
        contentTextView.layer.cornerRadius = 2.0  // 모서리 둥글게
        contentTextView.clipsToBounds = true  //
    }

}
