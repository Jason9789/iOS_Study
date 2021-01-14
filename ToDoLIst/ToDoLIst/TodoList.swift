//
//  TodoList.swift
//  ToDoLIst
//
//  Created by 전판근 on 2021/01/14.
//

import Foundation

struct TodoList {
    var title: String = ""
    var content: String?
    var isComplete: Bool = false
    
    init(title: String, content: String, isComplete: Bool = false) {
        self.title = title
        self.content = content
        self.isComplete = isComplete
    }
}
