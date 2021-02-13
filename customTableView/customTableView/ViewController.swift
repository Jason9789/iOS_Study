//
//  ViewController.swift
//  customTableView
//
//  Created by 전판근 on 2021/02/13.
//

import UIKit

class ViewController: UIViewController {

    var personData: [PersonData] = []
    private let personNames = ["아이유", "정우성"]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configure() {
        tableView.dataSource = self
        tableView.rowHeight = 100
    }
    
    private func addSubView() {
        view.addSubview(tableView)
    }
    
    private func autoLayout() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: guide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
        ])
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ talbeView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        cell.personImage.image = personData[indexPath.row].personImage ?? UIImage(named: "default")
        cell.personName.text = personData[indexPath.row].personName ?? ""
        cell.personAge.text = String(personData[indexPath.row].personAge)
        return cell
    }
}
