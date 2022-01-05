//
//  방금그곡.swift
//  Algorithm
//
//  Created by 전소영 on 2022/01/04.
//

import Foundation

func solution(_ m: String, _ musicinfos: [String]) -> String {
    var musicInfoArray = musicinfos.split(separator: ",")[0].map { $0.components(separatedBy: ",") }
    var result: [(title: String, time: Int)] = []
    let m = m.replacingOccurrences(of: "C#", with: "c")
        .replacingOccurrences(of: "D#", with: "d")
        .replacingOccurrences(of: "F#", with: "f")
        .replacingOccurrences(of: "G#", with: "g")
        .replacingOccurrences(of: "A#", with: "a")

    for i in 0..<musicInfoArray.count {
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        
        guard let startTime = format.date(from: musicInfoArray[i][0]) else {
            return ""
        }
        
        guard let endTime = format.date(from: musicInfoArray[i][1]) else {
            return ""
        }
        
        musicInfoArray[i].append("\(Int(endTime.timeIntervalSince(startTime)) / 60)")
       
        let info = musicInfoArray[i][3].replacingOccurrences(of: "C#", with: "c")
            .replacingOccurrences(of: "D#", with: "d")
            .replacingOccurrences(of: "F#", with: "f")
            .replacingOccurrences(of: "G#", with: "g")
            .replacingOccurrences(of: "A#", with: "a").map { String($0) }
        
        guard let minutes =  Int(musicInfoArray[i][4]) else {
            return ""
        }
        
        var melody = ""
        for i in 0..<minutes {
            let index = i % info.count
            melody += info[index]
        }
        
        if melody.contains(m) {
            result.append((musicInfoArray[i][2], minutes))
        }
    }
    
    return result.max { $0.1 < $1.1 }?.title ?? "(None)"
}
