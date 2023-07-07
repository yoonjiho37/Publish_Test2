//
//  StickerEditView.swift
//  Stickers
//
//  Created by Jongwook Park on 2023/07/07.
//

import SwiftUI

struct StickerEditView: View {
    var stickerStore: StickerStore
    @State var sticker: Sticker
    
    @Binding var isShowingEditSheet: Bool
    
    @State var selectedColor: Color = .cyan
    @State var memo: String = ""
    
    let colors: [Color] = [.cyan, .purple, .blue, .yellow, .brown]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Select a color")
                    .font(.title)
                
                HStack {
                    ForEach(colors, id: \.self) { color in
                        StickerColorSelectView(selectedColor: $selectedColor, color: color)
                    }
                }
                
                Divider()
                    .padding()
                
                Text("Write a memo")
                    .font(.title)
                
                // axis라는 옵션을 정해주면 위아래로 길어지는 메모장 가능
                TextField("Memo", text: $memo, axis: .vertical)
                    .font(.title)
                
                Spacer()
            }
            .padding()
            .listStyle(.plain)
            .navigationTitle("Edit sticker")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isShowingEditSheet = false
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Submit") {
                        sticker.color = selectedColor
                        sticker.memo = memo
                        sticker.date = Date()
                        stickerStore.updateSticker(sticker)
                        
                        isShowingEditSheet = false
                    }
                }
            }
            .onAppear {
                selectedColor = sticker.color
                memo = sticker.memo
            }
        }
    }
}

struct StickerEditView_Previews: PreviewProvider {
    static var previews: some View {
        StickerEditView(stickerStore: StickerStore(), sticker: Sticker(memo: "Good", date: Date()), isShowingEditSheet: .constant(true))
    }
}
