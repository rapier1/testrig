��    g      T  �   �      �     �  ]   �  .   /	  (   ^	  "   �	  '   �	  -   �	     
          !  *   4  )   _     �     �  B   �  >   �  S   :     �  )   �  2   �        �     U   �  S   <     �     �  6   �     �          ,  /   F  .   v  #   �     �  <   �  (   "  )   K  *   u  )   �  /   �  .   �     )  .   <  3   k  +   �  &   �     �  #        4     F     Y  #   k  (   �  #   �  (   �  #        )  �   >      �  *     �   <  �     �   �     ,     D      X  ?   y  :   �  .   �  9   #  ?   ]  0   �  K   �       *   7  4   b  %   �  8   �  $   �  '     *   C  *   n     �  @   �  '   �     
     $  '   <  '   d  5   �  !   �  M   �  !   2     T     r     �     �  {   �     +     <  +   R  4   ~  �  �     �  H   �  -   
  0   8  (   i  (   �  *   �  +  �     !     "!  6   8!  6   o!     �!     �!  <   �!  >   "  ]   S"     �"  +   �"  8   �"     -#  �   E#  ^   3$  V   �$     �$     %  5   %     S%     e%     �%  $   �%  4   �%  2   �%     -&  K   I&  (   �&  (   �&  2   �&  5   '  ,   P'  >   }'     �'  ,   �'  ;   �'  .   5(  +   d(      �(  &   �(     �(     �(     �(  )   )  '   =)  "   e)  )   �)  %   �)     �)  �   �)     �*  1   �*  �   �*  �   �+  �   j,     -     --     B-  /   _-  F   �-  2   �-  <   	.  8   F.  >   .  F   �.     /  4    /  ?   U/  '   �/  >   �/  4   �/  2   10  -   d0  0   �0     �0  Y   �0  -   +1  $   Y1     ~1  &   �1  &   �1  4   �1  (   2  \   F2      �2     �2     �2     �2     3  �   3     �3     �3  0   �3  .   4        ?          4       ]                 P   @   (          F   #      H   V   C   d       W   X   +   	   )             _         =   %       0   e      `   [       .   ,              g       S   \   R       G   Z      I             b       $           Q   6      ^   9      O                 !   K   '   8   <              Y   U   A   N       ;       /   2         *   T                   
   a   B                 J       3                            E   &   L   f   7   :   D       c   >   1   M   -   5      "      -- change password for volume   -- change password for volume, taking password from standard input.
	No prompts are issued.   -- decodes name and prints plaintext version   -- encodes a filename and print result   -- print version number and exit   -- show information (Default command)   -- show undecodable filenames in the volume   -v, --verbose		verbose: output encfs debug messages
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
 Block Size: %i bytes Block Size: %i bytes + %i byte MAC header Block Size: %i bytes, including %i byte MAC header Build: encfs version %s Common Options:
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
 Failure generating new volume key! Please report this error. File data IV is chained to filename IV.
 Filename encoding: "%s", version %i:%i:%i Filenames encoded using IV chaining mode.
 Filesystem cipher: "%s", version %i:%i:%i For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. In directory %s: 
 Incorrect number of arguments for command "%s" Internal error: Caught exception from main loop: %s Internal error: Caught unexpected exception Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Invalid password
 Invalid selection. Key Size: %i bits MAC comparison failure in block %li MAC comparison failure, refusing to read Manual configuration mode selected. Missing one or more arguments, aborting. Name coding interface not supported New Encfs Password:  Note: requested single-threaded mode, but an idle
timeout was specified.  The filesystem will operate
single-threaded, but threads will still be used to
implement idle checking. Paranoia configuration selected. Passwords did not match, please try again
 Please choose from one of the following options:
 enter "x" for expert configuration mode,
 enter "p" for pre-configured paranoia mode,
 anything else, or an empty line will select standard mode.
?>  Please select a key size in bits.  The cipher you have chosen
supports sizes from %i to %i bits in increments of %i bits.
For example:  Select a block size in bytes.  The cipher you have chosen
supports sizes from %i to %i bytes in increments of %i.
Or just hit enter for the default (%i bytes)
 Selected algorithm "%s" Selected key size:  Standard configuration selected. The directory "%s" does not exist. Should it be created? (y,N)  The filename encoding interface requested is not available The following cipher algorithms are available: The following filename encoding algorithms are available: The raw directory may not be a subdirectory of the mount point. The requested cipher interface is not available
 This version of EncFS doesn't support filesystems created before 2004-08-13 Unable to create directory:  Unable to find cipher %s, version %i:%i:%i Unable to find nameio interface %s, version %i:%i:%i Unable to find specified cipher "%s"
 Unable to initialize encrypted filesystem - check path.
 Unable to load or parse config file
 Unable to locate mount point, aborting. Unable to locate root directory, aborting. Unmounting filesystem %s due to inactivity Usage:
 Usage: %s [options] rootDir mountPoint [-- [FUSE Mount Options]] Using filesystem block size of %i bytes Using key size of %i bits Verify Encfs Password:  Version 3 configuration; created by %s
 Version 4 configuration; created by %s
 Version 5 configuration; created by %s (revision %i)
 Volume Key successfully updated.
 When specifying daemon mode, you must use absolute paths (beginning with '/') Zero length password not allowed
 directory %s does not exist.
 encfs version %s encfsctl version %s filesystem block size:  fuse failed.  Common problems:
 - fuse kernel module not installed (modprobe fuse)
 - invalid options -- see usage message
 getopt error: %i invalid command: "%s" option '--public' ignored for non-root user truncate failure: read %i bytes, partial block of %i Project-Id-Version: Encrypted Filesystem for Linux
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2008-01-24 09:29+0000
Last-Translator: Crash&Burn <Unknown>
Language-Team: Swedish <sv@li.org>
Language: sv
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   -- Byt lösenord för volym   -- ändra lösenord för volym, läser lösenord från standard input.   -- tolkar namnet och skriver ut textversion   -- kodar ett filnamn och skriver ut resultatet   -- skriv ut versionsnummer och avsluta   -- visa information (Standardkommando)   -- visa icke tolkbara filnamn i volymen.   -v, --verbose		verbose: skriv ut debugmeddelanden
  -i, --idle=MINUTER	Avmontera automatiskt efter den angivna perioden av 			inaktivitet
  --anykey		Verifiera inte att rätt nyckel används
  --forcedecode		Tolka data även om ett fel upptäcks
			(för filsystem som använder MAC-blockhuvuden)
  (Stöds INTE)
  använder %i:%i:%i)
  - Stödjer blockstorlekar på mellan %i till %i bytes  - Stödjer nyckellängder på mellan %i till %i bitar  - blockstorlek %i bytes  - nyckellängd %i bits %s (root dir)
  -- visar information om filsystemet, eller 
 -------------------------- VARNING --------------------------
 Ett väldigt gammalt EncFS-filsystem hittades. 
Det stöds inte av den här EncFS-versionen.
 Blockstorlek: %i bytes Block storlek: %i bytes + %i byte MAC-huvud Block storlek: %i bytes, innehållande %i byte MAC-huvud Bygge: encfs version %s Vanliga alternativ:
  -H			visa valfria FUSE monteringsalternativ.
  -s			stäng av multitrådad funktionalitet
  -f			exekvera i förgrunden (starta inte demon)
			Felmeddelanden kommer att skickas till stderr
			istället för syslog.
 Konfiguration subversion %i funnen. Denna version av encfs stöder endast upp till version %i. Konfiguration slutfördes. Filsystemet som kommer skapas har följande inställningar: Skapar ny krypterad volym. Katalogen skapades inte. Varje fil innehåller 8 byte huvud med unik IV data.
 EncFS-lösenord:  Ange nuvarande Encfs-lösenord
 Ange nytt Encfs-lösenord
 Ange numret som motsvarar ditt val:  Fel volymnyckel för avkodning, lösenord inkorrekt
 Fel vid sparande av modifierad konfigurationsfil.
 Exempel: 
%s info ~/.crypt
 Fel vid generation av ny volymnyckel! Var vänlig att rapportera detta fel. Fildata IV är kopplad till filnamn IV.
 Filnamns kodning: "%s", version %i:%i:%i Filenamn kodade genom att använda IV kedjeläge.
 Filsystemets kodningsalgoritm: "%s", version %i:%i:%i För mer information se manualsidan encfs(1) Lokaliserade %i felaktig fil. Lokaliserade %i felaktiga filer. I katalog %s: 
 Felaktigt antal argument för kommandot "%s" Internt fel: Råkade på en avvikelse från huvudloopen: %s Internt fel: Råkade på en oväntad avvikelse Internt fel: kunde inte exekvera programmet Internt fel: fork() misslyckades Internt fel: socketpair() misslyckades Felaktigt lösenord
 Ogiltigt val. Nyckelstorlek: %i bitar MAC jämförelse misslyckades i block %li MAC jämförelse fel, vägrar att läsa Manuellt konfigurationsläge valt. Saknar en eller flera argument, avbryter. Namn kodnings gränssnitt stöds inte Nytt Encfs-lösenord:  Not: begärde entrådsläge, men en idlingstid specificerades. Filsystemet kommer att arbeta med en tråd, men trådar kommer fortfarande att användas för att implementera idlingskoll. Paranoia konfiguration vald. Lösenorden matchade inte, var god försök igen
 Välj från följande inställningar:
 skriv "x" för avanserade inställningar
 skriv "p" för förvalt paranoia-inställningar
 något annat, eller tomma fält kommer automatiskt att välja sandardvärden
?>  Vänligen välj en nyckelstorlek i bitar. Krypteringsalgoritmen du har valt
stödjer storlekar från %i till %i bitar i ökningar om %i bitar.
Till exempel:  Välj en blockstorlek i bytes. Krypteringsalgoritmen du har valt
stödjer storlekar från %i till %i bytes i ökningar om %i
Eller tryck enter för standardstorlek (%i bytes)
 Vald algoritm "%s" Vald nyckelstorlek:  Standard konfiguration vald. Katalogen "%s" finns ej. Ska den skapas? (y,N)  Det begärda filnamnets kodnings gränssnitt finns inte tillgängligt. Följande krypteringsalgoritmer är tillgängliga: Följande kodningsalgoritmer för filnamn är tillgängliga: Rotmappen kan inte vara undermap till monteringspunkten. Det begärda kodnings gränssnittet finns inte tillgängligt.
 Denna verison av EncFS stödjer inte filsystem skapta innan 2004-08-13 Kunde inte skapa katalog:  Kan inte hitta kodningsalgoritm %s, version %i:%i:%i Kan inte hitta nameio-användargränssnitt %s, version %i:%i:%i Kan ej hitta specificerad chiffer "%s"
 Kunde inte initiera krypterat filsystem - granska sökvägen.
 Oförmögen att ladda eller tolka konfigurationsfil
 Kunde inte lokalisera monteringspunkten, avbryter. Kunde inte lokalisera rotkatalogen, avbryter. Avmonterar filsystem %s på grund av inaktivitet Användning:
 Användning: %s [alternativ] rootKatalog monteringsPunkt [-- [FUSE monteringsalternativ]] Använder filsystemsblockstorlek på %i bytes Använder nyckelstorlek på %i bitar Verifiera Encfs-lösenord:  Version 3 konfiguration; skapad av %s
 Version 4 konfiguration; skapad av %s
 Version 5 konfiguration; skapad av %s (revision %i)
 Volymnyckeln uppdaterades utan problem.
 När du specificerar demonläge så måste du använda absoluta sökvägar (börjar med '/') Tomt lösenord är ej tillåtet
 katalog %s existerar inte
 encfs version %s encfsctl version %s Filsystemsblockstorlek:  fuse misslyckades. Vanliga problem:
 - fusemodul för kärnan är inte installerad (modprobe fuse)
 - Ogiltiga alternativ -- se användningsmeddelandet
 getopt fel: %i Felaktigt kommando: "%s" val '--public' ignorerat för ej-root användare trunkeringsfel: läst %i bytes, delblock av %i 