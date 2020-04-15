//
//  ContentView.swift
//  Checklist_Rebuild
//
//  Created by Kathleen Hang on 4/7/20.
//  Copyright © 2020 Team Cowdog. All rights reserved.

// MainTodoListView.swift: This is the main app screen which is displayed to user upon app launch.

import SwiftUI

// Note: - structures are named types which allow you to encapsulate related properties/behaviors
//       - instantiated structures are able to be stored in variables
//       - initializers force all properties to be set in param list
struct MainTodoListView: View {
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        //UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 20)!]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "blocked", size: 35)!]
    }
    

    @ObservedObject var todoList = TodoList()

    // body variable will always update itself based on if any bindings are experiencing "changes"
    // this is what user sees on the main/initial app screen
    var body: some View {
        // allows for navigation to be possible within our app
        NavigationView {
            // shows items in a column-based view
            
            VStack {
                
                List {
                    // access our existing array of todo list item data.
                    // id property. pick current todo list item in array and access its name property
                    // Note: with checklist item objects consisting of UUID.... \.id is no longer required
                    ForEach(todoList.items) { index in
                        // display current item's name property in a swiftui text view component on app screen
                        CellView(todoListItem: self.$todoList.items[index])
               
                    }
                    
                }
                .navigationBarTitle(Text("Shit To Do"), displayMode: .inline)
                
                Image("poop")
                    .resizable()
                    .frame(width: 170, height: 170)

                HStack{

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
                    
                }
                
            } // end of vstack
            
            
            // display title for our checklist on main screen
        } // end of navigation view
        
        
    } // end of body
    
} // end of main view


struct CellView: View {
    
    @Binding var todoListItem: TodoListItem
    
    var body: some View {
        Button(action: {
            
            self.todoListItem.isChecked.toggle()
            
        }) {
            HStack {
                Text(todoListItem.name)
                .opacity(0.8)
                .font(.custom("Minecraft-Regular", size: 25))
                Spacer()
                todoListItem.isChecked ?
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 18, height: 18)
                        .shadow(color: Color.black, radius: 1, x: 1, y: 1)
                    : Rectangle()
                        .fill(Color.gray)
                        .frame(width: 18, height: 18)
                        .shadow(color: Color.black, radius: 1, x: -1, y: -1)
            }
            
            
            
        }
        
    }
    
}

// TodoListItem is a struct (named type capable of storing its own set of properties and behaviors)
// allows each todo list item to be represented by its own unique identifier
// having each todo list item as its own struct allows us to include properties which we can for several different tasks
// (Ex: - displaying task via String text on main todo list screen
//      - identifying each item uniquely: allows us to iterate through all items/pick out and modify a specific todo item of our choosing

struct TodoListItem: Identifiable {
    var id = UUID() // unique identifier
    var name = "" // todo list item name
    var isChecked = false // is item completed or not?
    

}


// this class can save property value changes of each todo list item
// it contains operations for data manipulation with todo list such as move, delete, save, load
// can be thought of like a customer representative. it only knows about the model: TodoListItem
class TodoList: ObservableObject {
    
    // Array of TodoListItem instance objects - stores all todo item data.
    @Published var items = [TodoListItem(name: "Roll around in bed", isChecked: true),
                 TodoListItem(name: "Watch Corpse Bride on Netflix"),
                 TodoListItem(name: "DRINK agua mucho!!!!!!!!"),
                 TodoListItem(name: "Eat mah foods (n0mn0m fish)"),
                 TodoListItem(name: "Roll around in bed some more"),
                 TodoListItem(name: "Do moar barrel rolls", isChecked: true),
                 TodoListItem(name: "Eat moar food"),
                 TodoListItem(name: "Buy MOAR derpsauce"),
                 TodoListItem(name: "Zomg. 2 much programming"),
                 TodoListItem(name: "FEED MEHHH!!"),
    ]
   
}






struct ChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        MainTodoListView()
    }
}
