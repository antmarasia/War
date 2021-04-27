//
//  ContentView.swift
//  war-challenge
//
//  Created by Anthony Marasia on 4/26/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "back"
    @State var cpuCard = "back"
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        ZStack {
            Image("background")
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button(action: {
                    
                    // Generate a random number between 2 and 14
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    // Update the cards
                    playerCard = "card\(playerRand)"
                    cpuCard = "card\(cpuRand)"
                    
                    // Update the score
                    
                    if cpuRand == playerRand {
                        playerScore += 1
                        cpuScore += 1
                        return
                    }
                    
                    if playerRand > cpuRand {
                        playerScore += 1
                    } else {
                        cpuScore += 1
                    }
                    
                    
                }, label: {
                    Image("dealbutton")
                        .renderingMode(.original)
                })
                
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                        Text("\(playerScore)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                        Text("\(cpuScore)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
