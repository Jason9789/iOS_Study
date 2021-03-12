//
//  ViewController.swift
//  self-sizing-TableView
//
//  Created by 전판근 on 2021/03/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard let customCell = cell as? CustomTableViewCell else {
            return cell
        }
        
        customCell.titleLabel?.text = indexPath.description
        customCell.postLabel?.text = """
            asdfasdfqwefijaowsdikjfl;askd
            asdikfjoqiwejfoasdlkfjaszlkdf
            asdoikfjo;qiwejf
            asldkjfoqiwjefoaisjdl;k
            """
        cell.detailTextLabel?.numberOfLines = 0
        customCell.myImageView?.image = UIImage(named: "\(indexPath.row % 3)")
        
        return cell
    }
}

