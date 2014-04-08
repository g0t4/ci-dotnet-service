require 'albacore'

SOLUTION_FILE = 'src/Project.sln'

msbuild :build do |msb|
  sh 'nuget restore src/'
  msb.properties :configuration => :Release
  msb.targets :Rebuild
  msb.solution = SOLUTION_FILE
end

nunit :tests => [:build] do |cmd|
  cmd.command = "src/packages/NUnit.Runners.2.6.3/tools/nunit-console.exe"
  cmd.assemblies = FileList["src/Tests/bin/Release/Tests.dll"]
end

task :continuous_integration => [:tests]