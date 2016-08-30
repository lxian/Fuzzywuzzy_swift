Pod::Spec.new do |spec|
  spec.name = "Fuzzywuzzy_swift"
  spec.version = "0.0.1"
  spec.summary = "Fuzzy String Matching in Swift using Levenshtein Distance. Inspired by the python fuzzywuzzy library https://github.com/seatgeek/fuzzywuzzy"
  spec.homepage = "https://github.com/lxian/Fuzzywuzzy_swift"
  spec.license = { type: 'MIT', file: 'LICENSE.txt' }
  spec.authors = { "Li Xian" => 'lxian2shell@gmail.com' }

  spec.platform = :ios, "8.0"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/lxian/Fuzzywuzzy_swift.git", tag: "v#{spec.version}", submodules: true }
  spec.source_files = "Fuzzywuzzy_swift/**/*.{h,swift}"

end
