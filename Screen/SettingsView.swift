import SwiftUI

struct SettingsView: View {
  // MARK: - PROPERTIES
  
  private let alternateAppIcons: [String] = [
    "AppIcon-MagnifyingGlass",
    "AppIcon-Map",
    "AppIcon-Mushroom",
    "AppIcon-Camera",
    "AppIcon-Backpack",
    "AppIcon-Campfire"
  ]
  
  var body: some View {
    List {
      // MARK: - SECTION: HEADER
      
      Section {
        HStack {
          Spacer()
          
          Image(systemName: "laurel.leading")
            .font(.system(size: 80, weight: .black))
          
          VStack(spacing: -10) {
            Text("Hike")
              .font(.system(size: 66, weight: .black))
            
            Text("Editors' Choice")
              .fontWeight(.medium)
          }
          
          Image(systemName: "laurel.trailing")
            .font(.system(size: 80, weight: .black))
          
          Spacer()
        }
        .foregroundStyle(
          LinearGradient(
            colors: [
              .customGreenLight,
              .customGreenMedium,
              .customGreenDark
            ],
            startPoint: .top,
            endPoint: .bottom
          )
        )
        .padding(.top, 8)
        
        VStack(spacing: 8) {
          Text("Where can you find \nperfect tracks?")
            .font(.title2)
            .fontWeight(.heavy)
          
          Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
            .font(.footnote)
            .italic()
          
          Text("Dust off the boots! It's time for a walk.")
            .fontWeight(.heavy)
            .foregroundColor(.customGreenMedium)
        }
        .multilineTextAlignment(.center)
        .padding(.bottom, 16)
        .frame(maxWidth: .infinity) //Helps center the vstack
      } //: HEADER
      .listRowSeparator(.hidden)
      
      // MARK: - SECTION: ICONS
      
      Section(header: Text("Alternate Icons")) {
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 12) {
            ForEach(alternateAppIcons.indices, id: \.self) { item in
              Button {
                //Update our application icon
                
                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { (error) in
                  if let error = error {
                    print("Failed to update the app's icon: \(String(describing: erro?.localizedDescription))")
                  } else {
                    print("Successfully updated the app icon")
                  }
                }
              } label: {
                Image("\(alternateAppIcons[item])-Preview")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 80, height: 80)
                  .cornerRadius(16)
              }
              .buttonStyle(.borderless)
            }
          }
        } //: SCROLL VIEW
        .padding(.top, 12)
        
        Text("Choose your favourite app icon from the collection above.")
          .frame(minWidth: 0, maxWidth: .infinity)
          .multilineTextAlignment(.center)
          .foregroundColor(.secondary)
          .font(.footnote)
          .padding(.bottom, 12)
      } //: Section - Icon
      .listRowSeparator(.hidden)
      
      // MARK: - SECTION: ABOUT
      
      Section(
        header: Text("ABOUT THE APP"),
        footer: HStack {
          Spacer()
          Text("Copyright © All right reserved.")
          Spacer()
        }
          .padding(.vertical, 8)
      ) {
        // 1. Basic labeled content provided by iOS
        // LabeledContent("Application", value: "Hike")
        
        // 2. Custom labeled content
        
        CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
        
        CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
        
        CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
        
        CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
        
        CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "John Doe", rowTintColor: .mint)
                
        CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "github", rowLinkDestination: "https://github.com/rachoi")
        
      } //: Section - About
    } //: LIST
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}