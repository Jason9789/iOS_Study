import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func keyPressed(_ sender: UIButton) {
        
//        print(sender.currentTitle)
        let inputScale = sender.currentTitle
        
        print(inputScale!)
        playSound(soundName: inputScale!)
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
