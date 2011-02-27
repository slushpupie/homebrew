require 'formula'

class Coolkey <Formula
  url 'http://directory.fedora.redhat.com/download/coolkey/coolkey-1.1.0.tar.gz'
  homepage 'http://www.directory.fedora.redhat.com/wiki/CoolKey'
  md5 '815a1811a46bf9b8782107c073149cbe'

  # depends_on 'cmake'

  def install

    inreplace 'configure.in' do |s|
       s.gsub! /-arch ppc -arch i386/, '-arch ppc -arch i386 -arch x86_64'
       s.gsub! /MacOSX10\.4u\.sdk/, 'MacOSX10.5.sdk -mmacosx-version-min=10.5'
       s.gsub! /-L\/System\/Library\/Frameworks\/Security.framework\/Versions\/Current\/Security/, '-framework Security'
    end
    system "autoconf"

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"

    # system "cmake . #{std_cmake_parameters}"
    system "make"
    system "cd src/coolkey && make install"
  end
end
