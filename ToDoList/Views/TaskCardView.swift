//
//  TitleCardView.swift
//  ToDoList
//
//  Created by Nathi Mabena on 2025/08/11.
//

import SwiftUI

struct TaskCardView: View {
    var priority:String
    var date: String
    var description:String
    @Binding var isCheck: Bool
    
    var priorityColor: Color {
            switch priority {
            case "High": return .red
            case "Medium": return Color.orange
            default: return Color.green
            }
        }

    var body : some View{
        HStack(spacing:8){
            Toggle(isOn: $isCheck ){
            }
            .labelsHidden()
            .frame(alignment: .leading)
            
            VStack(alignment:.leading, spacing:5){
                Text(description)
                    .bold()
                Text(date)
                    .font(.system(size: 13))
                    .foregroundColor(Color(.systemGray))
                    .bold()
                
            }
            .frame(width: 180, alignment: .leading) // fixed width for stability
            .padding(.leading,8)

            
            Text(priority)
                .font(.system(size: 12))
                .foregroundColor(Color(.systemRed))
                .frame(width: 60, height: 24)
                .background(Color(.systemRed).opacity(0.1))
                .cornerRadius(8)
                .padding(.leading, 8)

       }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}









struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                configuration.label
            }
        }
    }
}



struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        @State var isTaskChecked = false

        TaskCardView(priority: "High", date: "24 Jan 2025", description:"Work on methodology the end" ,isCheck: $isTaskChecked)
    }
}

