//
//  Sticker.swift
//  Test_APP
//
//  Created by 윤지호 on 2023/07/07.
//

import Foundation


struct Sticker: Codable, Identifiable {
    var id: UUID = UUID()
    var memo: String
    var colorIndex: Int = 0
    var date: Date

    var color: Color {
        get {
            switch colorIndex {
            case 0:
                return .cyan
            case 1:
                return .purple
            case 2:
                return .blue
            case 3:
                return .yellow
            case 4:
                return .brown
            default:
                return .white
            }
        }
        
        set {
            switch newValue {
            case .cyan:
                colorIndex = 0
            case .purple:
                colorIndex = 1
            case .blue:
                colorIndex = 2
            case .yellow:
                colorIndex = 3
            case .brown:
                colorIndex = 4
            default:
                colorIndex = 5
            }
        }
    }
    
    var dateString: String {
        // 날짜 말고
        // 방금, 오늘, 어제, 이번주, 이번달, .... : 여러분의 숙제!
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd EEEE HH:mm"
        
        return dateFormatter.string(from: date)
    }
}
