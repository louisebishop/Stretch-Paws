//
//  YogaTimer.swift
//  Stretch+Paws
//
//  Created by Louise Bishop on 22/10/2021.
//

import Foundation
import AVFoundation

// What kind of data type should this be? A class or a struct?
// Where does the timer need to be shared?

class YogaTimer: ObservableObject {
  
  // Timer states
  @Published var timerActive = false
  @Published var timerPaused = false
  @Published var timerEnded = false
  var poseMinutes = 1
  var poseSeconds = 30
  var yogaTimer = Timer()
  var audioPlayer: AVAudioPlayer?
  
  // Timer functionality
  @Published var timerMinutes: Int = 0
  @Published var timerSeconds: Int = 30
  
  // Start the timer
  
  func startTimer() {
    timerMinutes = poseMinutes
    timerSeconds = poseSeconds
    setTimer()
  }
  
  func setTimer() {
    timerActive = true
    timerPaused = false
    timerEnded = false
    yogaTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { Timer in

      // When seconds gets to 1, reset seconds to 59, unless minutes is also 0
        if self.timerSeconds == 1 && self.timerMinutes != 0 {
          self.timerSeconds = 59
          self.timerMinutes -= 1
        } else {
          self.timerSeconds -= 1
        }
      // When both seconds and minutes are 0, stop the timer
      if self.timerMinutes == 0 && self.timerSeconds == 0 {
        self.stopTimer()
      }
    })
  }
  
  // Pause the timer
  
  func pauseTimer() {
    timerActive = false
    timerPaused = true
    yogaTimer.invalidate()
  }
  
  // End the timer
  func stopTimer() {
    playSound(sound: "chime", type: "wav")
    timerEnded = true
    timerActive = false
    yogaTimer.invalidate()
    timerMinutes = poseMinutes
    timerSeconds = poseSeconds
  }
  
  // Play a sound
  func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
      do {
        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
        audioPlayer?.play()
      } catch {
        print("ERROR")
      }
    }
  }
  
  // Timer styles
  
  func setTitleText() -> String {
    if timerEnded {
      return "You did it!"
    } else {
      return "Hold that pose"
    }
  }
  
  func setDescriptionText() -> String {
    if timerEnded {
      return "Purrrfect!"
    } else {
      return "Try staying in this pose for 30 seconds. If you need to come out sooner, that's ok."
    }
  }
}


