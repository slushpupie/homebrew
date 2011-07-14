require 'formula'

class Openssl <Formula
  url 'http://www.openssl.org/source/openssl-1.0.0d.tar.gz'
  version '1.0.0d'
  homepage 'http://www.openssl.org'
  md5 '40b6ea380cc8a5bf9734c2f8bf7e701e'

  keg_only :provided_by_osx,
    "The OpenSSL provided by Leopard (0.9.7) is too old for some software."

  def install
    system "./config", "--prefix=#{prefix}",
                       "--openssldir=#{etc}",
                       "zlib-dynamic", "shared"
    ENV.j1 # Parallel compilation fails
    system "make"
    system "make test"
    system "make install"
  end

  def caveats; <<-EOS.undent
    Note that the libraries built tend to be 32-bit only, even on Snow Leopard.
    EOS
  end
end
