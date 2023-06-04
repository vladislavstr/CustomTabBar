//
//  AppView.swift
//  TabBar
//
//  Created by Владислав Стрельников on 04.06.2023.
//

import SwiftUI

struct AppView: View {
    @State var selectTab = "1"
    
    let tabs = ["Home","Search","Message","Settings"]
//    var tabs = ["Main": "house",
//                "Search":"magnifyingglass",
//                "Message": "message",
//                "Settings":"gearshape"]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            TabView(selection: $selectTab){
                HomeView()
                    .tag("Home")
                Text("Search")
                    .tag("Search")
                Text("Message")
                    .tag("Message")
                Text("Settings")
                    .tag("Settings")
            }
            HStack{
                ForEach(tabs, id: \.self){
                    tab in TabBarItem(tab: tab)
                }
            }
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .background(.green)
        }
    }
}

struct TabBarItem: View{
    @State var tab: String
    var body: some View{
        ZStack{
            Button{
//                selectTab = "1"
            } label: {
                HStack{
//                    Image(systemName: tab)
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
