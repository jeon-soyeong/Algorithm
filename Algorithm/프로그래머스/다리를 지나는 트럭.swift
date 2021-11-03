//
//  다리를 지나는 트럭.swift
//  Algorithm
//  - 스택/큐
//  Created by 전소영 on 2021/10/28.
//

import Foundation

func solution(_ bridge_length: Int, _ weight: Int, _ truck_weights: [Int]) -> Int {
    //    var passedTruckArray: [Int] = []
    //    var passingTruckArray: [Int] = []
    //    var waitingTruckArray: [Int] = truck_weights
    //    var time = 0
    //    let truckWeightsCount = truck_weights.count
    //
    //    while passedTruckArray.count != truckWeightsCount {
    //        if passingTruckArray.count != 0 {
    //            time -= 1
    //        }
    //
    //        if waitingTruckArray.count != 0 {
    //            for _ in 1...bridge_length {
    //                var passingTruckArraySum = 0
    //                var waitingArrayCurrent = 0
    //
    //                if !waitingTruckArray.isEmpty {
    //                    waitingArrayCurrent = waitingTruckArray.removeFirst()
    //                }
    //
    //                for i in 0..<passingTruckArray.count {
    //                    passingTruckArraySum += passingTruckArray[i]
    //                }
    //
    //                if waitingArrayCurrent + passingTruckArraySum <= weight {
    //                    if passedTruckArray.count + passingTruckArray.count != truckWeightsCount {
    //                        passingTruckArray.append(waitingArrayCurrent)
    //                    }
    //                    time += 1
    //                } else {
    //                    waitingTruckArray.insert(waitingArrayCurrent, at: 0)
    //                }
    //            }
    //        }
    //        passedTruckArray.append(passingTruckArray.removeFirst())
    //        time += 1
    //    }
    //
    //    return time
    //---------------------------------------
    
    var onBridge: [Int] = []
    var times: [Int] = []
    var total = 0
    var w = weight
    var waits = truck_weights
    
    while !waits.isEmpty || !onBridge.isEmpty {
        total += 1
        
        // 큐의 첫번째가 시간이 다 됐으면 pop
        if let time = times.first, total - time == bridge_length {
            times.removeFirst()
            w += onBridge.removeFirst()
        }
        
        // 트럭이 들어갈 수 있으면
        if let truck = waits.first, truck <= w {
            w -= waits.removeFirst()
            onBridge.append(truck)
            times.append(total)
        }
    }
    
    return total
}
