//
//  ContentView.swift
//  Expense tracker
//
//  Created by shalinth adithyan on 16/06/25.
//
import Observation
import SwiftUI

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    var name: String
    var type: String
    var amount: Double
}

@Observable
class Expenses {
    var items: [ExpenseItem] = []
}
import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddView = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                            .foregroundStyle(.secondary)
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
        }
    }

    func deleteItem(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
