//
//  StickerAddView.swift
//  Test_APP
//
//  Created by 윤지호 on 2023/07/07.
//

import SwiftUI

struct StickerAddView: View {
    var stickerStore: StickerStore
    @Binding var isShowingAddSheet: Bool
    
    @State var selectedColor: Color = .cyan
    @State var memo: String = ""
    
    let colors: [Color] = [.cyan, .purple, .blue, .yellow, .brown]
    
    var body: some View {
        // sheet로 올라온 View에는 보통
        // 독립적인 NavagationStack을 두는 경우가 흔하다
        // 그래야 타이틀도 보이고, 툴바버튼들도 보인다
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
            .navigationTitle("Add a sticker")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isShowingAddSheet = false
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Submit") {
                        stickerStore.addSticker(memo: memo, color: selectedColor)
                        isShowingAddSheet = false
                    }
                }
            }
        }
    }
}
    struct StickerAddView_Previews: PreviewProvider {
        static var previews: some View {
            // 프리뷰에서 바인딩된 내용을 강제로 만들어 전달하려면
            // .constant를 사용해야 한다
            StickerAddView(stickerStore: StickerStore(), isShowingAddSheet: .constant(true))
        }
    }

