//
//  음계.swift
//  Algorithm
//  - 구현
//  Created by 전소영 on 2021/03/16.
//

import Foundation

func sortingMusicKey() {
    let inputMusicKey = readLine() ?? ""
    let inputMusicKeyArray = inputMusicKey.split { $0 == " " }.compactMap { Int($0) }
    
    if inputMusicKeyArray == inputMusicKeyArray.sorted(by: >) {
        print("descending")
    } else if inputMusicKeyArray == inputMusicKeyArray.sorted(by: <) {
        print("ascending")
    } else {
        print("mixed")
    }
}

