require 'formula'

class MongodbDev < Formula
  homepage 'http://www.mongodb.org/'
  url 'https://github.com/mongodb/mongo/archive/r2.7.8.tar.gz'
  sha1 'e28b1d7fca78f02513a56c08b0c1a91db97b5336'
  version '2.7.8'

  depends_on 'scons'
  depends_on 'boost'

  conflicts_with "mongodb", :because=>"installs the same binaries"

  def install
    args =  ["--full", "--use-system-boost", "--prefix=#{prefix}"]

    if ENV.compiler == :clang && MacOS.version >= :mavericks
        args << "--64"
        args << "--libc++"
        args << "--osx-version-min=10.9"
    end

    system "scons", "install", *args
  end

  test do
    system "false"
  end

end
