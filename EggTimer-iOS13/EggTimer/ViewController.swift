import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLable: UILabel!
    
//    let eggTime = ["Soft": 300, "Medium": 420, "Hard": 720]
    let eggTime = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    // time
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var secondsRemaining = 0
    
    // alarm
    var player: AVAudioPlayer!
    
    // 선택한 계란에 따라 soft, medium, hard 선택
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        // 다른 타이머가 실행될 시 이전 타이머는 중지시키고 새로운 타이머 작동
        timer.invalidate()
        
        // Soft, Medium, Hard
        let hardness = sender.currentTitle!

        // 선택된 계란에 따라서 남은 초시간 설정
        totalTime = eggTime[hardness]!
        secondsRemaining = eggTime[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLable.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    // @objc : object-c
    @objc func updateTimer() {
        // Soft, Medium, Hard
        
        if secondsPassed < totalTime {
            
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            
            progressBar.progress = Float(percentageProgress)
            print(Float(percentageProgress))
            titleLable.text = "\(secondsRemaining)s"
            
            secondsPassed += 1    // 1초씩 시간 지남
            secondsRemaining -= 1 // 1초씩 감소
        }
            
        // 시간이 다 되었을 시.
        else {
            timer.invalidate()
            
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            
            progressBar.progress = Float(percentageProgress)
            titleLable.text = "DONE!"
            print("DONE!!")
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}
