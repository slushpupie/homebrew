require 'formula'

class Fakeroot <Formula
  url 'http://ftp.de.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.14.4.orig.tar.bz2'
  homepage 'http://packages.debian.org/fakeroot'
  md5 'bea628be77838aaa7323a2f7601c2d7e'

  # depends_on 'cmake'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
