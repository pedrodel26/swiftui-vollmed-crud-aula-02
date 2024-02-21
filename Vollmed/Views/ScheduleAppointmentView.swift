//
//  ScheduleAppointmentView.swift
//  Vollmed
//
//  Created by Pedro Delmondes  on 17/02/2024.
//

import SwiftUI

struct ScheduleAppointmentView: View {
    
    let service = WebService()
    var specialistID: String
    
    @State private var selectedDate = Date()
    @State private var showAlert = false
    @State private var isAppointmentScheduled = false
    
    func scheduleAppointment() async {
        do {
            if let appointment = try await service.scheduleAppoinment(specialistID: specialistID, patientID: patientID, date: selectedDate.convertToString()) {
                isAppointmentScheduled = true
            } else {
                isAppointmentScheduled = false
            }
        } catch {
            print("Ocorreu um erro ao agendar consulta: \(error)")
        }
        showAlert = true
    }
    
    var body: some View {
        
        VStack {
            Text("Selecione a data e o horário da consulta")
                .font(.title3)
                .bold()
                .foregroundStyle(.accent)
                .multilineTextAlignment(.center)
                .padding(.top)
            
            DatePicker("Escolha uma data", selection: $selectedDate, in : Date()...)
                .datePickerStyle(.graphical)
            
            Button(action: {
                Task {
                    await scheduleAppointment()
                }
            }, label: {
                ButtonView(text: "Agendar consulta")
            })
            
        }
        .padding()
        .navigationTitle("Agendar consulta")
        .navigationBarTitleDisplayMode(.large)
        .onAppear{
            UIDatePicker.appearance().minuteInterval = 15
            
        }
        .alert(isAppointmentScheduled ? "Sucesso!" : "Ops, algo deu errado!", isPresented: $showAlert, presenting: isAppointmentScheduled) { _ in
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Ok")
            })
        } message: { isScheduled in
            if isScheduled {
                Text("A consulta foi agendada com sucesso!")
            } else {
                Text("Houve um erro ao agendar sua consulta. Por favor tente novamente ou entre em contato via telefone!")
            }
        }

    }
}

#Preview {
    ScheduleAppointmentView(specialistID: "123")
}


    
