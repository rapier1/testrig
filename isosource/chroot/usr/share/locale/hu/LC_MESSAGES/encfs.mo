��    p      �  �         p	     q	  ]   �	  .   �	  1   
  1   P
  (   �
  "   �
  '   �
  -   �
  �   $  R   �              /  *   B  )   m     �     �  B   �  >   	  S   H  P  �     �  )     2   ,     _  �   w  U   E  S   �     �       6   %     \     m     �  /   �  .   �  #        (  j   D  <   �  (   �  )     *   ?  )   j  /   �  .   �     �  .     3   5  +   i  &   �     �  #   �     �          #  #   5  (   Y  #   �  (   �  #   �     �  �     �   �      �  *   �  �   �  �   �  �   &     �     �  l   �      _  ?   �  :   �  .   �  9   *  0   d  9   �     �  *   �  4     %   L  8   r  ;   �  $   �  '     *   4  *   _     �  @   �  '   �     �       '   -  '   U  5   }  !   �  M   �  !   #      E   \   c      �      �      �   {   �      y!     �!  +   �!  4   �!  �  "  *   �#  q   $  ;   v$  >   �$  H   �$  4   :%  )   o%  =   �%  @   �%  �   &  s   �&  d  W'     �(     �(  +   �(  )   )     ?)     Y)  G   r)  >   �)  \   �)  s  V*     �+  *   �+  6   ,     B,    Z,  c   t-  B   �-  &   .  "   B.  ;   e.     �.  &   �.     �.  ,   �.  @   %/  9   f/     �/  f   �/  Z   %0  >   �0  /   �0  0   �0  3    1  *   T1  =   1     �1  +   �1  3   2  +   62  &   b2     �2  #   �2     �2     �2     �2  +   
3  ;   63  #   r3  3   �3  )   �3     �3  �   4  �   �4  *   �5  0   �5  �   6  �   7  �   �7     T8     r8  r   �8  %    9  4   &9  7   [9  4   �9  >   �9  1   :  5   9:  &   o:  ;   �:  6   �:  6   	;  _   @;  ;   �;  ;   �;  1   <  5   J<  >   �<     �<  f   �<  /   3=     c=     =  1   �=  1   �=  B   >  #   F>  O   j>  !   �>  !   �>  p   �>     o?     �?     �?  �   �?     ^@     o@  F   �@  :   �@     E           ;   ]          e   f   L   Y             H       j   X   K   !      7   '          3   B       )   F       #   _      /   =       M      8       [   Z   J   0   d       G   g   4   k   @       I   +                                "   .   A             9       W          l       Q       ^   b      %          1   ,                 T   O   $   V   -   h   \   &       i   o                   >   S              P      a   n   R       <   `   c   p   ?   D   2       :          
         	            N      (      *       6       U          5   m   C      -- change password for volume   -- change password for volume, taking password from standard input.
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
Falling through to Manual configuration mode. Standard configuration selected. The directory "%s" does not exist. Should it be created? (y,N)  The filename encoding interface requested is not available The following cipher algorithms are available: The following filename encoding algorithms are available: The requested cipher interface is not available
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
 getopt error: %i invalid command: "%s" option '--public' ignored for non-root user truncate failure: read %i bytes, partial block of %i Project-Id-Version: hu
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2007-03-05 15:55+0000
Last-Translator: Robert Biro <darthjdg@gmail.com>
Language-Team: <hu@li.org>
Language: hu
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   -- kötet jelszavának megváltoztatása   -- kötet jelszavának megváltoztatása, a jelszót a standard bemenetről olvassa.
	Bemenetre nem várakozik.   -- dekódolja a nevet és sima szövegként jeleníti meg   -- dekódolja a fáljt és hozzáfűzi a standard kimenethez   -- feloldja a kötet titkosítását és a path-ba írja az eredményt   -- kódolja a fájlnevet és kiírja az eredményt   -- verziószám kiírása és kilépés   -- információk megjelenítése (alapértelmezett parancs)   -- visszakódolhatatlan fájlnevek megjelenítése a kötetben   --extpass=PROGRAM	A PROGRAM-ot használja a jelszó bekéréshez

Például a ~/.cryp könyvtár titkosított tartalmát a ~/crypt könyvtárba felcsatolni:
encfs ~/.crypt ~/crypt

paranccsal lehet.

   --public		tipikus többfelhasználós fájlrendszerként viselkedik
			(encfs futtatása root-ként szükséges)
   -v, --verbose		beszédes mód: az encfs futási információkat közöl
-i, --idle=PERC	A PERC-ben megadott inkatív idő után automatikusan lecsatolja a kötetet
--anykey		Nem ellenőrzi, hogy a megadott kulcs helyes-e
--forcedecode		akkor is visszafejti az adatot, ha hibát észlel
			(olyan fájlrendszerekhez, amik MAC blokk fejlécet használnak)
  (NEM támogatott)
  (%i:%i:%i -t használ)
  -- Támogatott blokkméretek: %i - %i byte  -- Támogatott kulcshosszak: %i - %i bit  -- %i byte hosszú blokk  -- %i bit hosszú kulcs %s (root dir)
  -- megjeleníti a fájlrendszer információkat, vagy 
 -------------------------- FIGYELEM -------------------------
 Egy meglehetősen régi EncFS fájlrendszert találtam.
Nem támogatott ebben a verzióban.
 Legyen minden blokk fejléchez véletlenszerű byte hozzáadva?
Így csökken a teljesítmény, de biztosítja, hogy minden blokknak
más azonosító kódja legyen. Megjegyzendő, hogy ugyanezt elérheti
ha engedélyezi a fájlonkénti inicializáló vektort, ami nem hat olyan
károsan a teljesítményre. Válasszon egy számot 0 (nincs véletlen byte) és 8 között:  Blokk méret: %i byte Blokk méret: %i byte + %i byte MAC fejéc Blokk méret: %i byte, %i byte MAC fejlécet tartalmaz Build: encfs verzió %s Általános paraméterek:
  -H			megmutatja a lehetséges FUSE csatolási paramétereket
  -s			kikapcsolja a többszálú működést
  -f			az előtérben fut (nem a háttérben indul).
			A hibaüzenetek a syslog helyett az alapértelmezett
			hibakimenetre lesznek irányítva
 %i alverziójú konfigurációt találtam, de az encfs ezen verziója csak %i verzióig támogatja. A konfigurálás kész. A készűlő fájlrendszer tulajdonságai: Új titkosított kötet létrehozása. A könyvtár nem lett létrehozva. Minden fájl 8 byte fejlécet tartalmaz egyedi IV adattal.
 EncFS jelszó:  Addja meg az aktuális Encfs jelszót
 Adja meg az új Encfs jelszót
 Adja meg az ön által választott számot:  Hiba a kötet kulcsának meghatározásánál, a jelszó hibás
 Hiba a módosított konfigurációs fájl mentésénél.
 Például: 
%s info ~/.crypt
 Külső IV kikapcsolva, mivel mind az IV láncolás, mind az egyedi IV
szükséges ehhez az opcióhoz. Hiba az új kötet kulcs generálásakor! Tájékoztassa a fejlesztőt erről a hibáról. A fájl adat IV adata a fájlnév IV adatához van láncolva.
 Fájlnév titkosítás: "%s", verzió: %i:%i:%i Fájlnév titkosítás IV láncolást használ.
 Fájlrendszer titkosítás: "%s", verzió: %i:%i:%i További információk: encfs(1) man oldal %i db hibás fájlt találtam. %i db hibás fájlt találtam. A(z) %s könyvtárban: 
 Hibás paraméterszám a(z) "%s" parancshoz Internal error: Caught exception from main loop: %s Internal error: Caught unexpected exception Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Érvénytelen jelszó
 Hibás választás. Kucs méret: %i bit MAC összehasonlítási hiba a %li blokkban A MAC összehasonlítás nem sikerült, elolvasás letiltva A kézi beállítást választotta. Megszakítás, hiányzik egy vagy több paraméter. Névkódolási interfész nem támogatott Új Encfs jelszó:  Megjegyzés: egyszálú mód és az inkatív-idő figyelés is be van
kapcsolva. A fájlrendszer egyszálúként fog működni, de további
szálak kérülnek elindításra az inaktív-idő figyelésére. Önnek most be kell írnia a jelszót a fájlrendszerhez.
Jegyezze meg ezt a jelszót, mert egyáltalán
nincs semmiféle visszaállítási lehetőség.  Viszont a jelszó később
megváltoztatható az encfsctl-lel.

 A 'paranoia' konfigurációt választotta. A jelszavak nem egyeznek, kérem írja be újra
 Kérem válasszon az alábbi lehetőségek közül:
 "x" a haladó beállításokhoz,
 "p" a meghatározott beállításokat tartalmazó 'paranoia' konfigurációhoz,
 minden mással, vagy az üres sorral az alap konfigurációt választja.
?>  Kérem válasszon egy kulcshosszt bitben. A kiválasztott algoritmus 
%i - %i bit közötti kulcshosszakat enged meg
(%i bites lépésekben lehet emelni).
Például:  Kérem válasszon blokkméretet byte-okban. A kiválasztott algoritmus
%i - %i byte hosszt enged meg %i byte lépésekben.
Az alapértelmezett %i byte-hoz üssön ENTER-t
 Kiválasztott algoritmus "%s" Kiválasztott kulcshossz:  Sajnálom, nem találok titkosító algoritmust a kiválasztott konfigurációhoz...
Kézi beállításra váltok. Az alap konfigurációt választotta. A "%s" könyvtár nem létezik. Létrehozzam? (y,N)  A kért fájlnév kódolási interfész nem érhető el A következő titkosító algoritmusok érhetők el: A következő fájlnév titkosító algoritmusok érhetők el: A kért titkosító interfész nem használható
 A fájlnév titkosító interfész nem használható
 Nem lehet létrehozni a könyvtárat:  %s titkosító algoritmus nem található, verzió %i:%i:%i %s nameio interfész nem található, verzió %i:%i:%i Nem találom a megadott titkosító algoritmust, "%s"
 A titkosított fájlrendszert nem lehet inicializálni, kérem ellenőrizze az elérési utat.
 Unable to instanciate cipher %s, key size %i, block size %i Olvashatatlan vagy értelmezhetetlen konfigurációs fájl
 Megszakítás, a csatolási pont nem található. Megszakítás, a gyökér könyvtár nem található. A(z) %s fájlrendszer inaktivitás miatt lecsatolásra került Használat:
 Használat: %s [paraméterek] gyökérkönyvtár <csatolási pont> [-- [FUSE csatolási paraméterek]] A használt fájlrendszer blokk mérete %i byte Használt kulcshossz %i bit EncFS jelszó megerősítése:  3-as verziójú configuráció; készítette: %s
 4-es verziójú configuráció; készítette: %s
 5-ös verziójú configuráció; készítette: %s (változat: %i)
 Kötet kulcs sikeresen frissítve.
 Démonként mindenképpen az abszolút utat kell megadni (/ jellel kezdődően) Az üres jelszó nem megengedett
 A(z) %s könyvtár nem létezik.
 encfs [paraméterek] gyökérkönyvtár <csatolási pont> -- [FUSE-paraméterek]
Lehetséges FUSE-paraméterek:
 encfs verzió %s encfsctl verzió %s fájlrendszer blokk mérete:  A fuse hibásan futott le, lehetséges gyakori problémák:
 - a fuse kernel modul nincs telepítve (modprobe fuse)
 - hibás paraméterek -- nézze meg a hibaüzeneteket
 getopt error: %i Érvénytelen parancs: "%s" a "--public" opció figyelmen kívül hagyva nem-root felhasználónak csonkítási hiba: %i olvasott byte, a(z) %i részblokkban 