��    p      �  �         p	     q	  ]   �	  .   �	  1   
  1   P
  (   �
  "   �
  '   �
  -   �
  �   $  R   �              /  *   B  )   m     �     �  B   �  >   	  S   H  P  �     �  )     2   ,  �   _  U   -  S   �     �     �  6        D     U     s  /   �  .   �  #   �       j   ,  <   �  (   �  )   �  *   '  )   R  /   |  .   �     �  .   �  3     +   Q  &   }     �  #   �     �     �       #     (   A  #   j  (   �  #   �     �  �   �  �   �      r  *   �  �   �  �   �  �        �     �  l   �      G  ?   h  �  �  :   8  .   s  9   �  0   �  9        G  *   d  4   �  %   �  8   �  ;   #  $   _  '   �  *   �  *   �        @   
   '   K      s      �   '   �   '   �   5   �   !   +!  M   M!  !   �!     �!  \   �!     8"     I"     ]"  {   u"     �"     #  +   #  4   D#  �  y#     s%  _   �%  7   �%  3   (&  M   \&  5   �&  #   �&  #   '  C   ('  �   l'  �   %(  K  �(     �)     *  -   !*  3   O*     �*     �*  I   �*  >   +  `   C+  p  �+     -  .   +-  <   Z-  �   �-  V   u.  g   �.      4/     U/  I   j/     �/      �/     �/  $   0  6   (0  1   _0     �0  y   �0  W   )1  8   �1  ,   �1  4   �1  =   2  /   Z2  J   �2     �2  2   �2  -   3  %   I3  ,   o3  $   �3  *   �3     �3     4     4  &   24  5   Y4     �4  4   �4  -   �4     5  �   '5  �   �5  !   �6  =   7  �   I7  �   ,8  �   �8     f9     }9  m   �9     �9  5   :  �  U:  I   <  1   W<  B   �<  >   �<  L   =     X=  .   w=  F   �=  2   �=  D    >  K   e>  ,   �>  7   �>  :   ?  C   Q?  
   �?  I   �?  8   �?      #@     D@  #   ^@  #   �@  0   �@  +   �@  ]   A     aA     �A  `   �A      B     B  "   #B  �   FB     �B     �B  T   C  9   VC     D           :   ]          e   f   K   Y             G       j   X   J          6   &          2   A      (   Z       "   _      .   <       M      7       [       I   /   d       F   g   3   k   ?       H   *                ^               !   -   @             8       W          l       Q       L   b      $          0   +                 T   O   #   V   ,   h   \   %       i   o                   =   S              P      a   n   R       ;   `   c   p   >   C   1       9          
         	            N      '      )       5       U       E   4   m   B      -- change password for volume   -- change password for volume, taking password from standard input.
	No prompts are issued.   -- decodes name and prints plaintext version   -- decodes the file and cats it to standard out   -- decrypts a volume and writes results to path   -- encodes a filename and print result   -- print version number and exit   -- show information (Default command)   -- show undecodable filenames in the volume   --extpass=program	Use external program for password prompt

Example, to mount at ~/crypt with raw storage in ~/.crypt :
    encfs ~/.crypt ~/crypt

   --public		act as a typical multi-user filesystem
			(encfs must be run as root)
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
Select a number of bytes, from 0 (no random bytes) to 8:  Block Size: %i bytes Block Size: %i bytes + %i byte MAC header Block Size: %i bytes, including %i byte MAC header Common Options:
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
 Invalid selection. Key Size: %i bits MAC comparison failure in block %li MAC comparison failure, refusing to read Manual configuration mode selected. Missing one or more arguments, aborting. Name coding interface not supported New Encfs Password:  Note: requested single-threaded mode, but an idle
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
For example:  Select a block size in bytes.  The cipher you have chosen
supports sizes from %i to %i bytes in increments of %i.
Or just hit enter for the default (%i bytes)
 Selected algorithm "%s" Selected key size:  Sorry, unable to locate cipher for predefined configuration...
Falling through to Manual configuration mode. Standard configuration selected. The directory "%s" does not exist. Should it be created? (y,N)  The external initialization-vector chaining option has been
enabled.  This option disables the use of hard links on the
filesystem. Without hard links, some programs may not work.
The programs 'mutt' and 'procmail' are known to fail.  For
more information, please see the encfs mailing list.
If you would like to choose another configuration setting,
please press CTRL-C now to abort and start over. The filename encoding interface requested is not available The following cipher algorithms are available: The following filename encoding algorithms are available: The requested cipher interface is not available
 The requested filename coding interface is not available
 Unable to create directory:  Unable to find cipher %s, version %i:%i:%i Unable to find nameio interface %s, version %i:%i:%i Unable to find specified cipher "%s"
 Unable to initialize encrypted filesystem - check path.
 Unable to instanciate cipher %s, key size %i, block size %i Unable to load or parse config file
 Unable to locate mount point, aborting. Unable to locate root directory, aborting. Unmounting filesystem %s due to inactivity Usage:
 Usage: %s [options] rootDir mountPoint [-- [FUSE Mount Options]] Using filesystem block size of %i bytes Using key size of %i bits Verify Encfs Password:  Version 3 configuration; created by %s
 Version 4 configuration; created by %s
 Version 5 configuration; created by %s (revision %i)
 Volume Key successfully updated.
 When specifying daemon mode, you must use absolute paths (beginning with '/') Zero length password not allowed
 directory %s does not exist.
 encfs [options] rootDir mountPoint -- [FUSE Mount Options]
valid FUSE Mount Options follow:
 encfs version %s encfsctl version %s filesystem block size:  fuse failed.  Common problems:
 - fuse kernel module not installed (modprobe fuse)
 - invalid options -- see usage message
 getopt error: %i invalid command: "%s" option '--public' ignored for non-root user truncate failure: read %i bytes, partial block of %i Project-Id-Version: Encrypted Filesystem for Linux
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2007-09-08 21:29+0000
Last-Translator: Jukka Heino <vector@pp.nic.fi>
Language-Team: Finnish <fi@li.org>
Language: fi
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   -- vaihda taltion salasana   -- vaihda taltion salasana, salasana luetaan standardivirrasta (stdin)
	Ei esitä kysymyksiä   -- tulkitsee nimen ja tulostaa selväkielisen version   -- tulkitsee tiedoston sisällön ja tulostaa sen   -- tulkitsee taltion sisällön ja tallentaa tulokset annettuun hakemistoon   -- salaa tiedostonnimen ja näyttää lopputuloksen   -- tulosta versionumero ja poistu   -- näytä tietoa (oletuskomento)   -- näytä taltiossa olevat tiedostonnimet joita ei voida tulkita   --extpass=ohjelma	Käytä ulkoista ohjelmaa salasanan kysymiseen

Esimerkiksi liittääksesi ~/crypt-hakemistoon kryptatun tiedon ~/.crypt- hakemistosta:
    encfs ~/.crypt ~/crypt

   --public		käyttäydytään tyypillisen monen käyttäjän tiedostojärjestelmän tavoin
			(encfs täytyy ajaa root-käyttäjänä)
   -v, --verbose		runsassanainen: tulosta encfs:n debug-viestit
  -i, --idle=MINUUTIT	poista liitos automaattisesti toimettoman ajan jälkeen
  --anykey		älä tarkista, käytetäänkö oikeaa avainta
  --forcedecode		tulkitse data, vaikka virhe huomattaisiinkin
			(tiedostojärjestelmille, jotka käyttävät MAC-lohkoheadereita)
  (EI tuettu)
  (käytetään %i:%i:%i)
  -- tukee lohkon kokoja välillä %i-%i tavua  -- tukee avaimen pituuksia välillä %i-%i bittiä  -- lohkon koko %i tavua  -- avaimen pituus %i bittiä %s (juurihakemisto)
  -- tulostaa tietoa tiedostojärjestelmästä, tai 
 -------------------------- VAROITUS -------------------------
 Löydettiin todella vanha EncFS-tiedostojärjestelmä. 
Sitä ei tueta tässä EncFS-versiossa.
 Lisätäänkö satunnaisissa tavuja jokaiseen lohko-otsakkeeseen?
Tämä heikentää suorituskykyä, mutta varmistaa, että jokaisella
lohkolla on eri varmennuskoodi. Huomaa, että voit saada saman hyödyn
sallimalla tiedostokohtaiset alustusvektorit, jotka eivät vaikuta
suorituskykyyn yhtä paljon.
Valitse numero tavuissa väliltä 0 (ei satunnaisia tavuja) ja 8:  Lohkon koko: %i tavua Lohkon koko: %i tavua + %i-tavuinen MAC-otsake Lohkon koko: %i tavua, sisältäen %i-tavuisen MAC-otsakkeen Yleiset optiot:
  -Ht			näytä valinnaiset FUSE-liitosoptiot
  -st			poista monisäikeinen toiminta käytöstä
  -f			aja etualalla (älä luo daemonia)
			Virheilmoitukset lähetetään stderr:iin
			syslogin sijasta.
 Asetuksen aliversio %i löytyi, mutta tämä encfs-versio tukee vain versioon %i asti. Kokoonpanon määrittäminen päättyi. Luotiin tiedostojärjestelmä,
jolla on seuraavat ominaisuudet: Luodaan uutta salattua taltiota. Hakemistoa ei luotu. Jokainen tiedosto sisältää 8-tavuisen otsakkeen uniikilla IV-datalla.
 EncFS-salasana:  Syötä nykyinen Encfs-salasana
 Syötä uusi Encfs-salasana
 Syötä valintaasi vastaava numero:  Virhe tulkittaessa taltion avainta, salasana väärin
 Virhe tallennettaessa muutettua asetustiedostoa.
 Esimerkki: 
%s info ~/.crypt
 Ulkoinen ketjutettu IV kytketty pois päältä, koska sekä IV-ketjutus
että uniikki IV vaaditaan tätä optiota varten. Uuden taltioavaimen tuottaminen epäonnistui! Ole hyvä ja raportoi tästä virheestä. Tiedoston data-IV on ketjutettu tiedoston nimen IV:hen.
 Tiedostonimen koodaus: "%s", versio %i:%i:%i Tiedostonimet koodattu käyttäen IV-ketjutustilaa.
 Tiedostojärjestelmän salausalgoritmi: "%s", versio %i:%i:%i Saadaksesi lisätietoa, katso man-sivu encfs(1) Löytyi %i epäkelvollinen tiedosto. Löytyi %i epäkelvollista tiedostoa. Hakemistossa %s: 
 Virheellinen määrä argumentteja komennolle "%s" Sisäinen virhe: poikkeus pääsilmukasta: %s Sisäinen virhe: odottamaton poikkeus Sisäinen virhe: ohjelmaa ei voitu suorittaa Sisäinen virhe: fork() epäonnistui Sisäinen virhe: socketpair() epäonnistui Epäkelvollinen salasana
 Virheellinen valinta. Avainkoko: %i bittiä MAC-vertailu epäonnistui lohkossa %li MAC-vertailu epäonnistui, kieltäydytään lukemasta Manuaaliset asetukset valittu. Yksi tai useampi argumentti puuttuu, keskeytetään. Nimen koodauksen käyttöliittymää ei tueta Uusi EncFS-salasana:  Huomio: pyydettiin yksisäikeistä tilaa, mutta määritettiin
joutilaanaolon aikakatkaisu. Tiedostojärjestelmä tulee 
toimimaan yksisäikeisesti, mutta säikeitä käytetään silti
joutilaisuuden tarkistamiseen. Nyt sinun täytyy syöttää salasana tiedostojärjestelmääsi varten.
Sinun tarvitsee muistaa tämä salasana, sillä minkäänlaista
palautusmekanismia ei ole. Salasanan voi kuitenkin vaihtaa
myöhemmin käyttäen encfsctl:ää.

 Vainoharhaiset asetukset valittu. Salasanat eivät täsmänneet, ole hyvä ja yritä uudelleen
 Ole hyvä ja valitse yksi seuraavista optioista:
 kirjoita "x" valitaksesi eksperttitilan,
 kirjoita "p" valitaksesi esiasennetun vainoharhaisen tilan,
 mikä tahansa muu merkki tai tyhjä rivi valitsee tavanomaisen tilan.
?>  Ole hyvä ja valitse avainkoko biteissä. Valitsemasi salausalgoritmi
tukee kokoja välillä %i-%i bittiä %i bitin jaksoissa.
Esimerkiksi:  Valitse lohkokoko tavuissa. Valitsemasi salausalgoritmi
tukee kokoja välillä %i-%i tavua %i tavun jaksoissa.
Voit myös painaa enteriä valitaksesi oletuskoon (%i tavua)
 Valittu algoritmi "%s" Valittu avainkoko:  Esiasennettujen asetuksien määrittelemää salausalgoritmia ei löydetty...
Vaihdetaan manuaaliseen tilaan. Tavanomaiset asetukset valittu. Hakemistoa "%s" ei ole olemassa. Luodaanko se? (y,N)  Ulkoisen alustusvektorin ketjutusasetus on päällä. Tämä asetus estää kovien linkkien (hard link) käytön tiedostojärjestelmässä, ja ilman niitä jotkut sovellukset eivät toimi. Ainakaan sovellukset 'mutt' tai 'procmail' tunnetusti eivät toimi. Voit etsiä lisätietoja tästä ominaisuudesta encfs:n postituslistalta. Jos haluat käyttää eri asetuskonfiguraatiota, paina nyt CTRL-C keskeyttääksesi ja aloittaaksesi alusta. Pyydettyä tiedostonimen koodauksen käyttöliittymää ei ole saatavilla Seuraavat salausalgoritmit ovat käytettävissä: Seuraavat tiedoston nimen koodausalgoritmit ovat käytettävissä: Pyydetyn salausalgoritmin käyttöliittymä ei ole saatavilla
 Pyydettyä tiedoston nimen koodauksen käyttöliittymää ei ole saatavilla
 Ei kyetä luomaan hakemistoa:  Ei löydy salausalgoritmia %s, versio %i:%i:%i Ei kyetä löytämään nameio-käyttöliittymää %s, versio %i:%i:%i Ei löydetty määritettyä salausalgoritmia "%s"
 Ei voitu alustaa salattua tiedostojärjestelmää - tarkista polku.
 Ei pystytty käyttämään salausavainta %s, avainkokoa %i, lohkon kokoa %i Asetustiedostoa ei voida ladata tai tulkita
 Ei kyetä paikallistamaan liitoskohtaa, keskeytetään. Ei kyetä paikallistamaan juurihakemistoa, keskeytetään. Poistetaan liitos tiedostojärjestelmästä %s toimettomuuden takia Käyttö:
 Käyttö: %s [optiot] juuriHakemisto liitosKohta [-- [FUSE-liitosoptiot]] Käytetään tiedostojärjestelmän lohkokokona %i tavua Käytetään %i bitin avainkokoa Vahvista EncFS-salasana:  Version 3 asetustiedosto; luoja %s
 Version 4 asetustiedosto; luoja %s
 Version 5 asetustiedosto; luoja %s (revisio %i)
 Taltion avain päivitettiin onnistuneesti.
 Daemon-tilaa käytettäessä sinun täytyy käyttää absoluuttisia polkuja (alkaen '/':llä) Tyhjää salasanaa ei sallita
 hakemisto %s ei ole olemassa.
 encfs [optiot] juuriHakemisto liitosKohta -- [FUSE-liitosoptiot]
kelvolliset FUSE-liitosoptiot:
 encfs versio %s encfsctl versio %s tiedostojärjestelmän lohkokoko:  fuse epäonnistui. Yleisiä ongelmia:
 - fuse -ydinmoduuli ei ole asennettu (modprobe fuse)
 - epäkelvolliset optiot -- katso käyttöohjeet
 getopt-virhe: %i virheellinen komento: "%s" valinnalla '--public' ei ole merkitystä mikäli käyttäjä ei ole pääkäyttäjä typistysvirhe: luettiin %i tavua, osittainen lohko %i:sta 