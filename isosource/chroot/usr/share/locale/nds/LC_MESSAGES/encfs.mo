��    6      �  I   |      �     �  ]   �  .     1   N  1   �  (   �  "   �  '   �  -   &  *   T  )        �     �  B   �  S     2   o     �     �     �     �       #   (     L  .   h     �  .   �  +   �     	     	     *	  �   ?	  �   
  �   �
     _     w  ?   �  .   �  K   �     F  8   c  $   �     �  '   �  '   �  '     5   A  !   w     �     �     �     �     �  4   
  �  ?  '   �  c   '  6   �  A   �  I     1   N  (   �  )   �  =   �  2     /   D     t     �  F   �  p   �  2   a     �  ,   �     �  -   �  '   (  ;   P     �  7   �     �  /   �  1   &     X     k       �   �  �   m  �   R     �       D     =   d  ^   �  $     U   &  5   |  
   �  .   �  )   �  .     7   E  .   }      �     �     �     �       0   (     '   (   ,   -                0       #          +                                6             !           2   
   .       *   /         $      3       )                     5                 1            %   "                 4   &           	                   -- change password for volume   -- change password for volume, taking password from standard input.
	No prompts are issued.   -- decodes name and prints plaintext version   -- decodes the file and cats it to standard out   -- decrypts a volume and writes results to path   -- encodes a filename and print result   -- print version number and exit   -- show information (Default command)   -- show undecodable filenames in the volume  -- Supports block sizes of %i to %i bytes  -- Supports key lengths of %i to %i bits  -- block size %i bytes  -- key length %i bits %s (root dir)
  -- displays information about the filesystem, or 
 A really old EncFS filesystem was found. 
It is not supported in this EncFS build.
 Block Size: %i bytes, including %i byte MAC header Build: encfs version %s Creating new encrypted volume. Directory not created. Enter current Encfs password
 Enter new Encfs password
 Error saving modified config file.
 Example: 
%s info ~/.crypt
 Found %i invalid file. Found %i invalid files. In directory %s: 
 Incorrect number of arguments for command "%s" Internal error: Caught unexpected exception Invalid password
 Invalid selection. New Encfs Password:  Now you will need to enter a password for your filesystem.
You will need to remember this password, as there is absolutely
no recovery mechanism.  However, the password can be changed
later using encfsctl.

 Please choose from one of the following options:
 enter "x" for expert configuration mode,
 enter "p" for pre-configured paranoia mode,
 anything else, or an empty line will select standard mode.
?>  Please select a key size in bits.  The cipher you have chosen
supports sizes from %i to %i bits in increments of %i bits.
For example:  Selected algorithm "%s" Selected key size:  The directory "%s" does not exist. Should it be created? (y,N)  The following cipher algorithms are available: This version of EncFS doesn't support filesystems created before 2004-08-13 Unable to create directory:  Unable to initialize encrypted filesystem - check path.
 Unable to load or parse config file
 Usage:
 Using filesystem block size of %i bytes Version 3 configuration; created by %s
 Version 4 configuration; created by %s
 Version 5 configuration; created by %s (revision %i)
 Volume Key successfully updated.
 directory %s does not exist.
 encfsctl version %s filesystem block size:  getopt error: %i invalid command: "%s" truncate failure: read %i bytes, partial block of %i Project-Id-Version: encfs
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2009-10-21 15:42+0000
Last-Translator: tbds <Unknown>
Language-Team: German, Low <nds@li.org>
Language: nds
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
   -- Passwort für Datenträger ändern   -- ändere das Passwort für den Datenträger. Das Passwort wird von der Standardeingabe gelesen.   -- dekodiert Namen und gibt die klartext Version aus   -- dekodiert die Datei und gibt sie auf der Standardausgabe aus   -- entschlüsselt einen Datenträger und schreibt das Ergebnis zum Pfad   -- kodiert Dateinamen und gibt das Ergebnis aus   -- gibt Versionsnummer aus und beendet   -- Zeige Informationen (Standardbefehl)   -- Zeige nicht dekodierbare Dateinamen auf dem Datenträger  -- Unterstützt Blockgrößen von %i bis %i Bytes  -- Unterstützt Key längen von %i bis %i Bits  -- Block Größe %i Bytes  -- Slötellänge %i bits %s (Stammverzeichnis)
  -- zeigt Informationen über das Dateisystem 
 Ein wirklich altes EncFS Dateisystem wurde gefunden. 
Es wird von dieser build-Version nicht mehr unterstützt.
 Blockgröte: %i bytes, insluten %i byte MAC header Erstellt: encfs Verschoon %s Erstelle neues verschlüsseltes Dateisystem. Verzeichnis nicht erstellt. Geben sie ihr derzeitiges Encfs Passwort ein
 Geben sie ein neues Encfs Passwort ein
 Fehler beim Speichern der geänderten Konfigurationsdatei.
 Beispiel: 
%s info ~/.crypt
 %i ungültige Datei funnen %i ungültige Dateien funnen Im Verzeichnis %s: 
 Ungültige Anzahl an Parameter für Befehl "%s" Interner Fehler: Unerwartete Ausnahme aufgetreten Falsches Passwort
 Ungültige Auswahl. Neues Encfs Passwort:  Jetzt musst du ein Passwort für dein Dateisystem eingeben.
Du musst dir das Passwort merken, da es keine Möglichkeit gibt es wiederherzustellen!
Es ist auch nacher möglich das Passwort mit encfsctl zu ändern.

 Bitte wähle eine der folgenden Einstellungen:
 gib "x" ein für den Experteneinstellungsmodus
 gib "p" ein für den den Voreingestellten empfohlenen modus
 alles andere, oder keine eingabe wird den Standart modus Aktivieren
?>  Bidde Slötelgröte in bits angeven. De chiffre, de je utwählt hebbst, unnerstütt Gröten vun %i bit %i Bits mit Erwietern vun %i Bits. Bispeel:  Ausgewählter Algorythmus "%s" Utwählte Slötelgröte:  Das Verzeichnis "%s" existiert nicht, soll es erstellt werden (y,N)  Die folgenden  following Chiffre Algorythmen sind verfügbar: Diese Version von EncFS unterstützt keine Dateisysteme die vor dem 13.08.2004 erstellt wurden Konnte Verzeichnis nicht erstellen:  Konnte verschlüsseltes Dateisystem nicht initialisieren, überprüfen Sie den Pfad.
 Konnte Konfigurationsdatei nicht lesen oder anwenden
 Benutung:
 Benutze Blockgröße von Dateisystem: %i Bytes Version 3 Konfiguration; erstellt von %s
 Verschoon 4 Konfiguratschoon; erstellt vun %s
 Version 5 Konfiguration; Erstellt von %s (revision %i)
 Datenträger Schlüssel erfolgreich erneuert.
 Verzeichnis %s existiert nicht.
 encfsctl Version %s Dateisystem Block Größe:  getopt Fehler: %i Ungültiger Befehl: "%s" Afsniedsfehler: Ingelesen sün %i bytes, Deel %i 