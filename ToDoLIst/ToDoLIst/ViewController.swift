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
        self.navigationController?.pushViewController(addVC!, animated: true)
    }
    
    @IBOutlet weak var todoListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoListTableView?.delegate = self
        todoListTableView?.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "\(indexPath)"
        
        return cell
    }
    
    
}

