

func loveCalculator() {
    let loveScore = Int.random(in: 0...100)
    
    switch loveScore {
    case 81...100:
        print("You love each other like Kanye loves Kanys.")
    case 40..<81:
        print("You go together like Coke and Mentos.")
    case ..<40:
        print("You'll be forever alone.")
    default:
        print("Error")
    }
    
    
    if loveScore >= 80 {
        print("You love each other like Kanye loves Kanys.")
    }
    else if loveScore >= 40{
        print("You go together like Coke and Mentos.")
    }
        
    else {
        print("You'll be forever alone.")
    }
}

loveCalculator()

