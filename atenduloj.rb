require "net/http"
require "openssl"
require "rexml/document"
require "uri"
require "aws-sdk-sns"

def lambda_handler(event:, context:)
  post_body = <<-END
<?xml version='1.0'?>
<request command='list'>
<parameter keyword='accountId' value='YOUR-ACCOUNT-NAME-HERE'/>
<parameter keyword='password' value='YOUR-PASSWORD-HERE' /> 
<parameter keyword='onlyMine' value='true' />
<parameter keyword='format' value='xml' />
<parameter keyword='active' value='false' />
</request>
END

  uri = URI.parse("https://rswgame.com/xml")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  req = Net::HTTP::Post.new(uri.request_uri)
  req["Content-Type"] = "text/xml"
  req["dataType"] = "xml"

  response = http.request(req, post_body)
  puts "response: #{response.code} #{response.message}"
  doc = REXML::Document.new(response.body)

  sms_payload = ""

  doc.elements.each("response/gameHeader") do |header|
    g = header.attributes
    puts "game: #{g['gameId']}"
    puts "wait: #{g['numWaitingFor']}"
    puts "turn: #{g['turnNumber']} due: #{g['nextTurnTime']}"
    sms_payload += "awaiting #{g['numWaitingFor']} for #{g['gameId']} turn #{g['turnNumber']} \n"
  end
  
    sns = Aws::SNS::Client.new(region: 'us-east-1')
    resp = sns.publish({
      phone_number: "+1 334 555 1212",
      message: sms_payload,
      })
    
    { statusCode: 200, body: JSON.generate('Saluton de Lambda!') }
end

