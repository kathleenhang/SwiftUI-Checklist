// Name: Kathleen Hang
// Start Date: 4/7/20.
// Project Name: Checklist_Rebuild
// File Name: TodoList.swift
// Description: ViewModel. Watches for changes on item array property

import SwiftUI

class TodoList: ObservableObject {
    
    // Array of TodoListItems
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
    
    // print path for document directory & .plist file
    init() {
        print("Documents directory: \(documentsDirectory())")
        print("Data file: \(dataFilePath())")
        loadListItem()
    }
    
    func deleteTodoItem(whichElement: IndexSet) {
        items.remove(atOffsets: whichElement)
        saveListItems()
    }
    
    func moveTodoItem(whichElement: IndexSet, destination: Int) {
        items.move(fromOffsets: whichElement, toOffset: destination)
        saveListItems()
    }
    
    // get document directory path
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // get .plist file path
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("TodoList.plist")
    }
    
    func saveListItems() {
        // create encoder object
        let encoder = PropertyListEncoder()
        
        do {
            // use encoder object to encode todo list items
            let data = try encoder.encode(items)
            
            // save items to .plist file location
            try data.write(to: dataFilePath(),
                           options: Data.WritingOptions.atomic)
        } catch { // if encoding or saving fails, print error
            print("Error encoding item array: \(error.localizedDescription)")
        }
    }
    
    func loadListItem() {
        // store path of .plist file
        let path = dataFilePath()
        // if .plist exists, create a decoder object
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                // try to load data from .plist file into items array
                items = try decoder.decode([TodoListItem].self, from: data)
            } catch { // if data loading fails, print error to console
                print("Error decoding item array: \(error.localizedDescription)")
            }
        }
    }
    
    
    
    
    
    
}
