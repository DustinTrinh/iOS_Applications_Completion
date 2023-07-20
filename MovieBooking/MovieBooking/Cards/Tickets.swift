//
//  Tickets.swift
//  MovieBooking
//
//  Created by DustyTheCutie on 2023-07-19.
//

import SwiftUI

struct Tickets: View {
    
    @State var tickets: [TicketModel] = [
        TicketModel(image: "thor", title: "Thor", subtitle: "Love and Thunder", top: "thor-top", bottom: "thor-bottom"),
        TicketModel(image: "panther", title: "Black Panther", subtitle: "Wakanda Forever", top: "panther-top", bottom: "panther-bottom"),
        TicketModel(image: "scarlet", title: "Doctor Strange", subtitle: "in the Multiverse of Madness", top: "scarlet-top", bottom: "scarlet-bottom")
    ]
    
    var body: some View {
        ZStack {
            ForEach(tickets) { ticket in
                InfiniteStackView(tickets: $tickets, ticket: ticket)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        
    }
}

struct Tickets_Previews: PreviewProvider {
    static var previews: some View {
        Tickets()
    }
}

struct InfiniteStackView: View {
    
    @Binding var tickets: [TicketModel]
    var ticket: TicketModel
    @State var height: CGFloat = 0
    
    @GestureState var isDragging: Bool = false
    @State var offset: CGFloat = .zero
    
    var body: some View{
        VStack{
            Ticket(title: ticket.title, subtitle: ticket.subtitle, topImg: ticket.top, botImg: ticket.bottom, height: $height)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .zIndex(Double(CGFloat(tickets.count)-getIndex()))
        .rotationEffect(.init(degrees: getRotation(angle: 40)))
        .rotationEffect(getIndex() == 1 ? .degrees(-6) : .degrees(0))
        .rotationEffect(getIndex() == 2 ? .degrees(6) : .degrees(0))
        .scaleEffect(getIndex() == 0 ? 1 : 0.9)
        .offset(x: offset)
        .offset(x: getIndex() == 1 ? -40 : 0)
        .offset(x: getIndex() == 2 ? 40 : 0)
        .gesture(
            DragGesture()
                .updating($isDragging, body: { _, out, _ in
                    out = true
                })
                .onChanged({ value in
                    var translation = value.translation.width
                    translation = tickets.first?.id == ticket.id ? translation : 0
                    translation = isDragging ? translation : 0
                    
                    withAnimation(.easeInOut(duration: 0.3)){
                        offset = translation
                    }
                })
                .onEnded({ value in
                    let scenes = UIApplication.shared.connectedScenes
                    let windowScene = scenes.first as? UIWindowScene
                    let window = windowScene?.windows.first

                    let width = window?.screen.bounds.width ?? 0
                    let swipeRight = offset > (width/2)
                    let swipeLeft = -offset > (width/2)
                    
                    withAnimation(.easeInOut(duration: 0.5)){
                        if swipeRight{
                            offset = width
                            removeAndAdd()
                        }
                        else if swipeLeft{
                            offset = -width
                            removeTicket()
                        }
                        else{
                            offset = .zero
                        }
                    }
                })
        )
    }
    
    func getIndex() -> CGFloat {
        let index = tickets.firstIndex{ ticket in
            return self.ticket.id == ticket.id
        } ?? 0
        
        return CGFloat(index)
    }
    
    func getRotation(angle: Double) -> Double {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first

        let width = window?.screen.bounds.width ?? 0
        
        let progress = offset / width
        print(progress)
        
        return Double(progress*angle)
    }
    
    func removeAndAdd(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            var updateTicket = ticket
            updateTicket.id = UUID().uuidString
            
            tickets.append(updateTicket)
            
            withAnimation(.spring()){
                tickets.removeFirst()
            }
        }
    }
    
    func removeTicket(){
        withAnimation(.spring()) {
            tickets.removeFirst()
        }
    }
}

