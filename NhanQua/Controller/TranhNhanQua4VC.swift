//
//  TranhNhanQua4VC.swift
//  NhanQua
//
//  Created by Rea Won Kim on 8/27/17.
//  Copyright © 2017 Rea Won Kim. All rights reserved.
//

import UIKit
import SVProgressHUD
import AssistantKit
import RxSwift
import RxCocoa
import AVFoundation
import MediaPlayer
class TranhNhanQua4VC: BaseViewController, UITableViewDelegate {

    @IBOutlet weak var sliderAudio: SliderMaterial!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuBarBtn: UIBarButtonItem!
    fileprivate var isSliding = false
    fileprivate let SLIDER_UPDATE_DURATION = 0.2
    fileprivate var timePlayCurrent = TimeInterval()
    fileprivate var timer: Timer?
    var avAudioPlayer : AVAudioPlayer!
    var imageURLs = [String]()
    let cellSpacingHeight: CGFloat = 10
    let device = Device.type
    let disposeBag = DisposeBag()
    var songName = ""
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, String>>(
        configureCell: { (_, tv, indexPath, element) in
            let cell = tv.dequeueReusableCell(withIdentifier: "cell")!
            cell.textLabel?.text = "\(element)"
            
            return cell
    },
        titleForHeaderInSection: { dataSource, sectionIndex in
            return dataSource[sectionIndex].model
    }
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if revealViewController() != nil {
            menuBarBtn.target = self.revealViewController()
            menuBarBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        sliderAudio.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(gesture:))))
        
        let dataSource = self.dataSource
        
        let items = Observable.just([
            SectionModel(model: "Thượng Toạ Thích Chân Quang", items: [
                "Sự Giấu Mặt Của Luật Nhân Quả",
                "Nhân Quả Giàu Nghèo",
                ]),
            SectionModel(model: "Thầy Thích Trí Thoát", items: [
                "Nhân Quả 3 Đời",
                ]),
            ])
        
        
        items
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        tableView.rx
            .itemSelected
            .map { indexPath in
                return (indexPath, dataSource[indexPath])
            }
            .subscribe(onNext: { pair in
                if pair.0 == [0, 0] {
                    self.playAudio(value: "1")
                }else if pair.0 == [0, 1] {
                    self.playAudio(value: "2")
                }else if pair.0 == [1, 0] {
                    self.playAudio(value: "3")
                }else {
                    self.playAudio(value: "1")
                }
                self.songName = pair.1
                self.updateDuration()
            })
            .disposed(by: disposeBag)
        
        tableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        playBackgroundMusic()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable(tableView: tableView)
    }
    
    func playAudio(value : String) {
        if let mp3String = Bundle.main.path(forResource: value, ofType: "mp3") {
            let url = NSURL(fileURLWithPath: mp3String)
            do {
                avAudioPlayer = try AVAudioPlayer(contentsOf: url as URL, fileTypeHint: "mp3")
                avAudioPlayer.play()
                sliderAudio.maximumValue = Float(avAudioPlayer.duration)
                print(sliderAudio.maximumValue)
                showArtWork(avAudioPlayer)
            }catch {
                print(error.localizedDescription)
            }
        }
    }
    
    @objc public func updateDurationUI(isSeeking: Bool = false) {
        guard let avAudioPlayer = avAudioPlayer else { return }
            let curValue = avAudioPlayer.currentTime
            
            UIView.animate(withDuration: SLIDER_UPDATE_DURATION, animations: {
                self.sliderAudio.setValue(Float(curValue), animated: true)
            })
            
            timePlayCurrent = avAudioPlayer.currentTime
    }
    
    fileprivate func updateDuration(_ force: Bool = false) {
        if UIApplication.shared.applicationState != .background || force {
            timer?.invalidate()
            guard let avAudioPlayer = avAudioPlayer else { return }
            timer = Timer.scheduledTimer(timeInterval: SLIDER_UPDATE_DURATION, target: self, selector: #selector(updateDurationUI), userInfo: nil, repeats: true)
            sliderAudio.maximumValue = Float(avAudioPlayer.duration)
        }
    }
    
    func handleTap(gesture: UITapGestureRecognizer) {
        guard let avAudioPlayer = avAudioPlayer else { return }
        //if !isSliding {
            let xOrigin = gesture.location(in: sliderAudio).x
            var value = xOrigin
            value = CGFloat(sliderAudio.maximumValue) * xOrigin / sliderAudio.frame.size.width
            sliderAudio.setValue(Float(value), animated: true)
            timePlayCurrent = TimeInterval (sliderAudio.value)
            avAudioPlayer.currentTime = timePlayCurrent
            updateDurationUI(isSeeking: true)
        //} else {
          //  isSliding = false
            
        //}
    }
    
    fileprivate func showArtWork(_ avAudioPlayer: AVAudioPlayer) {
        let artwork = MPMediaItemArtwork(image: (UIImage(named:"Logo"))!)
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
            MPMediaItemPropertyTitle: songName,
            MPMediaItemPropertyArtist: "",
            MPMediaItemPropertyPlaybackDuration: avAudioPlayer.duration,
            MPMediaItemPropertyArtwork: artwork,
            MPNowPlayingInfoPropertyElapsedPlaybackTime: avAudioPlayer.currentTime
        ]
        UIApplication.shared.beginReceivingRemoteControlEvents()
        becomeFirstResponder()
    }

    private func playBackgroundMusic() {
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: .defaultToSpeaker)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
