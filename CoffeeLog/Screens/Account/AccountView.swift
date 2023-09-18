//
//  AccountView.swift
//  CoffeeLog
//
//  Created by Tim West on 9/11/23.
//

import SwiftUI

struct AccountView: View {
    
    let backColor: Color = Color(uiColor: .systemGroupedBackground)
    let secondaryColor: Color = Color(uiColor: .secondarySystemGroupedBackground)
    let textColor: Color = Color(.secondaryLabel)
    
    @State private var units: Bool = false
    @State private var notifications: Bool = false
    
    @EnvironmentObject var settings: Settings
    @Environment(\.openURL) var openURL
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        accountInfoHeader()
                            .padding(.bottom, 15)
                            .listRowInsets(EdgeInsets())
                    }
                    .clipped()
                    .listRowBackground(
                        GeometryReader { geometry in
                            VStack {
                                Rectangle().fill(backColor)
                                    .edgesIgnoringSafeArea(.top)
                                    .frame(height: geometry.size.height * 0.25)
                                Rectangle().fill(secondaryColor)
                            }
                        })
                    
                    // MARK: Coffee Metrics
                    Section {
                        Text("Total Coffee Logged: ")
                            .badge(10)
                        Text("Favorite Coffee: ")
                        Text("Your Coffee Hour: ")
                    } header: {
                        Text("Coffee Metrics")
                    }
                    
                    // MARK: Settings
                    Section {
                        Toggle("Light/Dark Mode", isOn: settings.$isDarkMode)
                        Toggle("Notifications", isOn: $notifications)
                        Toggle("Units", isOn: $units)
                    } header: {
                        Text("Settings")
                    }
                    
                    // MARK: Footer: Log out, delete, T&C, Privacy Policy links
                    Section {
                        NavigationLink {
                            // Navigate to a safari view here
                        } label: {
                            Text("Terms and Conditions")
                        }
                        
                        NavigationLink {
                            // Navigate to a safari view here
                        } label: {
                            Text("Privacy Policy")
                        }
                        
                        NavigationLink {
                            // Navigate to a screen to send an email
                        } label: {
                            Text("Contact Us")
                        }
                        
                    } header: {
                        Text("Help & policies")
                    } footer: {
                        VStack(alignment: .leading) {
                            Text("App version: 0.1.0")
                            Text(Date().formatted(date: .abbreviated,
                                                  time: .shortened))
                        }
                    }
                    
                    VStack(alignment: .center) {
                        Button {
                            print("Log out Clicked")
                        } label: {
                            Label("Log out",
                                  systemImage: "rectangle.portrait.and.arrow.right.fill")
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                                .foregroundColor(.blue)
                        }
                        .buttonStyle(.bordered)
                        .tint(.blue)
                        .padding(.bottom, 20)
                        
                        Button {
                            print("Log out Clicked")
                        } label: {
                            Label("Delete Account",
                                  systemImage: "xmark.circle.fill")
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .foregroundColor(.red)
                        }
                        .buttonStyle(.bordered)
                        .tint(.red)
                    }
                    .background(RoundedRectangle(cornerRadius: 10).fill(backColor))
                    .listRowInsets(EdgeInsets())
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    
    @ViewBuilder
    private func accountInfoHeader() -> some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 105, alignment: .top)
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Timothy West")
                            .font(.title2)
                            .fontWeight(.medium)
                        Text("timr200019@yahoo.com")
                            .font(.caption)
                            .fontWeight(.regular)
                            .tint(.primary)
                        Text("Date Joined: 9/12/23")
                            .font(.caption)
                            .fontWeight(.regular)
                    }
                    // Leaves option to add badges or something in a line across the bottom
                }
            }
            Spacer()
        }
        .foregroundColor(Color(uiColor: .systemGray))
        .padding(.top, 10)
        .padding(.horizontal, 20)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environmentObject(Settings())
    }
}
