//
//  ContentView.swift
//  Test_APP
//
//  Created by 윤지호 on 2023/07/07.
//

import SwiftUI


// ContentView에 다 담지 말고
// 최소의 기능만 담아보자
// 여기엔 NavigationStack만 생각해주는 걸로..
// 탭 같은 기능이 생기면 ContentView는 그것만으로 복잡해질 수 있어서...

struct ContentView: View {
    @State var tabIndex: Int = 0
    
    var body: some View {
        TabView(selection: $tabIndex) {
            NavigationStack {
                StickerListView()
            }
            .tabItem {
                Image(systemName: "note")
                Text("Stickers1")
            }
            .tag(1)
            
            Text("멋쟁이사자처럼 앱스쿨 스티커앱")
            .tabItem {
                Image(systemName: "person")
                Text("About")
            }
            .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
