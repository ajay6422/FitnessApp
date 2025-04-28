import UIKit
import AVFoundation

class MusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var stopButton: UIButton!
    
    var songs: [String] = []
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 1. Load songs
        songs = (1...20).map { "Song\($0)" } // Just placeholders, replace with real song names if needed
        
        // 2. Setup TableView
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        // 3. Setup Stop Button
        stopButton = UIButton(type: .system)
        stopButton.setTitle("Stop Song", for: .normal)
        stopButton.addTarget(self, action: #selector(stopSong), for: .touchUpInside)
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stopButton)
        
        // 4. Layout
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: stopButton.topAnchor, constant: -10),
            
            stopButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = songs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        playSong(named: songs[indexPath.row])
    }
    
    
    // MARK: - Play and Stop
    
    func playSong(named songName: String) {
        guard let url = Bundle.main.url(forResource: songName, withExtension: "mp3") else {
            print("Song not found")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            print("Playing: \(songName)")
        } catch {
            print("Error playing song: \(error)")
        }
    }
    
    @objc func stopSong() {
        if audioPlayer?.isPlaying == true {
            audioPlayer?.stop()
            print("Song stopped")
        }
    }
}
