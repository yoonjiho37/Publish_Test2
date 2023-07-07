//
//  StickerColorSelectView.swift
//  Test_APP
//
//  Created by 윤지호 on 2023/07/07.
//

import SwiftUI

struct StickerColorSelectView: View {
    @Binding var selectedColor: Color
    let color: Color
    
    var body: some View {
        Button {
            // Buttond의 Action이 좀 길어질듯하면
            // 따로 method만들어 호출하는 편이 좋다
            selectColor()
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(color)
                    .shadow(radius: 6)
                    .frame(height: 60)
                
                if selectedColor == color {
                    Image(systemName: "checkmark")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
        }
    }
    
    func selectColor() {
        selectedColor = color
        
        // List 안에 만들었더니 전체가 다 선택되더라
        // 그거 확인하려고 print 만들어봄
        print("\(color) / \(selectedColor)")
    }
}

struct StickerColorSelectView_Previews: PreviewProvider {
    static var previews: some View {
        StickerColorSelectView(selectedColor: .constant(.blue), color: .cyan)
    }
}
