//
//  ProfileSettingsMenuView.swift
//  MoviesDB
//
//  Created by Pavel Muzalevskiy on 19.10.2023.
//

import SwiftUI

struct ProfileSettingsMenuView: View {
    let device = UIDevice.current.userInterfaceIdiom
    
    var body: some View {
        
        GeometryReader { proxy in
            if device == .phone {
                VStack {
                    Spacer()
                    
                    HStack {
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading, spacing: 20) {
                                NavigationLink {
                                    AccountView()
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    ProfileSettingsMenuLabelView(imageName: "person.circle", title: "account-option")
                                }
                                
                                NavigationLink {
                                    NotificationsView()
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    ProfileSettingsMenuLabelView(imageName: "bell.circle", title: "notifiactions-option")
                                }
                                
                                
                                NavigationLink {
                                    AppearanceView()
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    ProfileSettingsMenuLabelView(imageName: "gearshape.circle", title: "appearance-option")
                                }
                                
                                
                                NavigationLink {
                                    AboutView()
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    ProfileSettingsMenuLabelView(imageName: "info.circle", title: "about-option")
                                }
                            }
                            .foregroundStyle(.labelsMain)
                            .padding(.bottom, 40)
                            
                            Button {
                                print("DEBUG: Handle logout")
                            } label: {
                                ProfileSettingsMenuLabelView(imageName: "figure.walk.circle", title: "logout-option")
                                    .foregroundStyle(.red)
                            }
                            
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding(.leading, 30)
                    .padding(.top, 20)
                    .background(.feedCellBackground)
                    .frame(width: proxy.size.width, height: 270)
                    .clipShape(SideMenuShape(device: device))
                    .overlay {
                        SideMenuShape(device: device)
                            .stroke(lineWidth: 0.5)
                            .foregroundStyle(.labelsMain)
                    }
                }
            } else if device == .pad {
                HStack {
                    Spacer()
                    
                    HStack {
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading, spacing: 20) {
                                NavigationLink {
                                    AccountView()
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    ProfileSettingsMenuLabelView(imageName: "person.circle", title: "account-option")
                                }
                                
                                NavigationLink {
                                    NotificationsView()
                                } label: {
                                    ProfileSettingsMenuLabelView(imageName: "bell.circle", title: "notifiactions-option")
                                }
                                
                                
                                NavigationLink {
                                    AppearanceView()
                                } label: {
                                    ProfileSettingsMenuLabelView(imageName: "gearshape.circle", title: "appearance-option")
                                }
                                
                                
                                NavigationLink {
                                    AboutView()
                                } label: {
                                    ProfileSettingsMenuLabelView(imageName: "info.circle", title: "about-option")
                                }
                            }
                            .foregroundStyle(.labelsMain)
                            .padding(.bottom, 40)
                            
                            Button {
                                print("DEBUG: Handle logout")
                            } label: {
                                ProfileSettingsMenuLabelView(imageName: "figure.walk.circle", title: "logout-option")
                                    .foregroundStyle(.red)
                            }
                            
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding(.leading, 30)
                    .padding(.top, 20)
                    .background(.feedCellBackground)
                    .frame(width: 250, height: proxy.size.height)
                    .clipShape(SideMenuShape(device: device))
                    .overlay {
                        SideMenuShape(device: device)
                            .stroke(lineWidth: 0.5)
                            .foregroundStyle(.labelsMain)
                    }
                }
            }
            
        }
    }
    
    
    
}


#Preview {
    ProfileSettingsMenuView()
        .preferredColorScheme(.light)
}

#Preview {
    ProfileSettingsMenuView()
        .preferredColorScheme(.dark)
}
