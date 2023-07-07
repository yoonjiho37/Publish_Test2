//
//  StickerListView.swift
//  Test_APP
//
//  Created by 윤지호 on 2023/07/07.
//

import SwiftUI

struct StickerListView: View {
    
    /*
     StateObject와 ObservedObject 모두 Observable 프로토콜을 따르는
     클래스를 관찰해서 body를 변경한다
     
     StateObject와 ObservedObject는 슈퍼뷰와 서브뷰 사이에서
     늘 새롭게 만들어지느냐, 아니면 그 상태를 유지하냐에서 동작방식 차이가 있다
     (자세한 건 나중에...)
     */
    @StateObject var stickerStore: StickerStore = StickerStore()
    @State var sticker: Sticker = Sticker(memo: "temp", date: Date())
    
    // 바인딩으로 넘기는 Bool, Int 같은 기본값에는
    // State 프로퍼티 래퍼를 꼭 달아줘야 한다
    @State var isShowingAddSheet: Bool = false
    @State var isSwhoingEditSheet: Bool = false

    
    var body: some View {
        VStack {
            List(stickerStore.stickers) { sticker in
                Button {
                    self.sticker = sticker
                    isSwhoingEditSheet = true
                } label: {
                    StickerView(stickerStore: stickerStore, sticker: sticker)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Stickers")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isShowingAddSheet = true
                } label: {
                    Label("Add", systemImage: "pencil.tip.crop.circle.badge.plus")
                }
            }
        }
        .sheet(isPresented: $isShowingAddSheet) {
            // sheet에 isPresented 매개변수로 보내주는
            // 바인딩된 isShowingSheet은
            // (손으로 끌어내려서) sheet가 내려가면
            // 내부에서 알아서 그 값을 false로 바꾼다
            
            // StickerAddView 안에서도 isShowingSheet 값을 바꾸어
            // sheet를 내릴 수 있도로 하기 위해
            // 바인딩을 사용했다
            StickerAddView(stickerStore: stickerStore, isShowingAddSheet: $isShowingAddSheet)
        }
        .sheet(isPresented: $isSwhoingEditSheet, content: {
            StickerEditView(stickerStore: stickerStore, sticker: sticker, isShowingEditSheet: $isSwhoingEditSheet)
        })
        .refreshable {
            stickerStore.fetchStickers()
        }
        .onAppear {
            stickerStore.fetchStickers()
        }
    }
}

struct StickerListView_Previews: PreviewProvider {
    static var previews: some View {
        
        // 네비게이션 제목이 프리뷰에서 보이게 하는 편법
        NavigationStack {
            StickerListView()
        }
    }
}
