

func loveCalculator() {
    let loveScore = Int.random(in: 0...100)
    
    if loveScore >= 80 {
        print("You love each other like Kanye loves Kanys.")
    }
    else if loveScore <= 40 && loveScore < 80 {
        print("You go together like Coke and Mentos.")
    }
    else {
        print("You'll be forever alone.")
    }
}

loveCalculator()
