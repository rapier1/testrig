��    x      �  �   �      (
     )
  ]   I
  .   �
  1   �
  1     (   :  "   c  '   �  -   �  �   �  R   s      �    �     �       *     )   F     p     �  B   �  >   �  S   !  P  u     �  )   �  2        8  �   P  U     S   t     �     �  6   �     5     F     d  /   ~  .   �  #   �       j     <   �  (   �  )   �  *     )   C  /   m  .   �     �  .   �  3     +   B  &   n     �  #   �     �     �     �  #     (   2  #   [  (     4   �  #   �       �     �   �      �  *   �  �   �  �   �     4  �   C     �     �  l         |  :   �  ?   �  �    :   �  .   �  9     ?   L  0   �  9   �  K   �     C   *   `   4   �   %   �   8   �   ;   !  $   [!  '   �!  *   �!  *   �!     �!  @   "  '   G"     o"     �"  '   �"  '   �"  5   �"  5   '#  !   ]#  M   #  !   �#     �#  \   $     j$     {$     �$  {   �$     #%     4%  +   J%  4   v%  �  �%  '   �'  v   �'  0   "(  B   S(  8   �(  +   �(  &   �(  &   ")  ;   I)  �   �)  u   9*  +   �*  6  �*     ,     &,  4   A,  B   v,     �,     �,  D   �,  >   3-  l   r-  �  �-     t/  .   �/  4   �/     �/  �   0  x   �0  U   j1  '   �1     �1  G   �1     E2  "   W2     z2  0   �2  4   �2  I   �2     I3  �   d3  O   �3  2   :4  -   m4  8   �4  4   �4  6   	5  A   @5     �5  6   �5  >   �5  0   6  9   96      s6  &   �6     �6     �6     �6  -   �6  2   $7  "   W7  =   z7  F   �7  )   �7     )8  �   @8  �   9  "   �9  /   :  �   1:  �   ;     �;  �   �;     �<     �<  �   �<  !   c=  .   �=  A   �=  �  �=  ?   �?  1   @  <   K@  7   �@  *   �@  5   �@  b   !A     �A  -   �A  1   �A  0   �A  <   -B  G   jB  =   �B  8   �B  1   )C  A   [C     �C  X   �C  -   D  ,   0D  $   ]D  8   �D  8   �D  G   �D  G   <E  ,   �E  ]   �E     F     *F  �   :F     �F     �F     �F  �   �F     �G     �G  G   �G  J   $H            *           R      9      ,      p   g   O   i   8              3   +   o   I   G   [      ;      v   u   !               e       :   Z   k      T       l      5                B   _   ]   "              t   N       2      d          %              )   h   J      w       S   
   7   @   >   .   V   c       C       ^   	   (   $          n              F       #   A   x          b   <   M       P   6   U   H   `           Y      Q      W   0   ?   -              E           r           f   L          q   1   m   X   D   \               &   4       /                 s       K      =   j              '   a      -- change password for volume   -- change password for volume, taking password from standard input.
	No prompts are issued.   -- decodes name and prints plaintext version   -- decodes the file and cats it to standard out   -- decrypts a volume and writes results to path   -- encodes a filename and print result   -- print version number and exit   -- show information (Default command)   -- show undecodable filenames in the volume   --extpass=program	Use external program for password prompt

Example, to mount at ~/crypt with raw storage in ~/.crypt :
    encfs ~/.crypt ~/crypt

   --public		act as a typical multi-user filesystem
			(encfs must be run as root)
   --reverse		reverse encryption
   -v, --verbose		verbose: output encfs debug messages
  -i, --idle=MINUTES	Auto unmount after period of inactivity
  --anykey		Do not verify correct key is being used
  --forcedecode		decode data even if an error is detected
			(for filesystems using MAC block headers)
  (NOT supported)
  (using %i:%i:%i)
  -- Supports block sizes of %i to %i bytes  -- Supports key lengths of %i to %i bits  -- block size %i bytes  -- key length %i bits %s (root dir)
  -- displays information about the filesystem, or 
 -------------------------- WARNING --------------------------
 A really old EncFS filesystem was found. 
It is not supported in this EncFS build.
 Add random bytes to each block header?
This adds a performance penalty, but ensures that blocks
have different authentication codes.  Note that you can
have the same benefits by enabling per-file initialization
vectors, which does not come with as great of performance
penalty. 
Select a number of bytes, from 0 (no random bytes) to 8:  Block Size: %i bytes Block Size: %i bytes + %i byte MAC header Block Size: %i bytes, including %i byte MAC header Build: encfs version %s Common Options:
  -H			show optional FUSE Mount Options
  -s			disable multithreaded operation
  -f			run in foreground (don't spawn daemon).
			Error messages will be sent to stderr
			instead of syslog.
 Config subversion %i found, but this version of encfs only supports up to version %i. Configuration finished.  The filesystem to be created has
the following properties: Creating new encrypted volume. Directory not created. Each file contains 8 byte header with unique IV data.
 EncFS Password:  Enter current Encfs password
 Enter new Encfs password
 Enter the number corresponding to your choice:  Error decoding volume key, password incorrect
 Error saving modified config file.
 Example: 
%s info ~/.crypt
 External chained IV disabled, as both 'IV chaining'
and 'unique IV' features are required for this option. Failure generating new volume key! Please report this error. File data IV is chained to filename IV.
 Filename encoding: "%s", version %i:%i:%i Filenames encoded using IV chaining mode.
 Filesystem cipher: "%s", version %i:%i:%i For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. In directory %s: 
 Incorrect number of arguments for command "%s" Internal error: Caught exception from main loop: %s Internal error: Caught unexpected exception Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Invalid password
 Invalid selection. Key Size: %i bits MAC comparison failure in block %li MAC comparison failure, refusing to read Manual configuration mode selected. Missing one or more arguments, aborting. Must set password program when using mount-on-demand Name coding interface not supported New Encfs Password:  Note: requested single-threaded mode, but an idle
timeout was specified.  The filesystem will operate
single-threaded, but threads will still be used to
implement idle checking. Now you will need to enter a password for your filesystem.
You will need to remember this password, as there is absolutely
no recovery mechanism.  However, the password can be changed
later using encfsctl.

 Paranoia configuration selected. Passwords did not match, please try again
 Please choose from one of the following options:
 enter "x" for expert configuration mode,
 enter "p" for pre-configured paranoia mode,
 anything else, or an empty line will select standard mode.
?>  Please select a key size in bits.  The cipher you have chosen
supports sizes from %i to %i bits in increments of %i bits.
For example:  Remount failed Select a block size in bytes.  The cipher you have chosen
supports sizes from %i to %i bytes in increments of %i.
Or just hit enter for the default (%i bytes)
 Selected algorithm "%s" Selected key size:  Sorry, unable to locate cipher for predefined configuration...
Falling through to Manual configuration mode. Standard configuration selected. The configuration loaded is not compatible with --reverse
 The directory "%s" does not exist. Should it be created? (y,N)  The external initialization-vector chaining option has been
enabled.  This option disables the use of hard links on the
filesystem. Without hard links, some programs may not work.
The programs 'mutt' and 'procmail' are known to fail.  For
more information, please see the encfs mailing list.
If you would like to choose another configuration setting,
please press CTRL-C now to abort and start over. The filename encoding interface requested is not available The following cipher algorithms are available: The following filename encoding algorithms are available: The raw directory may not be a subdirectory of the mount point. The requested cipher interface is not available
 The requested filename coding interface is not available
 This version of EncFS doesn't support filesystems created before 2004-08-13 Unable to create directory:  Unable to find cipher %s, version %i:%i:%i Unable to find nameio interface %s, version %i:%i:%i Unable to find specified cipher "%s"
 Unable to initialize encrypted filesystem - check path.
 Unable to instanciate cipher %s, key size %i, block size %i Unable to load or parse config file
 Unable to locate mount point, aborting. Unable to locate root directory, aborting. Unmounting filesystem %s due to inactivity Usage:
 Usage: %s [options] rootDir mountPoint [-- [FUSE Mount Options]] Using filesystem block size of %i bytes Using key size of %i bits Verify Encfs Password:  Version 3 configuration; created by %s
 Version 4 configuration; created by %s
 Version 5 configuration; created by %s (revision %i)
 Version 6 configuration; created by %s (revision %i)
 Volume Key successfully updated.
 When specifying daemon mode, you must use absolute paths (beginning with '/') Zero length password not allowed
 directory %s does not exist.
 encfs [options] rootDir mountPoint -- [FUSE Mount Options]
valid FUSE Mount Options follow:
 encfs version %s encfsctl version %s filesystem block size:  fuse failed.  Common problems:
 - fuse kernel module not installed (modprobe fuse)
 - invalid options -- see usage message
 getopt error: %i invalid command: "%s" option '--public' ignored for non-root user truncate failure: read %i bytes, partial block of %i Project-Id-Version: encfs
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2009-10-15 22:35+0000
Last-Translator: celil aydin <Unknown>
Language-Team: Turkish <tr@li.org>
Language: tr
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   -- bölümün parolasını değiştir   --standart giriş aygıtından parolayı alarak, bölümün parolasını değiştir.
	İstekte bulunmadan alınacak.   -- adı çözümler ve düz metin olarak basar   -- dosyayı çözümler ve içeriğini standart çıkışa yazar   -- bölümün şifresini çözer ve sonucu yola yazar.   -- dosya adını şifreleyip ekrana basar   -- sürüm numarasını bas ve çık   --bilgi göster (Öntanımlı komut)   -- bölümdeki çözümlenemeyen dosya adlarını göster   --extpass=program	Parola girişi için belirtilen programı kullan

Örneğin, ~/.crypt 'deki çözülmemiş depoyu, ~/crypt olarak bağlamak için:
    encfs ~/.crypt ~/crypt

   --public 		tipik bir çok kullanıcılı dosya sistemi gibi davran
			(enfcs root olarak çalıştırılmalıdır)
   --reverse		şifrelemeyi tersine çevirir
   -v, --verbose		konuşkan: encfs debug mesajlarını göster
  -i, --idle=DAKİKA	 Süresince kullanılmazsa otomatik ayır.
  --anykey		 Doğru anahtarın kullanıldığını doğrulama
  --forcedecode		Bir hata bulunsa bile verinin şifresini çöz
			(MAC blok başlığı kullanan dosya sistemleri için)
  (DESTEKLENMİYOR)
  (%i:%i:%i yi kullanarak)
  --%i bayttan %i bayta kadar blok boyutunu destekler  -- %i bitten %i bite kadar olan anahtar uzunluklarını destekler  -- blok boyutu %i bayt  -- anahtar uzunluğu %i bit %s (kök dizin)
  -- dosya sistemi hakkında bilgi gösterir, veya 
 --------------------------- UYARI ---------------------------
 Bu dosya sistemi EncFS'in çok eski bir sürümüyle yaratılmış. 
Bu sürüm tarafından desteklenmiyor.
 Her blok başlığına rastlantısal baytlar eklensin mi?
Bu performansta düşüşe neden olur ama her bloğun kimlik 
doğrulama kodunun farklı olmasını sağlar. Aynı faydayı 
performansta daha az düşüş yaratan, dosyaya özel başlantıcı 
vektörlerin kullanımını açarak da elde edebileceğinize dikkat ediniz. 
0'dan (hiç rastlantısal bayt ekleme) 8'e kadar bir bayt sayısı seçin:  Blok Boyutu: %i bayt Blok boyutu: %i bayt + %i bayt MAC başlığı Blok Boyutu: %i bayt (%i bayt MAC başlığı dahil) Yapım: encfs sürüm %s Sık kullanılan seçenekler:
  -H			isteğe bağlı FUSE Bağlama Seçeneklerini göster
  -s			çoklu thread desteğini kapat
  -f			Ön planda çalış (daemon olarak değil) ve
			Hata mesajlarını syslog yerine stderr'e gönder
 Bulunan yapılandırma altsürümü %i, ancak encfs'in bu sürümü %i altsürümüne kadar olan dosyaları destekliyor. Yapılandırma tamamlandı. Yaratılan dosya sistemi
aşağıdaki özelliklere sahip: Yeni şifrelenmiş alan oluşturuluyor. Dizin yaratılmadı. Her dosya eşsiz BV verisi ile birlikte 8 bayt tutan başlık içerir.
 EncFS Parolası:  Geçerli Encfs parolasını girin
 Yeni Encfs parolanızı girin
 Seçiminize karşılık gelen sayıyı giriniz:  Alan anahtarı çözülmesinde hata, şifre hatalı
 Değiştirilmiş yapılandırma dosyası kaydedilirken bir hata oluştu.
 Örnek: 
%s info ~/.crypt
 Dışsal zincirlenmiş BV kapatıldı; çünkü bu özellik için hem 
'BV zincirlemesi'nin hem de 'eşsiz BV' özelliği gereklidir. Yeni alan anahtarı üretilirken bir hata oluştu! Lütfen bu hatayı bildirin. Dosya verisi BV'ü, dosya adı BV'ne zincirlendi.
 Dosya adı şifreleme: "%s", sürüm %i:%i:%i Dosyalar, BV zincirleme modu kullanılarak şifrelendi.
 Dosya sistemi şifreleyicisi: "%s", sürüm %i:%i:%i Daha fazla bilgi için, enfcs(1) man sayfasına bakın %i adet geçersiz dosya bulundu. %i adet geçersiz dosya bulundu. %s dizininde: 
 "%s" komutu için yanlış sayıda parametre verilmiş İçsel Hata: Ana döngüde oluşan bir istisna yakalandı: %s İçsel Hata: Beklenmeyen bir istisna yakalandı Dahili hata: programın çalıştırılması başarısız Dahili hata: fork() başarısız Dahili hata: socketpair() başarısız Geçersiz parola
 Geçersiz seçim. Anahtar Boyutu: %i bit %li nolu blokta MAC karşılaştırma hatası MAC karşılaştırma hatası, okuma reddediliyor. Elle yapılandırma kipi seçildi. Bir veya daha fazla argüman eksik, işlem yarıda kesiliyor. İstek-üzerine-bağlama kullanılırken parola programı ayarlanmalı İsim şifreleme arayüzü desteklenmiyor Yeni Enfcs Parolası:  Not: Tek kanallı çalışma kipi istendiği halde beklemeye 
zaman aşımı belirtilmiş. Dosya sistemi tek kanallı çalışacak 
fakat bekleme takibi yapılması için hala çok kanallı çalışacak. Şimdi dosya sistemi için bir şifre girmelisiniz.
Bu şifreyi geri almak imkansız olduğu için, şifrenizi
unutmamalısınız. İsterseniz encfsctl kullanarak
şifrenizi daha sonra değiştirebilirsiniz.

 Paranoyak yapılandırma seçildi. Parolalar aynı değil, lütfen tekrar deneyin
 Lütfen aşağıdaki seçeneklerden birini seçin:
 Uzman yapılandırma kipi için "x",
 Önceden yapılandırılmış paranoyak kip için "p",
 Standart yapılandırma için diğer herhangi bir tuş veya boş satır.
?>  Lütfen bit olarak bir anahtar boyutu seçiniz. Seçtiğiniz şifreleme 
algoritması %i den %i bite kadar boyutları %i bit artırmalı olarak destekliyor.
Örneğin:  Yeniden bağlama başarısız Bayt olarak bir blok boyutu seçiniz. Seçtiğiniz şifreleme algoritması
%i den %i ye kadar boyutları %i artırmalı olarak destekliyor.
Veya ön tanımlı değer (%i bayt) için "enter" tuşuna basınız.
 Seçilen algoritma "%s" Seçilen anahtar boyutu:  Üzgünüm, önceden tanımlı yapılandırma için gerekli şifreleme algoritması bulunamadı.
Elle yapılandırma kipine geçiyorum. Standart yapılandırma seçildi. Yüklenen ayarlar --reverse ile uyumlu değil
 "%s" dizini mevcut değil. Yaratılmasını ister misiniz? (y,N)  Dışsal başlatıcı-vektör zircirleme seçeneği açıldı. Bu seçenek
dosya sisteminde sabit bağlantıların kullanılabilmesini engeller.
Sabit bağlantılar olmadan, bazı programlar çalışmayabilir.
'mutt' ve 'procmail' programlarının çalışmadığı biliniyor.
Daha fazla bilgi için, lütfen encfs e-posta listesine bakınız.
Eğer başka yapılandırma ayarlarını seçmek isterseniz, lütfen
CTRL-C tuşlarına basarak bunu yarıda kesip, yeniden başlatınız. İstenen dosya adı şifreleme arayüzü kullanılabilir değil Aşağıdaki şifreleme algoritmaları mevcuttur: Aşağıdaki dosya adı şifreleme algoritmaları mevcuttur: Ham dizin, bağlama noktasının bir alt dizini olamaz. İstenen şifreleme arayüzü bulunamadı
 İstenen dosya adı şifreleme arayüzü bulunamadı
 EncFS'nin bu sürümü 13-08-2004 tarihinden önce yaratılmış dosya sistemlerini desteklemiyor. Dizin yaratılamıyor:  Şifreleyici %s, sürüm %i:%i:%i bulunamadı nameio arayüzü %s, sürüm %i:%i:%i bulunamadı Belirtilen şifreleme yöntemi "%s" bulunamadı
 Şifreli dosya sistemi ilklendirilemedi. Yolu kontrol edin.
 %s algoritması %i anahtar boyutu ve %i blok boyutu ile yaratılamadı. Yapılandırma dosyası yüklenemiyor veya çözümlenemiyor
 Bağlama noktası bulunamadı, işlem yarıda kesiliyor. Kök dizin bulunamadı, işlem yarıda kesiliyor. Dosya sistemi %s bir süredir kullanılmadıgından çözülüyor Kullanım:
 Kullanım: %s [seçenekler] kökDizin bağlamaNoktası [-- [FUSE Bağlama Seçenekleri]] Kullanılan dosya sistemi blok boyutu %i bayt %i bit boyutundaki anahtarlar kullanılıyor Enfcs Parolasını doğrulayınız:  %s tarafından oluşturulan Sürüm 3 yapılandırması
 %s tarafından oluşturulan sürüm 4 yapılandırması
 %s  (revizyon %i) tarafından oluşturulan sürüm 5 yapılandırması
 %s  (revizyon %i) tarafından oluşturulan sürüm 6 yapılandırması
 Bölüm anahtarı başarıyla güncellendi.
 Arkaplanda çalışmasını seçtiğinizde, tam yollar ('/' ile başlayan) kullanmalısınız Boş parola kullanılamaz
 %s dizini yok.
 encfs [seçenekler] kökDizin bağlamaNoktası -- [FUSE Bağlama Seçenekleri]
geçerli FUSE Bağlama Seçenekleri aşağıdadır:
 encfs sürüm %s encfsctl sürüm %s dosya sistemi blok boyutu:  fuse başarısız oldu. Olası sorunlar:
 - fuse çekirdek modülü kurulu değil (Çözüm: modprobe fuse)
 - geçersiz seçenekler belirtilmiş -- kullanım mesajına bakınız
 getopt hatası: %i geçersiz komut: "%s" kullanıcı root olmadığından '--public' seçeneği gözardı edildi kısaltma başarısız: %i bayt okunan, %i nin kısmi bölümü engellendi 