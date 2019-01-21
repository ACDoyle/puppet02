Puppet::Type.type(:file).provide(:posix) do
  desc "Normal Unix-like POSIX support for file management."

  def create
    File.open(@resource[:name], "w") { |f| f.puts "" } # Create an empty file
  end

  def destroy
    File.unlink(@resource[:name])
  end

  def exists?
    File.exists?(@resource[:name])
  end
end
