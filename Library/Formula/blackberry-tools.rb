require 'formula'

class BlackberryTools < Formula
  homepage 'https://bdsc.webapps.blackberry.com/android/tool'
  url 'https://bdsc.webapps.blackberry.com/android/downloads/fetch/CommandLineTools.zip'
  md5 '415d03a8a587871e49203095cc80a3fb'
  version '20120307'

  def install
    system "mkdir -p #{prefix}/bin #{prefix}/lib #{prefix}/share/blackberry #{prefix}/share/doc/blackberry"
    system "cp lib/*.jar #{prefix}/lib"
    system "cp -r bin/apk2bar bin/apk2barVerifier bin/batchbar-deploy bin/batchbar-signer bin/blackberry-connect bin/blackberry-debugtokenrequest bin/blackberry-deploy bin/blackberry-keytool bin/blackberry-packager bin/blackberry-signer bin/kickver #{prefix}/bin/"
    system "cp -r blackberry/* #{prefix}/share/blackberry/"
    system "cp readme.txt #{prefix}/share/doc/blackberry/"
  end

end
