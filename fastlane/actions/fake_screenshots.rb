module Fastlane
  module Actions
    class FakeScreenshotsAction < Action
      def self.run(params)
        devices = {
            "iphone35i"=> {
                "name"=> "iPhone 3.5 Inch",
                "width"=> 640,
                "height"=> 960
            },
            "iphone4i"=> {
                "name"=> "iPhone 4 Inch",
                "width"=> 640,
                "height"=> 1136
            },
            "iphone47i"=> {
                "name"=> "iPhone 4.7 Inch",
                "width"=> 750,
                "height"=> 1334
            },
            "iphone55i"=> {
                "name"=> "iPhone 5.5 Inch",
                "width"=> 1242,
                "height"=> 2208
            },
            "ipad"=> {
                "name"=> "iPad",
                "width"=> 768,
                "height"=> 1024
            },
            "iPadPro"=> {
                "name"=> "iPad Pro",
                "width"=> 2048,
                "height"=> 2732
            }
        }

        # UI.message Actions.sh('pwd')
        unless File.exist?("fastlane/screenshots/")
          Actions.sh('mkdir -p fastlane/screenshots/en-US')
          UI.message "Screenshots directory created for ios."
        end

        if File.exist?("fastlane/screenshots/en-US/iphone35i.png")
          UI.message "Screenshots for ios are already in place."
        else
          devices.each do |device, details|
            Actions.sh("convert -size #{details['width']}x#{details['height']} xc:White -gravity Center -weight 500 -pointsize 80 -annotate 0 '#{details['name']}' fastlane/screenshots/en-US/#{device}.png")
          end
          UI.message "Successfully generated fake screenshots for ios devices inside fastlane/screenshots/en-US/"
        end

      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
