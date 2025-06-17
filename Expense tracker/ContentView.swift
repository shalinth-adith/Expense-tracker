//
//  ContentView.swift
//  Expense tracker
//
//  Created by shalinth adithyan on 16/06/25.
//
import Observation
import SwiftUI

struct ExpenseItems  {
    let name : String
    let type : String
    let amount : Double
}
@Observable
class Expenses  {
    var items = [ExpenseItems]()
}
struct ContentView: View {
    @State private var expenses = Expenses()
    var body: some View {
        NavigationStack{
            List{
                ForEach(expenses.items , id:\.name){item in
                    Text(item.name)
                }
                .onDelete(perform: DeleteButton)
            }
            .navigationTitle("Expense_Tracker")
            .toolbar{
                Button("Add Expense ", systemImage:"plus"){
                    let expense = ExpenseItems(name:"Test" , type :"Personal" , amount:5)
                    expenses.items.append(expense)
                    
                }
            }
            }
        }
    func DeleteButton(at offsets:IndexSet){
        expenses.items.remove(atOffsets: offsets)
        
    }
}


#Preview {
    ContentView()
}
