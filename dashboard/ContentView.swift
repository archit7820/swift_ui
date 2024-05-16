
import SwiftUI
import Foundation

struct ContentView: View {
    
    // max 4 words
    func truncateTitle(_ title: String?, maxWords: Int = 4) -> String {
        guard let title = title else { return "No title" }
        let words = title.split(separator: " ")
        let truncatedWords = words.prefix(maxWords).joined(separator: " ")
        if words.count > maxWords {
            return truncatedWords + "..."
        } else {
            return truncatedWords
        }
    }
 // copy clipboard
    func copyToClipboard(_ text: String) {
        UIPasteboard.general.string = text
    }
    // for whatsapp
    func sendWhatsAppConnectRequest() {
        guard let whatsappNumber = supportWhatsappNumber else {
            print("WhatsApp number is not available")
               return
        }
    let whatsappURL = "https://wa.me/\(whatsappNumber)"
         if let url = URL(string: whatsappURL) {
               UIApplication.shared.open(url)
          } else {
               print("Invalid WhatsApp URL")
           }
    }
    
    // variables states definition
    @State private var isTextFieldVisible = false
    @State private var showRecentLinks = false
    @State private var isTopLinksSelected = true
    @State private var isRecentLinkSelected = false
    @State private var isCopied = false
    @State private var currentIndex = 0
    @State private var supportWhatsappNumber: String?
    @State private var extraIncome: Double?
    @State private var totalLinks: Int?
    @State private var totalClicks: Int?
    @State private var todayClicks: Int?
    @State private var isLoading = false
    @State private var isShowingNumber = false
    @State private var topSource: String?
    @State private var topLocation: String?
    @State private var startTime: String?
    @State private var recentLinks: [Recent_links] = []
    @State private var topLinks: [Top_links] = []
    @State private var isFavorited = false
    @State private var isExpanded: Bool = false
    @State private var data: [String: Any]? = nil
   
    
    // greeting logic
    func getGreeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour >= 5 && hour < 12 {
            return "Good morning"
        } else if hour >= 12 && hour < 17 {
            return "Good afternoon"
        } else if hour >= 17 && hour < 22  {
            return "Good evening"
        }
        else {
            return "Good night"
            
        }
    }

  // data fetching from api suing authrorization token
    func fetchData() {
          guard let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew") else {
              print("Invalid URL")
              return
          }

          var request = URLRequest(url: url)
          request.httpMethod = "GET"
          request.setValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI", forHTTPHeaderField: "Authorization")

          isLoading = true

          URLSession.shared.dataTask(with: request) { data, response, error in
              DispatchQueue.main.async {
                  self.isLoading = false
                  if let error = error {
                      print("Error: \(error.localizedDescription)")
                      return
                  }

                  guard let httpResponse = response as? HTTPURLResponse,
                        (200...299).contains(httpResponse.statusCode) else {
                      print("Invalid response")
                      return
                  }
                  // fetching
                  do {
                      let decoder = JSONDecoder()
                      if let jsonData = data {
                          let decodedData = try decoder.decode(Json4Swift_Base.self, from: jsonData)
                             
                          // Check if jsonData.data is not nil before unwrapping it
                          if let jsonData = decodedData.data {
                              recentLinks = jsonData.recent_links ?? []
                              topLinks = jsonData.top_links ?? []
                              supportWhatsappNumber = decodedData.support_whatsapp_number
                                                    extraIncome = decodedData.extra_income
                                                    totalLinks = decodedData.total_links
                                                    totalClicks = decodedData.total_clicks
                                                    todayClicks = decodedData.today_clicks
                                                    topSource = decodedData.top_source
                                                    topLocation = decodedData.top_location
                                                    startTime = decodedData.startTime
                             
                          } else {
                              print("JSON data is nil")
                          }
                      } else {
                          print("Data is nil")
                      }
                  } catch {
                      print("Error parsing JSON: \(error.localizedDescription)")
                  }
                  // fetching all data

              }
          }.resume()
      }

      var body: some View {
          NavigationView {
              ScrollView {

                  VStack(spacing: 0) {
                      // Header
                      Color.blue
                          .frame(height: 120)
                          .overlay(
                              HStack {
                                  Text("Dashboard")
                                      .font(.title)
                                      .fontWeight(.bold)
                                      .foregroundColor(.white)
                                  Spacer()

                                  Image("Image 1")
                                      .resizable()
                                      .aspectRatio(contentMode: .fit)
                                      .frame(width: 80, height: 60)
                                      .foregroundColor(.white)
                                      .padding(5)
                              }
                              .padding(.top, 30)
                              .padding(.horizontal)
                          )

                      VStack(alignment: .leading) {
                          Text(getGreeting()) // Call getGreeting function here
                              .font(.system(size: 20))
                              .foregroundColor(Color(hex: 0x999CA0))
                              .fontWeight(.bold)
                              .padding(.horizontal)
                          HStack {
                              Text("Archit Yadav")
                                  .font(.title)
                                  .fontWeight(.bold)
                              Image("Image")
                          }
                          .padding(.horizontal)

                          VStack {
                              Image("Image 2")
                                  .resizable()
                                  .scaledToFit()
                                  .padding(.top, 20)
                                  .padding(.bottom, 20)

                          }

                          // Tiles
                          ScrollView(.horizontal, showsIndicators: false) {
                              LazyHStack(spacing: 10) {
                                  TileView(image: "Image 3", headline: "\(totalClicks ?? 0)", subheadline: "Total clicks")
                                  TileView(image: "Image 4", headline: "\(topLocation ?? "N/A")", subheadline: "Top location")
                                  TileView(image: "Image 5", headline: "\(topSource ?? "N/A")", subheadline: "Top source")
                              
                                  TileView(image: "Image 16", headline: "\(startTime ?? "N/A")", subheadline: "Start Time")
                               

                                  
                                  TileView(image: "Image 4", headline: "\(extraIncome ?? 0)", subheadline: "Extra Income")
                                  TileView(image: "Image 3", headline: "\(totalLinks ?? 0)", subheadline: "Total Links")
                                  TileView(image: "Image 3", headline: "\(todayClicks ?? 0)", subheadline: "Todays Clicks")
                              }
                              .padding()
                          }

                          .padding(.horizontal)
                          .padding(.bottom, 20)
                          
                          // Analytics Button
                          VStack {
                                      Spacer()
                                      HStack {
                                          Image("Image 6")
                                          Text("View Analytics")
                                      }
                                      .padding()
                                      .background(Color.white)
                                      .cornerRadius(10)
                                      .frame(width: 340, height: 60)
                                      .overlay(
                                          RoundedRectangle(cornerRadius: 10)
                                              .stroke((Color(hex: 0x999CA0)), lineWidth: 1)
                                      )
                                      .alignmentGuide(.leading) { dimension in
                                          dimension[.leading] + 30 // Add margin of 30 points to the left side
                                      }
                                  }
                                  .frame(maxWidth: .infinity) // Ensure VStack takes the full width
                              
                          
                              
                          // Data fetching and displaying recent/top links
                         
                          // Button row
                          HStack {
                              // Top Links button
                              Button(action: {
                                  isTopLinksSelected.toggle() // Toggle selection
                                  isRecentLinkSelected = false// Deselect Recent Link
                              }) {
                                  Text("Top Links")
                                      .foregroundColor(isTopLinksSelected ? Color.white : Color.gray)
                                      .padding()
                                      .frame(width: 100)
                                      .font(.system(size: 15))
                                      .background(isTopLinksSelected ? Color.blue : Color.white)
                                      .cornerRadius(80)
                              }
                              .padding(.horizontal)
                              
                              // Recent Link button
                              Button(action: {
                                  isRecentLinkSelected.toggle() // Toggle selection
                                  isTopLinksSelected = false // Deselect Top Links
                              }) {
                                  Text("Recent Link")
                                      .foregroundColor(isRecentLinkSelected ? Color.white : Color.gray)
                                      .padding()
                                      .font(.system(size: 15))
                                      .frame(width: 115)
                                      .background(isRecentLinkSelected ? Color.blue : Color.white)
                                      .cornerRadius(80)
                              }
                              .padding(.horizontal)
                              
                              // Right box with search icon
                              VStack {
                                  Image("Image 15")
                                      .resizable()
                                      .aspectRatio(contentMode: .fit)
                                      .frame(width: 30, height: 20)
                                      .padding()
                                      .onTapGesture {
                                          // Toggle the visibility of the text field when the image is tapped
                                          isTextFieldVisible.toggle()
                                      }
                                  
                                 
                              }
                              
                              .background(Color.white)
                              .cornerRadius(15)
                              .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke((Color(hex: 0x999CA0)), lineWidth: 1)
                              )
                              .padding()
                          }
                          

                      }
                      .padding(.top)
                      .padding(.top, 40)
                      if isTextFieldVisible {
                          TextField("Enter Link title", text: .constant(""))
                              .textFieldStyle(RoundedBorderTextFieldStyle())
                              .padding()
                      }
                      VStack {
                          if isLoading {
                              ProgressView()
                          } else {
                              // Display recent links if isRecentLinkSelected is true
                              if isRecentLinkSelected {
                                  ForEach(recentLinks, id: \.url_id){ link in
                                      // Display all properties for each link in a box
                                      VStack(alignment: .leading, spacing: 8) {
                                          
                                          HStack {
                                              if let imageURLString = link.original_image,
                                                    let imageURL = URL(string: imageURLString) {
                                                         AsyncImage(url: imageURL) { image in
                                                             image
                                                                 .resizable()
                                                                 .aspectRatio(contentMode: .fit)
                                                                 .cornerRadius(15) //
                                                                 .frame(width: 70, height: 80) // Adjust size as needed
                                                         } placeholder: {
                                                             // Placeholder while image is loading
                                                             ProgressView()
                                                         }
                                              } else {
                                                  Text("No original image")
                                                      .foregroundColor(.gray)
                                              }
                                              Spacer()
                                              Text(truncateTitle(link.title))
                                              Spacer()
                                              VStack(alignment: .trailing) { // Align items at the end
                                                  Text("\(link.total_clicks ?? 0)")
                                                  Text("Clicks")
                                                  
                                              }
                                          }
                                          // link copy
                                      
                                          HStack {
                                              Text("\(link.web_link ?? "No web link")")
                                                      Spacer()
                                                      Button(action: {
                                                          copyToClipboard(link.web_link ?? "")
                                                          isCopied = true // Set isCopied to true upon clicking the button
                                                      }) {
                                                          if isCopied {
                                                              Image(systemName: "checkmark")
                                                                  .foregroundColor(.green)
                                                          } else {
                                                              Image(systemName: "doc.on.doc")
                                                          }
                                                      }
                                                      .buttonStyle(PlainButtonStyle())
                                            
                                              // Heart icon
                                              Button(action: {
                                                         isFavorited.toggle()
                                                     }) {
                                                         Image(systemName: isFavorited ? "heart.fill" : "heart")
                                                             .foregroundColor(isFavorited ? .red : .gray)
                                                     }
                                                     .buttonStyle(PlainButtonStyle())
                                                 }
                                         
                                              
                                              
                                          
                                      }
                                      .padding()
                                      .background(Color.gray.opacity(0.1))
                                      .cornerRadius(10)
                                      .padding([.leading, .trailing], 12)
                                  }
                              }

                              // Display top links if isTopLinksSelected is true
                              if isTopLinksSelected {
                                  ForEach(topLinks, id: \.url_id) { link in
                                      // Display all properties for each link in a box
                                      VStack(alignment: .leading, spacing: 8) {
                                          
                                          HStack {
                                              if let imageURLString = link.original_image,
                                                    let imageURL = URL(string: imageURLString) {
                                                         AsyncImage(url: imageURL) { image in
                                                             image
                                                                 .resizable()
                                                                 .aspectRatio(contentMode: .fit)
                                                                 .cornerRadius(15) //
                                                                 .frame(width: 70, height: 80) // Adjust size as needed
                                                         } placeholder: {
                                                             // Placeholder while image is loading
                                                             ProgressView()
                                                         }
                                              } else {
                                                  Text("No original image")
                                                      .foregroundColor(.gray)
                                              }
                                              Spacer()
                                              Text(truncateTitle(link.title))
                                              Spacer()
                                              VStack(alignment: .trailing) { // Align items at the end
                                                  Text("\(link.total_clicks ?? 0)")
                                                  Text("Clicks")
                                                  
                                              }
                                          }
                                          // link copy
                                      
                                          HStack {
                                              Text("\(link.web_link ?? "No web link")")
                                                      Spacer()
                                                      Button(action: {
                                                          copyToClipboard(link.web_link ?? "")
                                                          isCopied = true // Set isCopied to true upon clicking the button
                                                      }) {
                                                          if isCopied {
                                                              Image(systemName: "checkmark")
                                                                  .foregroundColor(.green)
                                                          } else {
                                                              Image(systemName: "doc.on.doc")
                                                          }
                                                      }
                                                      .buttonStyle(PlainButtonStyle())
                                            
                                              // Heart icon
                                              Button(action: {
                                                         isFavorited.toggle()
                                                     }) {
                                                         Image(systemName: isFavorited ? "heart.fill" : "heart")
                                                             .foregroundColor(isFavorited ? .red : .gray)
                                                     }
                                                     .buttonStyle(PlainButtonStyle())
                                                 }
                                         
                                              
                                              
                                          
                                      }
                                      .padding()
                                      .background(Color.gray.opacity(0.1))
                                      .cornerRadius(10)
                                      .padding([.leading, .trailing], 12)
                                  }
                              }
                          }
                      }
                      .onAppear {
                          // Call fetchData() when the view appears
                          fetchData()
                      }
                      .padding()
                      // view all links section
                      VStack {
                          Spacer()
                          HStack {
                              Image("Image 9")
                              Text("View all Links")
                          }
                          .padding()
                          .background(Color.white)
                          .cornerRadius(10)
                          .frame(width: 360, height: 60)
                          .overlay(
                              RoundedRectangle(cornerRadius: 10)
                                  .stroke((Color(hex: 0x999CA0)), lineWidth: 1)
                          )
                      }
                      .padding(.bottom, 30)
                      // talk with us section
                      VStack {
                                  if isLoading {
                                      ProgressView()
                                          .progressViewStyle(CircularProgressViewStyle())
                                          .padding()
                                  } else {
                                      VStack {
                                          Spacer()
                                          HStack {
                                              Image("Image 10")
                                              if isShowingNumber {
                                                  Text("whatsapp No : ")
                                                  Text(supportWhatsappNumber ?? "N/A")
                                              } else {
                                                  Text("Talk with us")
                                              }
                                          }
                                          .padding()
                                          .background(Color.white)
                                          .cornerRadius(10)
                                          .frame(width: 360, height: 60)
                                          .overlay(
                                              RoundedRectangle(cornerRadius: 10)
                                                  .stroke((Color(hex: 0x4AD15F)), lineWidth: 1)
                                          )
                                          Spacer()
                                      }
                                      .onTapGesture {
                                                       // Toggle isShowingNumber when VStack is tapped
                                                       isShowingNumber.toggle()
                                                   }
                                  }
                              
                             
                          }
                      
                      // faq's section
                      VStack {
                          Spacer()
                          HStack {
                              Image("Image 11")
                              Text("Frequently Asked Questions")
                          }
                          .padding()
                          .background(Color.white)
                          .cornerRadius(10)
                          .frame(width: 360, height: 60)
                          .overlay(
                              RoundedRectangle(cornerRadius: 10)
                                  .stroke((Color(hex: 0x0E6FFF)), lineWidth: 1)
                             )
                           }

                           Spacer()
                          .padding(.bottom, 40)

                      
                   
                      // bottom bar of dashboard
                      VStack {
                          
                          HStack {
                              Spacer()
                              // First item
                              VStack {
                                  Image("Image 9")
                                  Text("Link")
                                      .font(.system(size: 10))
                              }
                              
                              Spacer()
                              
                              // Second item
                              VStack {
                                  Image("Image 12")
                                  Text("Courses")
                                      .font(.system(size: 10))
                              }
                              
                              Spacer()
                              Spacer()
                              
                              // Third item
                              VStack {
                                  Image("Image 19")
                                  Text("Placeholder")
                                      .font(.system(size: 10))
                                      .opacity(0) // Hide the placeholder text
                              }
                              .frame(width: 60, height: 60) // Set the frame size for the centered image
                              
                              Spacer()
                              
                              // Fourth item
                              VStack {
                                  Image("Image 13")
                                  Text("Campaigns")
                                      .font(.system(size: 10))
                              }
                              
                              Spacer()
                              
                              // Fifth item
                              VStack {
                                  Image("Image 14")
                                  Text("Profile")
                                      .font(.system(size: 10))
                              }
                              
                              Spacer()
                          }
                          .padding()
                          .foregroundColor(.black)
                      }
                      .padding(.horizontal)
                      .background(Color.white)


                      // end bottom bar

                  }
              }

              .navigationBarTitleDisplayMode(.inline)
              .navigationBarHidden(true)
              .edgesIgnoringSafeArea(.all)
          }
      }
  }

 // structure for slider
  struct TileView: View {
      let image: String
      let headline: String
      let subheadline: String

      var body: some View {
          VStack (alignment: .leading){
              Image(image)
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 80, height: 50)
                  .clipShape(RoundedRectangle(cornerRadius: 10))
                  .padding(.bottom, 5)

              Text(headline)
                  .font(.headline)
                  .foregroundColor(.black)

              Text(subheadline)
                  .font(.subheadline)
                  .foregroundColor(.gray)
          }
          .padding()
          .background(Color.white)
          .cornerRadius(10)
          .shadow(radius: 5)
      }
  }


 // color extenstion

  extension Color {
      init(hex: UInt32) {
          let red = Double((hex & 0xFF0000) >> 16) / 255.0
          let green = Double((hex & 0x00FF00) >> 8) / 255.0
          let blue = Double(hex & 0x0000FF) / 255.0

          self.init(red: red, green: green, blue: blue)
      }
  }


//
  struct ContentView_Previews: PreviewProvider {

      static var previews: some View {
          ContentView()
      }
  }
