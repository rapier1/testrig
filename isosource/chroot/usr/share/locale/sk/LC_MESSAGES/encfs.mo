��    E      D  a   l      �     �  ]     .   o  1   �  1   �  (     "   +  '   N  -   v     �  *   �  )   �          #  B   :  >   }  S   �     	  U   %	  S   {	     �	     �	     
     
     4
  /   N
  #   ~
     �
  <   �
  /   �
  .   +     Z  .   m     �     �     �  #   �  (   �            5  *   V     �     �      �  ?   �  .     9   =  K   w     �  %   �  8     $   ?     d  '   l     �     �  '   �  '   �  5     !   L  M   n     �     �     �     �          (  4   >  �  s     L  ]   g  7   �  9   �  5   7  2   m  -   �  1   �  <         =  .   T  1   �     �     �  P   �  >   B  ]   �     �  [   �  U   U  *   �     �     �             &   ;  >   b     �  K   �  .   
  c   9     �  -   �     �     �       !     0   @     q  &   �  ,   �     �     �  $     8   5  1   n  @   �  X   �     :  /   Z  R   �  A   �       0   +  +   \     �  $   �  $   �  2   �  $     P   A     �     �     �  %   �     �       >        *       7                ,   3       A   !   /                 @             '                     >      C   .             &          ?      #       4             6   "      +   =   9               2   B   8      ;       %      :       )   $          (   D   E                            
   0          -                      5   	       <   1               -- change password for volume   -- change password for volume, taking password from standard input.
	No prompts are issued.   -- decodes name and prints plaintext version   -- decodes the file and cats it to standard out   -- decrypts a volume and writes results to path   -- encodes a filename and print result   -- print version number and exit   -- show information (Default command)   -- show undecodable filenames in the volume  (NOT supported)
  -- Supports block sizes of %i to %i bytes  -- Supports key lengths of %i to %i bits  -- block size %i bytes  -- key length %i bits %s (root dir)
  -- displays information about the filesystem, or 
 -------------------------- WARNING --------------------------
 A really old EncFS filesystem was found. 
It is not supported in this EncFS build.
 Block Size: %i bytes Config subversion %i found, but this version of encfs only supports up to version %i. Configuration finished.  The filesystem to be created has
the following properties: Creating new encrypted volume. Directory not created. EncFS Password:  Enter current Encfs password
 Enter new Encfs password
 Enter the number corresponding to your choice:  Error saving modified config file.
 Example: 
%s info ~/.crypt
 Failure generating new volume key! Please report this error. For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. In directory %s: 
 Incorrect number of arguments for command "%s" Invalid password
 Invalid selection. Key Size: %i bits Manual configuration mode selected. Missing one or more arguments, aborting. New Encfs Password:  Paranoia configuration selected. Passwords did not match, please try again
 Selected algorithm "%s" Selected key size:  Standard configuration selected. The directory "%s" does not exist. Should it be created? (y,N)  The following cipher algorithms are available: The following filename encoding algorithms are available: This version of EncFS doesn't support filesystems created before 2004-08-13 Unable to create directory:  Unable to find specified cipher "%s"
 Unable to initialize encrypted filesystem - check path.
 Unable to load or parse config file
 Usage:
 Using filesystem block size of %i bytes Using key size of %i bits Verify Encfs Password:  Version 3 configuration; created by %s
 Version 4 configuration; created by %s
 Version 5 configuration; created by %s (revision %i)
 Volume Key successfully updated.
 When specifying daemon mode, you must use absolute paths (beginning with '/') directory %s does not exist.
 encfs version %s encfsctl version %s filesystem block size:  getopt error: %i invalid command: "%s" truncate failure: read %i bytes, partial block of %i Project-Id-Version: encfs
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2009-10-14 15:44+0000
Last-Translator: helix84 <Unknown>
Language-Team: Slovak <sk@li.org>
Language: sk
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=3; plural=(n==1) ? 1 : (n>=2 && n<=4) ? 2 : 0;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
   -- zmeniť heslo zväzku   -- zmeniť heslo zväzku, heslo prevziať zo štandardného vstupu.
	Nevypisujú sa výzvy.   -- dekóduje názov a vypíše čisto textovú verziu   -- dekóduje súbor a pošle ho na štandardný výstup   -- dekryptuje zväzok a zapíše výsledky na cestu   -- zakóduje názov súboru a vypíše výsledok   -- vypíše informácie o verzii a skončí   -- zobraziť informácie (štandardný príkaz)   -- zobraziť na zväzku nedekódovateľbí názvy súborov  (NIEJE podporované)
  -- Podporuje veľkosti blokov %i do %i bajtov  -- Podporuje dĺžky kľúčov od %i do %i bitov  -- veľkosť bloku %i bajtov  -- dĺžka kľúča %i bitov %s (koreňový adresár)
  -- zobrazí informácie o súborovom systéme alebo 
 ------------------------- VAROVANIE -------------------------
 Bol nájdený veľmi starý súborový systém EncFS. 
Toto zostavenie EncFS ho nepodporuje.
 Veľkosť bloku: %i bytov Našlo sa nastavenie podverzie %i, ale táto verzia encfs je podporovaná len do verzie %i. Konfigurácia úspešná. Systém súborov vytvorený s
nasledujúcimi vlastnosťami: Vytváranie nového šifrovaného oddielu. Priečinok nebol vytvorený. EncFS heslo:  Vložte aktuálne Encfs heslo
 Vložte nové Encfs heslo
 Zadajte číslo podľa vačej voľby:  Chyba pri ukladaní modifikovaného konfiguračného súboru.
 Príklad: 
%s info ~/.crypt
 Zlyhalo generovanie nového kľúča zväzku! Prosím oznámte túto chybu. Pre viac informácii prezrite manuál encfs(1) Nájdený %i neplatný súbor. Nájdené %i neplatné súbory. Nájdených %i neplatných súborov. V adresári %s: 
 Nesprávny počet argumentov pre príkaz "%s" Neplatné heslo
 Nesprávny výber. Veľkosť kľúča: %i bitov Vybraná manuálna konfigurácia. Chýba jeden alebo viac argumentov, prerušené. Nové Encfs heslo:  Zvolili ste si paranoidné nastavenie. Heslá sa nezhodujú, prosím skúste znova
 Vybraný algoritmus "%s" Vybraná veľkosť kľúča:  Vybraná štadnardná konfigurácia. Priečinok "%s" neexistuje. Má byť vytvorený ? (y,N)  Sú dostupné nasledujúce šifrovacie algoritmy: Sú dostupné nasledujúce algoritmy kódovania názvu súborov: Táto verzia EncFS nepodporuje systémy súborov, ktoré boli vytvorené pred 13.08.2004 Nemožno vytvoriť priečinok:  Nepodarilo sa nájsť uvedenú šifru „%s“
 Nepodarilo sa inicializovať kryptovaný súborový systém - skontrolujte cestu.
 Nepodarilo sa načítať alebo analyzovať konfiguračný súbor
 Použitie:
 Veľkosť bloku v systéme súborov je %i bajtov Používa sa kľúč s veľkosťou %i bitov Kontrola EncFS hesla:  Konfigurácia verzie 3; vytvoril %s
 Konfigurácia verzie 4; vytvoril %s
 Konfigurácia verzie 5; vytvoril %s (revízia %i)
 Kľúč oddielu úspešne zmenený.
 Pri použití deamona musíte používať absolútne cesty (začínajúce s '/') adresár %s neexistuje.
 encfs verzia %s encfsctl verzia %s veľkosť bloku v systéme súborov:  getopt chyba: %i nesprávny príkaz: "%s" chyba skracovania: čítanie %i bajtov, čiastočný blok z %i 