//
//  ViewController.swift
//  MVVM_RxSwift
//
//  Created by 전판근 on 2021/01/28.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    var searchBar: UISearchBar { return searchController.searchBar }
    
    var viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchController()
        
        viewModel.data
            .drive(tableView.rx.items(cellIdentifier: "Cell")) { _, repository, cell in
                cell.textLabel?.text = repository.repoName
                cell.textLabel?.text = repository.repoURL
            }
            .disposed(by: disposeBag)
        
        searchBar.rx.text.orEmpty
            .bind(to: viewModel.searchText)
            .disposed(by: disposeBag)
        
        viewModel.data.asDriver()
            .map { "\($0.count) Repositories" }
            .drive(navigationItem.rx.title)
            .disposed(by: disposeBag)
    }

    func configureSearchController() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchBar.showsCancelButton = true
        searchBar.text = "Jason9789"
        searchBar.placeholder = "Enter GitHub ID, e.g., \"Jason9789\""
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
    }

}

