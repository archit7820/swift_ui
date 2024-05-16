


/*
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/
// jason4swift
/*
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Json4Swift_Base : Codable {
    let status : Bool?
    let statusCode : Int?
    let message : String?
    let support_whatsapp_number : String?
    let extra_income : Double?
    let total_links : Int?
    let total_clicks : Int?
    let today_clicks : Int?
    let top_source : String?
    let top_location : String?
    let startTime : String?
    let links_created_today : Int?
    let applied_campaign : Int?
    let data : Data?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case statusCode = "statusCode"
        case message = "message"
        case support_whatsapp_number = "support_whatsapp_number"
        case extra_income = "extra_income"
        case total_links = "total_links"
        case total_clicks = "total_clicks"
        case today_clicks = "today_clicks"
        case top_source = "top_source"
        case top_location = "top_location"
        case startTime = "startTime"
        case links_created_today = "links_created_today"
        case applied_campaign = "applied_campaign"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        support_whatsapp_number = try values.decodeIfPresent(String.self, forKey: .support_whatsapp_number)
        extra_income = try values.decodeIfPresent(Double.self, forKey: .extra_income)
        total_links = try values.decodeIfPresent(Int.self, forKey: .total_links)
        total_clicks = try values.decodeIfPresent(Int.self, forKey: .total_clicks)
        today_clicks = try values.decodeIfPresent(Int.self, forKey: .today_clicks)
        top_source = try values.decodeIfPresent(String.self, forKey: .top_source)
        top_location = try values.decodeIfPresent(String.self, forKey: .top_location)
        startTime = try values.decodeIfPresent(String.self, forKey: .startTime)
        links_created_today = try values.decodeIfPresent(Int.self, forKey: .links_created_today)
        applied_campaign = try values.decodeIfPresent(Int.self, forKey: .applied_campaign)
        data = try values.decodeIfPresent(Data.self, forKey: .data)
    }

}


//  url chart
/*
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct Overall_url_chart: Codable {
    let hour00: Int?
    let hour01: Int?
    let hour02: Int?
    let hour03: Int?
    let hour04: Int?
    let hour05: Int?
    let hour06: Int?
    let hour07: Int?
    let hour08: Int?
    let hour09: Int?
    let hour10: Int?
    let hour11: Int?
    let hour12: Int?
    let hour13: Int?
    let hour14: Int?
    let hour15: Int?
    let hour16: Int?
    let hour17: Int?
    let hour18: Int?
    let hour19: Int?
    let hour20: Int?
    let hour21: Int?
    let hour22: Int?
    let hour23: Int?

    enum CodingKeys: String, CodingKey {
        case hour00 = "00:00"
        case hour01 = "01:00"
        case hour02 = "02:00"
        case hour03 = "03:00"
        case hour04 = "04:00"
        case hour05 = "05:00"
        case hour06 = "06:00"
        case hour07 = "07:00"
        case hour08 = "08:00"
        case hour09 = "09:00"
        case hour10 = "10:00"
        case hour11 = "11:00"
        case hour12 = "12:00"
        case hour13 = "13:00"
        case hour14 = "14:00"
        case hour15 = "15:00"
        case hour16 = "16:00"
        case hour17 = "17:00"
        case hour18 = "18:00"
        case hour19 = "19:00"
        case hour20 = "20:00"
        case hour21 = "21:00"
        case hour22 = "22:00"
        case hour23 = "23:00"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        hour00 = try values.decodeIfPresent(Int.self, forKey: .hour00)
        hour01 = try values.decodeIfPresent(Int.self, forKey: .hour01)
        hour02 = try values.decodeIfPresent(Int.self, forKey: .hour02)
        hour03 = try values.decodeIfPresent(Int.self, forKey: .hour03)
        hour04 = try values.decodeIfPresent(Int.self, forKey: .hour04)
        hour05 = try values.decodeIfPresent(Int.self, forKey: .hour05)
        hour06 = try values.decodeIfPresent(Int.self, forKey: .hour06)
        hour07 = try values.decodeIfPresent(Int.self, forKey: .hour07)
        hour08 = try values.decodeIfPresent(Int.self, forKey: .hour08)
        hour09 = try values.decodeIfPresent(Int.self, forKey: .hour09)
        hour10 = try values.decodeIfPresent(Int.self, forKey: .hour10)
        hour11 = try values.decodeIfPresent(Int.self, forKey: .hour11)
        hour12 = try values.decodeIfPresent(Int.self, forKey: .hour12)
        hour13 = try values.decodeIfPresent(Int.self, forKey: .hour13)
        hour14 = try values.decodeIfPresent(Int.self, forKey: .hour14)
        hour15 = try values.decodeIfPresent(Int.self, forKey: .hour15)
        hour16 = try values.decodeIfPresent(Int.self, forKey: .hour16)
        hour17 = try values.decodeIfPresent(Int.self, forKey: .hour17)
        hour18 = try values.decodeIfPresent(Int.self, forKey: .hour18)
        hour19 = try values.decodeIfPresent(Int.self, forKey: .hour19)
        hour20 = try values.decodeIfPresent(Int.self, forKey: .hour20)
        hour21 = try values.decodeIfPresent(Int.self, forKey: .hour21)
        hour22 = try values.decodeIfPresent(Int.self, forKey: .hour22)
        hour23 = try values.decodeIfPresent(Int.self, forKey: .hour23)
    }
}



// recent link
/*
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Recent_links : Codable {
    let url_id : Int?
    let web_link : String?
    let smart_link : String?
    let title : String?
    let total_clicks : Int?
    let original_image : String?
    let thumbnail : String?
    let times_ago : String?
    let created_at : String?
    let domain_id : String?
    let url_prefix : String?
    let url_suffix : String?
    let app : String?
    let is_favourite : Bool?

    enum CodingKeys: String, CodingKey {

        case url_id = "url_id"
        case web_link = "web_link"
        case smart_link = "smart_link"
        case title = "title"
        case total_clicks = "total_clicks"
        case original_image = "original_image"
        case thumbnail = "thumbnail"
        case times_ago = "times_ago"
        case created_at = "created_at"
        case domain_id = "domain_id"
        case url_prefix = "url_prefix"
        case url_suffix = "url_suffix"
        case app = "app"
        case is_favourite = "is_favourite"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url_id = try values.decodeIfPresent(Int.self, forKey: .url_id)
        web_link = try values.decodeIfPresent(String.self, forKey: .web_link)
        smart_link = try values.decodeIfPresent(String.self, forKey: .smart_link)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        total_clicks = try values.decodeIfPresent(Int.self, forKey: .total_clicks)
        original_image = try values.decodeIfPresent(String.self, forKey: .original_image)
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
        times_ago = try values.decodeIfPresent(String.self, forKey: .times_ago)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        domain_id = try values.decodeIfPresent(String.self, forKey: .domain_id)
        url_prefix = try values.decodeIfPresent(String.self, forKey: .url_prefix)
        url_suffix = try values.decodeIfPresent(String.self, forKey: .url_suffix)
        app = try values.decodeIfPresent(String.self, forKey: .app)
        is_favourite = try values.decodeIfPresent(Bool.self, forKey: .is_favourite)
    }

}
// top linlks
/*
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Top_links : Codable {
    let url_id : Int?
    let web_link : String?
    let smart_link : String?
    let title : String?
    let total_clicks : Int?
    let original_image : String?
    let thumbnail : String?
    let times_ago : String?
    let created_at : String?
    let domain_id : String?
    let url_prefix : String?
    let url_suffix : String?
    let app : String?
    let is_favourite : Bool?

    enum CodingKeys: String, CodingKey {

        case url_id = "url_id"
        case web_link = "web_link"
        case smart_link = "smart_link"
        case title = "title"
        case total_clicks = "total_clicks"
        case original_image = "original_image"
        case thumbnail = "thumbnail"
        case times_ago = "times_ago"
        case created_at = "created_at"
        case domain_id = "domain_id"
        case url_prefix = "url_prefix"
        case url_suffix = "url_suffix"
        case app = "app"
        case is_favourite = "is_favourite"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url_id = try values.decodeIfPresent(Int.self, forKey: .url_id)
        web_link = try values.decodeIfPresent(String.self, forKey: .web_link)
        smart_link = try values.decodeIfPresent(String.self, forKey: .smart_link)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        total_clicks = try values.decodeIfPresent(Int.self, forKey: .total_clicks)
        original_image = try values.decodeIfPresent(String.self, forKey: .original_image)
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
        times_ago = try values.decodeIfPresent(String.self, forKey: .times_ago)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        domain_id = try values.decodeIfPresent(String.self, forKey: .domain_id)
        url_prefix = try values.decodeIfPresent(String.self, forKey: .url_prefix)
        url_suffix = try values.decodeIfPresent(String.self, forKey: .url_suffix)
        app = try values.decodeIfPresent(String.self, forKey: .app)
        is_favourite = try values.decodeIfPresent(Bool.self, forKey: .is_favourite)
    }

}


// data



struct Data : Codable {
    let recent_links : [Recent_links]?
    let top_links : [Top_links]?
    let favourite_links : [String]?
    let overall_url_chart : Overall_url_chart?

    enum CodingKeys: String, CodingKey {

        case recent_links = "recent_links"
        case top_links = "top_links"
        case favourite_links = "favourite_links"
        case overall_url_chart = "overall_url_chart"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        recent_links = try values.decodeIfPresent([Recent_links].self, forKey: .recent_links)
        top_links = try values.decodeIfPresent([Top_links].self, forKey: .top_links)
        favourite_links = try values.decodeIfPresent([String].self, forKey: .favourite_links)
        overall_url_chart = try values.decodeIfPresent(Overall_url_chart.self, forKey: .overall_url_chart)
    }

}


