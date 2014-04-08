DELIVERY_DIRECTORY = 'C:\service'
SERVICE_EXE = File.join(DELIVERY_DIRECTORY, 'Project.exe')

task :deliver do
  ## hack to uninstall
  begin
    sh "#{SERVICE_EXE} uninstall"
  rescue
  end
  
  FileUtils.rm_rf(DELIVERY_DIRECTORY)
  FileUtils.cp_r('build', DELIVERY_DIRECTORY)

  sh "#{SERVICE_EXE} install start"
end
