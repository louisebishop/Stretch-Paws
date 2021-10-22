//
//  YogaTimer.swift
//  Stretch+Paws
//
//  Created by Louise Bishop on 22/10/2021.
//

import Foundation

// What kind of data type should this be? A class or a struct?
// Where does the timer need to be shared?

class YogaTimer {
  
  // Timer states
  var timerActive = false
  var timerPaused = false
  var timerEnded = false
  var timerDuration = 30
  var yogaTimer = Timer()
  
  // Timer functionality
  
  // Start the timer
  
  func startTimer() {
    timerActive = true
    yogaTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { Timer in
      // Remove a second from the timer duration & loop over
      self.timerDuration -= 1
      // If the timer gets to 0, stop the timer
      if self.timerDuration == 0 {
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
    // Play a sound
    timerEnded = true
    timerActive = false
    yogaTimer.invalidate()
    timerDuration = 30
  }
  
  // Play a sound
  func playSound() {
    // Play audio file
  }
  
  // Countdown ??
  
}


