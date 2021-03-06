#!/usr/bin/env osascript
#
# Launch all these services in separate panes in iTerm:
#
# - service-cms
# - service-authentication
# - service-content
# - service-gateway
# - service-location
# - service-prize-draw
# - service-stock
# - service-thank-you
# - service-profile
# - service-reporting
# - service-audit
#
# As well as these apps:
#
# - app-cms
# - app-web
#
# reference:
# http://eastmanreference.com/complete-list-of-applescript-key-codes/

property PWD          : "/Users/juanuys/Documents/ee/apps"
property currentCount : 0

tell application "iTerm"
	tell current window
		tell current session
			# pane
			set currentCount to currentCount + 1
			write text "echo debug " & currentCount
			write text "cd " & PWD & "/service-cms ;  docker-compose up"

			# create horizontal pane below
			tell application "System Events" to key code 2 using {command down, shift down}

			# pane
			set currentCount to currentCount + 1
			write text "echo debug " & currentCount
			write text "cd " & PWD & "/service-cms ;  ./gradlew -x dependencyCheck -x test startServer"

			# pane
			tell application "System Events" to key code 2 using {command down}
			set currentCount to currentCount + 1
			write text "echo debug " & currentCount
			write text "cd " & PWD & "/service-authentication ;  ./gradlew -x dependencyCheck -x test startServer"

			# pane
			tell application "System Events" to key code 2 using {command down}
			set currentCount to currentCount + 1
			write text "echo debug " & currentCount
			write text "cd " & PWD & "/service-content ;  ./gradlew -x dependencyCheck -x test startServer"

			# pane
			tell application "System Events" to key code 2 using {command down}
			set currentCount to currentCount + 1
			write text "echo debug " & currentCount
			write text "cd " & PWD & "/service-gateway ;  ./gradlew -x dependencyCheck -x test startServer"

			# pane
			tell application "System Events" to key code 2 using {command down}
			set currentCount to currentCount + 1
			write text "echo debug " & currentCount
			write text "cd " & PWD & "/app-cms ; PRIORITY_ENV=localhost yarn start"

			# pane
			tell application "System Events" to key code 2 using {command down}
			set currentCount to currentCount + 1
			write text "echo debug " & currentCount
			write text "cd " & PWD & "/service-profile ;  ./gradlew -x dependencyCheck -x test startServer"

			# pane
			tell application "System Events" to key code 2 using {command down}
			set currentCount to currentCount + 1
			write text "echo debug " & currentCount
			write text "cd " & PWD & "/service-rewards ;  ./gradlew -x dependencyCheck -x test startServer"

			# pane
			tell application "System Events" to key code 2 using {command down}
			set currentCount to currentCount + 1
			write text "echo debug " & currentCount
			write text "cd " & PWD & "/infra-soa-stubs ; docker run -it --rm -p 8081:8080 --name stubs -v $(pwd)/stub:/home/wiremock infra/soa-stubs:latest"


			# jump vertically and create new pane
			tell application "System Events" to key code 30 using {command down}
			tell application "System Events" to key code 2 using {command down}

			# pane
			set currentCount to currentCount + 1
			write text "echo debug " & currentCount
			write text "cd " & PWD & "/service-location ;  ./gradlew -x dependencyCheck -x test startServer"

			# pane
			tell application "System Events" to key code 2 using {command down}
			set currentCount to currentCount + 1
			write text "echo debug " & currentCount
			write text "cd " & PWD & "/service-prize-draw ;  ./gradlew -x dependencyCheck -x test startServer"

			# pane
			tell application "System Events" to key code 2 using {command down}
			set currentCount to currentCount + 1
			write text "echo debug " & currentCount
			write text "cd " & PWD & "/service-stock ;  ./gradlew -x dependencyCheck -x test startServer"

			# pane
			tell application "System Events" to key code 2 using {command down}
			set currentCount to currentCount + 1
			write text "echo debug " & currentCount
			write text "cd " & PWD & "/app-web ;  PRIORITY_ENV=localhost yarn run develop"

			# pane
			tell application "System Events" to key code 2 using {command down}
			set currentCount to currentCount + 1
			write text "echo debug " & currentCount
			write text "cd " & PWD & "/service-thank-you ;  ./gradlew -x dependencyCheck -x test startServer"

			# pane
			tell application "System Events" to key code 2 using {command down}
			set currentCount to currentCount + 1
			write text "echo debug " & currentCount
			write text "cd " & PWD & "/service-reporting ;  ./gradlew -x dependencyCheck -x test startServer"

			# pane
			tell application "System Events" to key code 2 using {command down}
			set currentCount to currentCount + 1
			write text "echo debug " & currentCount
			write text "cd " & PWD & "/service-soa-cache ;  ./gradlew -x startManagedMongoDb -x dependencyCheck -x test startServer"

			# pane
			tell application "System Events" to key code 2 using {command down}
			set currentCount to currentCount + 1
			write text "echo debug " & currentCount
			write text "cd " & PWD & "/service-audit ;  ./gradlew -x dependencyCheck -x test startServer"

		end tell
	end tell
end tell


