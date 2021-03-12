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
        
        cell.textLabel?.text = indexPath.description
        cell.detailTextLabel?.text = """
            asdfasdfqwefijaowsdikjfl;askd
            asdikfjoqiwejfoasdlkfjaszlkdf
            asdoikfjo;qiwejf
            asldkjfoqiwjefoaisjdl;k
            """
        cell.detailTextLabel?.numberOfLines = 0
        cell.imageView?.image = UIImage(named: "\(indexPath.row % 3)")
        
        return cell
    }
}

