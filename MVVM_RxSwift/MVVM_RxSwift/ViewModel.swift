//
//  ViewModel.swift
//  MVVM_RxSwift
//
//  Created by 전판근 on 2021/01/28.
//

import RxSwift
import RxCocoa

class ViewModel {
//    let searchText = Variable<String>(nil)
    let searchText = BehaviorRelay(value: "")
    
    lazy var data: Driver<[Repository]> = {

            return self.searchText.asObservable()
                .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMapLatest(ViewModel.repositoriesBy)
                .asDriver(onErrorJustReturn: [])
        }()
    
    static func repositoriesBy(_ githubID: String) -> Observable<[Repository]> {
            guard !githubID.isEmpty,
                let url = URL(string: "https://api.github.com/users/\(githubID)/repos") else {
                return Observable.just([])
             }
        return URLSession.shared.rx.json(url: url)
            .retry(3)
//            .catchErrorJustReturn([])
            .map(parse)
        }
    
    static func parse(json: Any) -> [Repository] {
        guard let items = json as? [[String: Any]] else {
            return []
        }
        
        var repositories = [Repository]()
        
        items.forEach {
            guard let repoName = $0["name"] as? String,
                  let repoURL = $0["html_url"] as? String else {
                return
            }
            repositories.append(Repository(repoName: repoName, repoURL: repoURL))
        }
        return repositories
    }
    
    
}
