//
//  StickerView.swift
//  Test_APP
//
//  Created by 윤지호 on 2023/07/07.
//

import SwiftUI

struct StickerView: View {
    var stickerStore: StickerStore
    let sticker: Sticker
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text("\(sticker.memo)")
                    .font(.title)
                    .padding()
                
                Text("\(sticker.dateString)")
                    .font(.footnote)
                    .padding()
            }
            Spacer()
        }
        .background(sticker.color)
        .shadow(radius: 6)
        .padding()
        .contextMenu {
            ShareLink(item: sticker.memo)
            
            Button {
                stickerStore.removeSticker(sticker)
            } label: {
                Image(systemName: "trash.slash")
                Text("Remove")
            }
        }
    }
}

struct StickerView_Previews: PreviewProvider {
    static var previews: some View {
        StickerView(stickerStore: StickerStore(), sticker: Sticker(memo: "Hello", date: Date()))
    }
}
