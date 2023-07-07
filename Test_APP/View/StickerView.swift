//
//  StickerView.swift
//  Test_APP
//
//  Created by 윤지호 on 2023/07/07.
//

import SwiftUI

struct StickerView: View {
    
    let sticker: Sticker
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(sticker.memo)")
                .font(.title)
                .padding()
        }
    }
}

struct StickerView_Previews: PreviewProvider {
    static var previews: some View {
        StickerView()
    }
}
