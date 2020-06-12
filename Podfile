platform :ios, deployment_target: '13.0'

inhibit_all_warnings!

# Import CocoaPods sources
source 'https://github.com/CocoaPods/Specs.git'
#use_modular_headers!
use_frameworks!
dynamic_frameworks = []

# make all the other frameworks into static frameworks by overriding the static_framework? function to return true
pre_install do |installer|
    installer.pod_targets.each do |pod|
        if !dynamic_frameworks.include?(pod.name)
            puts "Overriding the static_framework? method for #{pod.name}"
            def pod.static_framework?;
                true
            end
        end
    end
end


target 'WashHands' do
pod 'SwiftLint'
end


post_install do |installer|
    if !installer
        return
    end
    fix_deployment_target(installer)
end

def fix_deployment_target(pod_installer) # https://github.com/CocoaPods/CocoaPods/issues/7314
    puts "Make the pods deployment target version the same as our target"
    
    project = pod_installer.pods_project
    deploymentMap = {}
    project.build_configurations.each do |config|
        deploymentMap[config.name] = config.build_settings['IPHONEOS_DEPLOYMENT_TARGET']
    end
    # p deploymentMap
    
    project.targets.each do |t|
        puts "  #{t.name}"
        t.build_configurations.each do |config|
            oldTarget = config.build_settings['IPHONEOS_DEPLOYMENT_TARGET']
            newTarget = deploymentMap[config.name]
            if oldTarget == newTarget
                next
            end
            puts "    #{config.name} deployment target: #{oldTarget} => #{newTarget}"
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = newTarget
        end
    end
end
