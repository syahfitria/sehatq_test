class OneSignalService
	API_KEY = "NTM2YzY3N2UtMzMzZC00Y2YzLWExMWMtZGU4OWNkNmM1Nzgz"
	USER_AUTH_KEY = "MzcwNzNkYTEtMTg5NC00YjY4LTg2MjctODdmMzc0N2ViZjIz"
	APP_ID = "10432b96-046a-45d4-8ecc-2b5446573bb4"

	def self.send_notification_payment(device_id, title, content)
		OneSignal::OneSignal.api_key = API_KEY
		OneSignal::OneSignal.user_auth_key = USER_AUTH_KEY

		params = {
		  app_id: APP_ID,
		  headings: {
				en: title
			},
		  contents: {
		    en: content
		  },
		  data: {
				type_id: 1
			},
		  ios_badgeType: 'None',
		  ios_badgeCount: 1,
		  include_player_ids: [device_id]
		}

		begin
		  response = OneSignal::Notification.create(params: params)
		  notification_id = JSON.parse(response.body)["id"]

		  return true
		rescue OneSignal::OneSignalError => e
		  puts "--- OneSignalError  :"
		  puts "-- message : #{e.message}"
		  puts "-- status : #{e.http_status}"
		  puts "-- body : #{e.http_body}"

		  return false
		end
	end
end