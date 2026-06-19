workspace "Reference Architecture" "Backend For Frontend" {

    !identifiers hierarchical

    model {
        daylog = softwareSystem "Daylog" {
            description "Service/Application that work together to provide functionality to end users."
            ui = container "User Interface" {
                tag "WebBrowser"
                technology "react"
            }
            app = container "Application" {
                tag "MobileDevice"
                technology "Kotlin"
            }
            bffui = container "BFF - Web UI" {
                technology "Golang"
            }
            bffapp = container "BFF - Mobile App" {
                technology "Golang"
            }
            staff_service = container "Staff Service" {
                technology "Golang"
            }
            child_service = container "Child Service" {
                technology "Golang"
            }
            activity_service = container "Activity Service" {
                technology "Golang"
            }
            classroom_service = container "Classroom Service" {
                technology "Golang"
            }

        }

        # Relationships 
        daylog.ui -> daylog.bffui "Uses"
        daylog.app -> daylog.bffapp "Uses"
        daylog.bffui -> daylog.staff_service "Uses"
        daylog.bffui -> daylog.child_service "Uses"
        daylog.bffui -> daylog.activity_service "Uses"
        daylog.bffui -> daylog.classroom_service "Uses"
        daylog.bffapp -> daylog.activity_service "Uses"
        daylog.bffapp -> daylog.classroom_service "Uses"
    }   

    views {
        container daylog "Daylog_Containers" {
            include daylog.ui
            include daylog.app
            include daylog.bffui
            include daylog.bffapp
            include daylog.staff_service
            include daylog.child_service
            include daylog.activity_service
            include daylog.classroom_service
            autolayout tb
        }

        styles {
            element "Element" {
                color #0773af
                stroke #0773af
                strokeWidth 7
                shape roundedbox
            }       
            element "WebBrowser" {
                shape WebBrowser
            }
            element "MobileDevice" {
                shape MobileDevicePortrait
            }
            element "Person" {
                shape person
            }
            element "Boundary" {
                strokeWidth 5
            }
            relationship "Relationship" {
                thickness 4
            }
            element "Database" {
                shape cylinder
            }
        }
    }
    
}

//  docker run -it --rm -p 8080:8080 -v $pwd`:/usr/local/structurizr structurizr/structurizr local 

// docker run --rm -v $pwd`:/usr/local/structurizr structurizr/structurizr export -format png -workspace workspace.json -output images

