//
//  AppView.swift
//  TabBar
//
//  Created by Владислав Стрельников on 04.06.2023.
//

import SwiftUI

struct AppView: View {
    @State var selectTab = "Main"
    
    let tabs = ["Main": "house",
                "Search":"magnifyingglass",
                "Message": "message",
                "Settings":"gearshape"]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            TabView(selection: $selectTab){
                HomeView()
                    .tag("Main")
                Text("Search")
                    .tag("Search")
                Text("Message")
                    .tag("Message")
                Text("Settings")
                    .tag("Settings")
            }
            HStack{
                ForEach(tabs.sorted(by: <), id: \.key) { key, value in
                    TabBarItem(tab: key, image: tabs[key] ?? "", selectTab: $selectTab)
                }
            }
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .background(Color.green)
        }
    }
}

struct TabBarItem: View {
    @State var tab: String
    var image: String
    @Binding var selectTab: String
    
    var body: some View {
        ZStack {
            Button(action: {
                selectTab = tab
            }) {
                HStack {
                    Image(systemName: image)
                    Text(tab)
                }
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
