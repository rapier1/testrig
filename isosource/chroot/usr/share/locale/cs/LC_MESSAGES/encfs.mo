��    H      \  a   �            !  .   A  '   p  -   �      �     �     �  *     )   7     a     y  >   �  P  �      	  )   5	  2   _	  �   �	  U   `
  S   �
     
     )  6   @     w  /   �  #   �  <   �  (     )   B  *   l  )   �  /   �  .   �  .      3   O  +   �  &   �     �  #   �          +  #   =  #   a     �      �  �   �  �   �       �        �     �  l   �      S  ?   t  :   �  .   �  9     K   X     �  *   �  %   �  8     ;   K  '   �     �     �  '   �  5   	  !   ?  !   a     �     �    �     �  4   �  *   	  8   4  #   m     �     �  -   �  .   �          4  A   P  `  �     �  3     ;   ?  �   {  [   z  g   �  '   >     f  W   �     �  .   �  >     @   Y  `   �  1   �  F   -  2   t  0   �  W   �  ,   0  B   ]  1   �  ,   �  "   �  (   "      K      \      w   1   �      �      �   �   �   �   �!     K"  �   e"     #     ,#  b   G#     �#  A   �#  ;   $  4   H$  F   }$  M   �$     %  $   .%  #   S%  I   w%  G   �%  >   	&  '   H&     p&  "   �&  .   �&  )   �&     '     ('  &   7'     A   1       /   ?      0       =              8               9   G   
   7         #                           6             *      %       H          >   	      ;   E   "      2       B                   $         C       )              -   (      +   ,   '   .                 &   3                   5             <       @      !   D   :   F   4         -- change password for volume   -- decodes name and prints plaintext version   -- show information (Default command)   -- show undecodable filenames in the volume   --reverse		reverse encryption
  (NOT supported)
  (using %i:%i:%i)
  -- Supports block sizes of %i to %i bytes  -- Supports key lengths of %i to %i bits  -- block size %i bytes  -- key length %i bits -------------------------- WARNING --------------------------
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
 EncFS Password:  Enter the number corresponding to your choice:  Error saving modified config file.
 Failure generating new volume key! Please report this error. File data IV is chained to filename IV.
 Filename encoding: "%s", version %i:%i:%i Filenames encoded using IV chaining mode.
 Filesystem cipher: "%s", version %i:%i:%i For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. Incorrect number of arguments for command "%s" Internal error: Caught exception from main loop: %s Internal error: Caught unexpected exception Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Invalid selection. Key Size: %i bits Manual configuration mode selected. Name coding interface not supported New Encfs Password:  Paranoia configuration selected. Please choose from one of the following options:
 enter "x" for expert configuration mode,
 enter "p" for pre-configured paranoia mode,
 anything else, or an empty line will select standard mode.
?>  Please select a key size in bits.  The cipher you have chosen
supports sizes from %i to %i bits in increments of %i bits.
For example:  Remount failed Select a block size in bytes.  The cipher you have chosen
supports sizes from %i to %i bytes in increments of %i.
Or just hit enter for the default (%i bytes)
 Selected algorithm "%s" Selected key size:  Sorry, unable to locate cipher for predefined configuration...
Falling through to Manual configuration mode. Standard configuration selected. The directory "%s" does not exist. Should it be created? (y,N)  The filename encoding interface requested is not available The following cipher algorithms are available: The following filename encoding algorithms are available: This version of EncFS doesn't support filesystems created before 2004-08-13 Unable to create directory:  Unable to find cipher %s, version %i:%i:%i Unable to find specified cipher "%s"
 Unable to initialize encrypted filesystem - check path.
 Unable to instanciate cipher %s, key size %i, block size %i Using filesystem block size of %i bytes Using key size of %i bits Verify Encfs Password:  Version 4 configuration; created by %s
 Version 5 configuration; created by %s (revision %i)
 Volume Key successfully updated.
 Zero length password not allowed
 encfs version %s filesystem block size:  Project-Id-Version: Encrypted Filesystem for Linux
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2010-09-20 17:26+0000
Last-Translator: Roman Horník <Unknown>
Language-Team: Czech <cs@li.org>
Language: cs
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=3; plural=(n==1) ? 0 : (n>=2 && n<=4) ? 1 : 2;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   -- změnit heslo svazku   -- dekóduje jméno a ukáže jeho čitelnou verzi   -- zobraz informace (Výchozí příkaz)   -- ukázat nedekódovatelné názvy souborů ve svazku   --reverse		zpětné šifrování
  (NEPODPOROVÁNO)
  (používá %i:%i:%i)
  -- Podporuje délku bloku od %i do %i bajtů  -- Podporuje délku klíče od %i do %i bitů  -- délka bloku %i bajtů  -- délka klíče %i bitů -------------------------- VAROVÁNÍ --------------------------
 Přidat náhodné bajty ke všem hlavičkám bloku?
Dojde ke snížení výkonu, ale bude zajištěno, že bloky
budou mít rozdílné autentizační kódy.
Téhož efektu, avšak s nižším snížením výkonu,
lze dosáhnout povolením inicializačních vektorů
pro jednotlivé soubory. 
Zvolte počet bajtů, od 0 (žádné náhodné bajty) do 8:  Délka bloku: %i bajtů Velikost bloku: %i bajtů + %i bajtů hlavičky MAC Délka bloku: %i bajtů, včetně %i-bajtové hlavičky MAC Běžné volby:
  -H			Ukázat volitelné přepínače FUSE
  -s			Zakázat operace ve více vláknech
  -f			Spustit na popředí (nezavádět démona).
			Chybová hlášení budou vypisována na obrazovku
			místo do systémového souboru záznamů.
 Podverze %i konfigurace nalezena, avšak tato verze "encfs" podporuje pouze podverze do %i. Konfigurace dokončena. Souborový systém, který bude vytvořen,
bude mít následující vlastnosti: Vytvářím nový zašifrovaný svazek. Adresář nebyl vytvořen. Každý soubor obsahuje 8-bajtovou hlavičku s jedinečným inicializačním vektorem.
 Heslo pro EncFS:  Vložte číslo odpovídaící vaší volbě:  Chyba při ukládání změněného konfiguračního souboru.
 Nelze vytvořit nový klíč svazku! Oznamte prosím tuto chybu. Inicializační vektor obsahu souboru je zřetězen s inicializačním vektorem jména souboru.
 Kódování názvu souborů: "%s", verze %i:%i:%i Jména souborů zakódována řetězením inicializačních vektorů.
 Šifra souborového systému: "%s", verze %i:%i:%i Více informací získáte v manuálu "encfs(1)" Nalezen %i chybný soubor. Nalezeny %i chybné soubory. Nalezeno %i chybných souborů. Nesprávný počet parametrů příkazu "%s" Interní chyba: zachycena výjimka vyvolaná v hlavní smyčce: %s Interní chyba: zachycena neočekávaná výjimka Interní chyba: spuštění programu selhalo Interní chyba: selhání "fork()" Interní chyba: selhání "socketpair()" Neplatná volba. Velikost klíče: %i bitů Zvolena ruční konfigurace Rozhraní pro kódování jmen není podporováno Nové heslo pro EncFS:  Zvolena paranoidní konfigurace Vyberte prosím jednu z následujících voleb:
"x" pro expertní režim konfigurace,
"p" pro přednastavený režim "paranoia",
cokoliv jiného (včetně prázdné řádky) zvolí standardní režim.
?>  Prosím zvolte velikost klíče v bitech. Zvolená šifra
podporuje velikost od %i bitů do %i bitů s krokem %i bitů.
Např.:  Znovu připojení selhalo Prosím zvolte velikost bloku v bajtech. Zvolená šifra
podporuje velikosti od %i bajtů do %i bajtů s krokem %i.
Stisknutím "Enter" zvolíte výchozí hodnotu (%i bajtů)
 Zvolen algoritmus "%s" Zvolená velikost klíče  Šifra pro předdefinovanou konfiguraci nenalezena...
Přecházím do režimu ruční konfigurace. Zvolena standardní konfigurace Adresář "%s" neexistuje, má být vytvořen? ("y"-ano, "N"-ne)  Požadované rozhraní pro kódování jmen není dostupné Následující šifrovací algoritmy jsou dostupné: Následující algoritmy kódování názvů souborů jsou dostupné : Tato verze EncFS nepodporuje souborové systémy vytvořené před 13.08.2004 Nelze vytvořit adresář:  Šifra %s, verze %i:%i:%i nenalezena Nemohu najít určenou šifru "%s"
 Nelze inicializovat zašifrovaný systém souborů - zkontrolujte cestu.
 Nelze vytvořit šifru %s s velikostí klíče %i a velikostí bloku %i Pro souborový systém používám bloky o velikosti %i bajtů Používám klíč o velikosti %i bitů Zopakujte heslo pro EncFS:  Konfigurace verze 4; vytvořil %s
 Konfigurace verze 5; vytvořil %s (revize %i)
 Klíč svazku úspěšně aktualizován.
 Prázdné heslo není povoleno
 encfs verze %s Velikost bloku souborového systému:  