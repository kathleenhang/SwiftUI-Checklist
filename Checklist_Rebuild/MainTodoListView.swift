
// Name: Kathleen Hang
// Start Date: 4/7/20.
// Project Name: Checklist_Rebuild
// File Name: MainTodoListView.swift
// Description: This is the main app screen which is displayed to user upon app launch.

import SwiftUI

struct MainTodoListView: View {
    
    @ObservedObject var todoList = TodoList()
    
    // SceneDelegate will create an object of MainTodoListView which will be used to create a screen on this view on first app view
    init() {
        // set the styling property of the UI Navigation Bar's title text to my preference
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "blocked", size: 35)!]
    }
    
    // this is the visual display user will see (initial app screen)
    var body: some View {
        // allows for navigation to be possible within our app
        NavigationView {
            
            // display different view types in a column-type fashion
            VStack {
                // ********* LIST OF TODO ITEMS ****************
                List {
                    
                    // access our existing array of todo list items
                    ForEach(todoList.items) { index in
                        // display the cell view for each todo list item
                        ItemCellView(todoListItem: self.$todoList.items[index])
                    }
                }
                // ********* MAIN SCREEN TITLE TEXT ****************
                .navigationBarTitle(Text("Shit To Do"), displayMode: .inline)
                
                // ********* IMAGE OF POOP ****************
                Image("poop")
                    .resizable()
                    .frame(width: 170, height: 170)
                
                // ********* ADD NEW ITEM BUTTON ****************
                Button(action:{}) {
                    ZStack{
                        Rectangle()
                            .fill(Color.orange)
                            .cornerRadius(3)
                            .frame(width: 360, height: 40)
                            .padding()
                            .shadow(color: Color.black, radius: 2, x: 1, y: 1)
                        Text("+").font(.custom("blocked", size: 40)).foregroundColor(Color.white)
                    }
                }
            } // end of vstack
        } // end of NavigationView   
    } // end of body
} // end of main view

struct ChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        MainTodoListView()
    }
}
