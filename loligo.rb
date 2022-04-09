require "aws-sdk-sns"
require "json"
require "open-uri"

def lambda_handler(event:, context:)
    
    ttx = (Time.now.to_f * 1000).to_i
    
    headers = {  }
    url = "https://personalspace.buttonshy.com/services/moons/a76qafcz2ypz/attractions/qr75p135izuf/rates?t=#{ttx}&tz=300"
    squid_exchange = URI.open(url, headers) {|f| f.read}
    #sample API output:
    #squid_exchange = '{"day":5,"rates":[0,2,0,1,0,0],"limit":5}'
    
    resources = %w(worm🪱 rock🪨 fruit🍐 wood🪵 fish🐟 coral🐚)
    resources = %w(🪱 🪨 🍐 🪵 🐟 🐚)
    
    sale = JSON.parse(squid_exchange)

    result = ""
    
    resources.each_with_index do |resource, ix|
        next if sale["rates"][ix] == 0
        result += sale["rates"][ix].to_s
        result += "#{resource} "
    end
    
    result += "🛑#{sale['limit']} 🗓#{sale['day']} "
    
    puts result
    
    sns = Aws::SNS::Client.new(region: 'us-west-2')
    sns.publish({ phone_number: "+1 (334) 555 1212", message: result })
    
    { statusCode: 200, body: JSON.generate("Hamachi field configuration change 45424!") }
end

