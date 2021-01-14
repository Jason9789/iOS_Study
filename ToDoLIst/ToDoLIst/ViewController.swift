//
//  ViewController.swift
//  ToDoLIst
//
//  Created by 전판근 on 2021/01/14.
//

import UIKit

var list = [TodoList]()

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
    
    override func viewDidAppear(_ animated: Bool) {
        todoListTableView?.reloadData()
    }
}

// TableView extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
        cell.textLabel?.text = list[indexPath.row].title
        cell.detailTextLabel?.text = list[indexPath.row].content
        
        if list[indexPath.row].isComplete {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    
}

