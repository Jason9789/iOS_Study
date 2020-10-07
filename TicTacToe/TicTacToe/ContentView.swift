//
//  ContentView.swift
//  TicTacToe
//
//  Created by 판근 on 2020/10/07.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import SwiftUI
import Combine

enum SquareStatus {
    case empty
    case visitor
    case home
}

struct Square {
    var status: SquareStatus
}

class ModelBoard: ObservableObject {
    @Published var squares = [Square]()
    init() {
        for _ in 0...8 {
            squares.append(Square(status: .empty))  // add 9 empty squares to the array
        }
    }
    
    func resetGame() {  // reset all squares to empty
        for i in 0...8 {
            squares[i].status = .empty
        }
    }
    
    var gameOver: (SquareStatus, Bool) {    // checks for game over
        get {
            if thereIsAWinner != .empty {
                return (thereIsAWinner, true)
            } else {
                for i in 0...8 {
                    if squares[i].status == .empty {
                        return (.empty, false)
                    }
                }
                return (.empty, true)
            }
        }
    }
    
    private var thereIsAWinner: SquareStatus {  // check all possible ways of winning, get{}
        get {
            if let check = self.checkIndexs([0, 1, 2]) {
                return check
            } else if let check = self.checkIndexs([3, 4, 5]) {
                return check
            } else if let check = self.checkIndexs([6, 7, 8]) {
                return check
            } else if let check = self.checkIndexs([0, 3, 6]) {
                return check
            } else if let check = self.checkIndexs([1, 4, 7]) {
                return check
            } else if let check = self.checkIndexs([2, 5, 8]) {
                return check
            } else if let check = self.checkIndexs([0, 4, 8]) {
                return check
            } else if let check = self.checkIndexs([2, 4, 6]) {
                return check
            }
            return .empty
        }
    }
    
    private func checkIndexs(_ indexes: [Int]) -> SquareStatus? {
        var homeCounter: Int = 0
        var visitorCounter: Int = 0
        for anIndex in indexes {
            let aSquare = squares[anIndex]
            if aSquare.status == .home {
                homeCounter = homeCounter + 1
            } else if aSquare.status == .visitor {
                visitorCounter = visitorCounter + 1
            }
        }
        
        if homeCounter == 3 {
            return .home
        } else if visitorCounter == 3 {
            return .visitor
        }
        return nil
    }
    
    private func aiMove() {
        var anIndex = Int.random(in: 0...8)
        while (makeMove(index: anIndex, player: .visitor) == false && gameOver.1 == false) {
            anIndex = Int.random(in: 0...8)
        }
    }
    
    func makeMove(index: Int, player: SquareStatus) -> Bool {
        if squares[index].status == .empty {        // if there is no x or o in square
            var square = squares[index]             // get index of square
            square.status = player                  // set square status to player
            squares[index] = square                 // index of squares array assigned to square
            if player == .home { aiMove() }         // make the AI move when player has decided
            return true
        }
        return false
    }
}

struct SquareView: View {
    var dataSource: Square
    var action: () -> Void
    var body: some View {
        Button(action: {
            print(self.dataSource.status)
            self.action()
        }) {
            Text((dataSource.status != .empty) ?
                (dataSource.status != .visitor) ? "X" : "0"
                : " ")
                .font(.largeTitle)
                .foregroundColor(Color.black)
                .frame(minWidth: 60, minHeight: 60)
                .background(Color.gray)
                .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
        }
    }
}

struct MainBoard: View {
    @ObservedObject var checker = ModelBoard()
    @State private var isGameOver = false
    
    func buttonAction(_ index: Int) {
        _ = self.checker.makeMove(index: index, player: .home)
        self.isGameOver = self.checker.gameOver.1   // assigns the returend value, which is bool
    }
    
    var body: some View {
        VStack {
            HStack {
                SquareView(dataSource: checker.squares[0]) { self.buttonAction(0) }
                SquareView(dataSource: checker.squares[1]) { self.buttonAction(1) }
                SquareView(dataSource: checker.squares[2]) { self.buttonAction(2) }
            }
            HStack {
                SquareView(dataSource: checker.squares[3]) { self.buttonAction(3) }
                SquareView(dataSource: checker.squares[4]) { self.buttonAction(4) }
                SquareView(dataSource: checker.squares[5]) { self.buttonAction(5) }
            }
            HStack {
                SquareView(dataSource: checker.squares[6]) { self.buttonAction(6) }
                SquareView(dataSource: checker.squares[7]) { self.buttonAction(7) }
                SquareView(dataSource: checker.squares[8]) { self.buttonAction(8) }
            }
        }
        .alert(isPresented: $isGameOver) {
            Alert(title: Text("Game Over"),
            message: Text(self.checker.gameOver.0 != .empty ?
            (self.checker.gameOver.0 == .home) ? "You Win" : "iPhone Winds!"
            : "Parity"), dismissButton: Alert.Button.destructive(Text("OK"), action: {
            }) )
        }
    }
}


struct ContentView: View {
    var body: some View {
        MainBoard()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
