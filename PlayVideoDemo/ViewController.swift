import UIKit
import AVKit

class ViewController: UIViewController {
    
    @IBAction func playVideoClick(_ sender: AnyObject) {
        if let videoURL = Bundle.main.url(forResource: "test", withExtension: "mp4") {
            playVideo(videoURL)
        }
    }
    @IBAction func playVideoUrlClick(_ sender: Any) {
        let url = "https://devimages-cdn.apple.com/samplecode/avfoundationMedia/AVFoundationQueuePlayer_HLS2/master.m3u8"
        if let videoURL = URL(string: url) {
            playVideo(videoURL)
        }
    }
    
    func playVideo(_ videoURL: URL) {
        // checkURL(videoURL)
        let player = AVPlayer(url: videoURL)
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true, completion: nil)
        player.play()
    }
    
    func checkURL(_ videoURL:URL) {
        // 呼叫URL.checkResourceIsReachable()只支援系統檔案路徑檢查，
        // 其他路徑(網路)不是回傳false就是產生執行錯誤
        do {
            if try videoURL.checkResourceIsReachable() {
                print(true)
            } else {
                print(false)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

