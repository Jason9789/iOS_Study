//
//  ViewController.swift
//  ToDoLIst
//
//  Created by 전판근 on 2021/01/14.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func addButton(_ sender: Any) {
        let addVC = self.storyboard?.instantiateViewController(withIdentifier: "AddViewController")
//        addVC?.modalPresentationStyle = .fullScreen
//        self.present(addVC!, animated: true, completion: nil)
        self.navigationController?.pushViewController(addVC!, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

