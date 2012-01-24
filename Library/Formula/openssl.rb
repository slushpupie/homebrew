require 'formula'

class Openssl <Formula
  url 'http://www.openssl.org/source/openssl-1.0.0e.tar.gz'
  version '1.0.0e'
  homepage 'http://www.openssl.org'
  md5 '7040b89c4c58c7a1016c0dfa6e821c86'

  keg_only :provided_by_osx,
    "The OpenSSL provided by Leopard (0.9.7) is too old for some software."

  def install
    system "./config", "--prefix=#{prefix}",
                       "--openssldir=#{etc}/openssl",
                       "zlib-dynamic", "shared"

    ENV.deparallelize # Parallel compilation fails
    system "make"
    system "make test"
    system "make install MANDIR=#{man} MANSUFFIX=ssl"
  end

  def caveats; <<-EOS.undent
    Note that the libraries built tend to be 32-bit only, even on Snow Leopard.
    EOS
  end
end
