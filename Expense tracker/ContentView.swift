//
//  ContentView.swift
//  Expense tracker
//
//  Created by shalinth adithyan on 16/06/25.
//
import Observation
import SwiftUI

import Foundation

struct ExpenseItem: Identifiable,Codable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Double
}

@Observable
class Expenses {
    var items: [ExpenseItem] = []{
        didSet{
            if let encoder = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoder, forKey: "items")
            }
        }
    }
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "items"){
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                self.items = decodedItems
                return
            }
        }
        items = []
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddView = false
    var totalAmount: Double {
        expenses.items.reduce(0) { $0 + $1.amount }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack{
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: "INR"))
                            .fontWeight(.bold)
                    }
                }
                .onDelete(perform: deleteItem)
                
            }
            .navigationTitle("MoneyMap")
            .toolbar {
                Button {
                    showingAddView = true
                } label: {
                    Label("Add Expense", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddView(expenses: expenses)
            }
            .safeAreaInset(edge: .bottom) {
                    VStack {
                        Divider()
                        HStack {
                            Text("Total:")
                                .font(.headline)
                            Spacer()
                            Text(totalAmount, format: .currency(code: "INR"))
                                .font(.title3.bold())
                                .foregroundStyle(.green)
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                    }
                }
            
        }
    }

    func deleteItem(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
