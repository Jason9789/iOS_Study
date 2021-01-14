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
    
    @IBAction func editButtonAction(_ sender: Any) {
        guard !list.isEmpty else {
            return
        }
        todoListTableView?.setEditing(true, animated: true)
        self.navigationItem.leftBarButtonItem = doneButton
    }
    
    @objc
    func doneButtonTap() {
        self.navigationItem.leftBarButtonItem = editButtonItem
        todoListTableView?.setEditing(false, animated: true)
    }
    
    @IBOutlet weak var todoListTableView: UITableView!
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonTap))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoListTableView?.delegate = self
        todoListTableView?.dataSource = self
        
        doneButton.style = .plain
        doneButton.target = self
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        list.remove(at: indexPath.row)
        todoListTableView?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 이미 체크 되어 있는 경우는 return
        guard !list[indexPath.row].isComplete else {
            return
        }
        
        // 리스트 선택 시 완료된 할 일 표시
        list[indexPath.row].isComplete = true
        
        let dialog = UIAlertController(title: "ToDo List", message: "일을 완료했습니다!", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        dialog.addAction(action)
        self.present(dialog, animated: true, completion: nil)
        
        todoListTableView?.reloadData()
    }
    
}

