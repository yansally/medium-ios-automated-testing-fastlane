# Project Global Platform
platform :ios, '11.2'
source 'https://gitlab.com/glance-networks/CocoaPodsSpecs.git'

use_frameworks!
inhibit_all_warnings!

def test_pods
  pod 'Glance_iOS', '4.8.5.3'
end

target 'Notes' do
  inherit! :search_paths
  test_pods
end

target 'NotesTests' do
  inherit! :search_paths
  # Pods for testing
  test_pods
end

target 'NotesUITests' do
  inherit! :search_paths
  # Pods for testing
  test_pods
end

ENV["COCOAPODS_DISABLE_STATS"] = "true"
