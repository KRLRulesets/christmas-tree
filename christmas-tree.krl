ruleset christmas_tree {
	meta {
		name "Christmas Tree"
		description <<
A simple controller for Chad's Christmas tree. 			
		>>
		author "Phil Windley"
		logging off
	}


	global {

	}

	rule notify_for_water {
		select when xmastree need_water
		pre {
		 level = event:attr("value") || "unknown";
		}
        always {
          raise notification event status with
            priority = 2 and
            application = meta:rulesetName() and
            subject = "Christmas Tree" and
            description = "Your christmas tree needs watering, the water level is #{level}"
        }
	}
}
