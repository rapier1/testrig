��    g      T  �   �      �     �  ]   �  .   /	  1   ^	  1   �	  (   �	  "   �	  '   
  -   6
     d
     v
  *   �
  )   �
     �
     �
  B     >   P  S   �     �  )   �  2   "     U  �   m  U   ;  S   �     �       6        R     c     �  /   �  .   �  #   �       <   :  )   w  )   �  /   �  .   �     *  .   =  3   l  +   �  &   �     �  #        5     G     Z  #   l  #   �  (   �  #   �       �         �  *     �   2  �   �     �     �     �  l   �      *  :   K  ?   �  :   �  .     9   0  0   j  K   �     �  *     4   /  %   d  8   �  ;   �  $   �  '   $  *   L  *   w     �  @   �  '   �          -  '   E  '   m  5   �  5   �  !     M   #  !   q     �     �     �     �     �     �  +     4   A  4  v     �  b   �  3   .  J   b  5   �  -   �  $     #   6  5   Z     �     �  5   �  5   �     $      D   I   d   <   �   V   �      B!  5   _!  A   �!     �!  �   �!  e   �"  Z   G#  )   �#     �#  B   �#     .$      =$     ^$  0   {$  G   �$  K   �$     @%  T   ^%  ,   �%  7   �%  >   &  \   W&     �&  *   �&  =   �&  5   .'  2   d'  $   �'  3   �'     �'     (     (  "   ;(  #   ^(  0   �(  /   �(     �(  �   �(  "   �)  ;   �)    +*  m   .+  3   �+     �+     �+     ,  "   �,  :   �,  ,   �,  /   -  2   =-  <   p-  +   �-  M   �-     '.  <   G.  ;   �.  (   �.  e   �.  H   O/  G   �/  5   �/  8   0  9   O0     �0  E   �0  :   �0  '   1     >1  +   X1  +   �1  9   �1  8   �1  0   #2  e   T2     �2     �2     �2     3  "   3     73     I3  K   e3  >   �3        =          3       ^   !             P   [   '       
   F   $          V   B   O   9   W      *                   `         ;   C       /   e      X   d   (   -   +                      S   ]   R       G          H   	          c       %       a   Q   A          7      N                  "   J   Z   6   :              Y   U   ?   M   \   g       .   1      I   )   T                      b   @                 _       2                            E   &   K   f   5   8   D   >       <   0   L   ,   4      #      -- change password for volume   -- change password for volume, taking password from standard input.
	No prompts are issued.   -- decodes name and prints plaintext version   -- decodes the file and cats it to standard out   -- decrypts a volume and writes results to path   -- encodes a filename and print result   -- print version number and exit   -- show information (Default command)   -- show undecodable filenames in the volume  (NOT supported)
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
 Failure generating new volume key! Please report this error. Filename encoding: "%s", version %i:%i:%i Filesystem cipher: "%s", version %i:%i:%i For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. In directory %s: 
 Incorrect number of arguments for command "%s" Internal error: Caught exception from main loop: %s Internal error: Caught unexpected exception Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Invalid password
 Invalid selection. Key Size: %i bits MAC comparison failure in block %li Manual configuration mode selected. Missing one or more arguments, aborting. Name coding interface not supported New Encfs Password:  Now you will need to enter a password for your filesystem.
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
For example:  Remount failed Selected algorithm "%s" Selected key size:  Sorry, unable to locate cipher for predefined configuration...
Falling through to Manual configuration mode. Standard configuration selected. The configuration loaded is not compatible with --reverse
 The directory "%s" does not exist. Should it be created? (y,N)  The filename encoding interface requested is not available The following cipher algorithms are available: The following filename encoding algorithms are available: The requested cipher interface is not available
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
 encfs version %s encfsctl version %s filesystem block size:  getopt error: %i invalid command: "%s" option '--public' ignored for non-root user truncate failure: read %i bytes, partial block of %i Project-Id-Version: Encrypted Filesystem for Linux
Report-Msgid-Bugs-To: https://translations.launchpad.net/encfs/main/+pots/encfs
PO-Revision-Date: 2009-11-17 19:59+0000
Last-Translator: Piotr Strębski <strebski@o2.pl>
Language-Team: Polish <pl@li.org>
Language: pl
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=3; plural=n==1 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   -- zmień hasło dla woluminu   -- zmień hasło dla woluminu, podając je ze standardowego wejścia.
	Nie ma wydawanych komend.   -- dekoduje nazwę i wyświetla jako czysty tekst   -- odszyfrowuje zawartość pliku i wypisuje ją na standardowe wyjście   -- deszyfruje wolumin i zapisuje wynik do ścieżki   -- zaszyfrowuje nazwę pliku i wypisuje ją   -- wyświetl numer wersji i wyjdź   -- pokaż informacje (domyślnie)   -- pokaż niedekodowalne nazwy plików dla woluminu  (NIE obsługiwane)
  (używam %i%i%i)
  -- Obsługuje bloki o długości od %i do %i bajtów  -- Obsługuje klucze o długości od %i do %i bitów  -- wielkość bloku %i bajtów  -- długość klucza %i bitów %s (katalog główny)
  -- wyświetl informacje o systemie plików, lub 
 -------------------------- UWAGA --------------------------
 Znaleziono bardzo stary system plików EncFS. 
Nie jest on obsługiwany w tej wersji.
 Wielkość bloku: %i bajtów Rozmiar Bloku: %i bajtów + %i bajtów nagłówka MAC Rozmiar bloku: %i bajtów, włącznie z %i bajtami nagłówka MAC Zbudowany: encfs wersja %s Zwykłe opcje:
  -H			pokaż opcjonalne opcje montowania FUSE
  -s			wyłącz wielowątkowe operacje
  -f			uruchom jako główny proces (nie uruchamiaj daemona).
			Komunikaty błądu zostaną przesłane na stder
			zamiast do syslog-u.
 Znaleziono konfigurację poprzedniej wersji %i, lecz ta wersja "encfs" obsługuje tylko wersje do %i. Konfiguracja zakończona. Tworzony system plików
będzie miał następujące własności: Tworzenie nowego zaszyfrowanego wolumenu. Katalog nie został stworzony. Każdy plik zawiera 8-bajtowy nagłówek z unikatowymi danymi IV.
 Hasło EncFS:  Wprowadź aktualne hasło Encfs
 Wpisz nowe hasło dla Encfs
 Wpisz liczbę odpowiadającą Twojemu wyborowi:  Błąd podczas dekodowania klucza woluminu, hasło jest nieprawidłowe
 Wystąpił błąd przy zapisywaniu zmodyfikowanego pliku konfiguracyjnego.
 Przykład: 
%s info ~/.crypt
 Błąd podczas generowania nowego klucza dla woluminu! Proszę zgłosić ten błąd. Kodowanie nazwy pliku: "%s", wersja %i:%i:%i Algorytm szyfrujacy system plików: "%s", wersja %i%i%i By uzyskać więcej informacji, przejrzyj stronę man encfs(1) Znaleziono %i błędny plik. Znaleziono %i błędne pliki. Znaleziono %i błędnych plików. W katalogu %s: 
 Zła liczba argumentów dla polecenia "%s" Błąd wewnętrzny: Otrzymano wyjątek z pętli głównej: %s Błąd wewnętrzny: Otrzymano niespodziewany wyjątek Błąd wewnętrzny: nieudane uruchomienie programu Błąd wewnętrzny: fork() zawiódł Błąd wewnętrzny: nie powiodło się socketpair() Nieprawidłowe hasło
 Niepoprawna wartość. Długość klucza: %i bitów Kompresja MAC nieudana w bloku %li Wybrano Manualny tryb konfiguracji. Brak jednego lub więcej argumentów, przerywam. Brak wsparcia dla interfejsu szyfującego nazwy Nowe hasło EncFS:  Teraz musisz wprowadzić hasło dla swojego sytemu plików.
Musisz zapamiętać to hasło, ponieważ nie istnieje żaden
mechanizm odzyskujący. Jednak to hasło może być później zmienione
poprzez encfsctl.

 Wybrano konfiguracje paranoiczną. Hasła się nie zgadzają, proszę spróbować jeszcze raz
 Proszę wybrać jedną z pośród niżej podanych opcji:
 wprowadź "x" aby uruchomić tryb konfiguracji eksperta,
 wprowadź "p" aby wybrać preinstalowany tryb paranoiczny,
 jakikolwiek inny znak, lub pusta linia spowoduje wybranie trybu standardowego.
?>  Podaj rozmiar klucza w bitach. Szyfr który wybrałeś
obsługuje rozmiary od %i  do %i co %i.
Na przykład:  Nie powiodło się powtórne zamontowanie (remount) Wybrany algorytm "%s" Wybrana długość klucza:  Przepraszam, ale nie mogę zlokalizować szyfru dla zdefiniowanej konfiguracji...
Przechodzę do Manualnego trybu konfiguracji. Wybrano konfigurację standardową Załadowana konfiguracja jest niekompatybilna z --reverse
 Katalog "%s" nie istnieje. Utworzyć? (y,N)  Żądany interfejs kodujący nie jest dostępny Dostępne są następujące algorytmy szyfrowania: Dostępne są następujące algorytmy kodowania nazwy pliku: Wybrany interfejs szyfru jest niedostępny
 Ta wersja EncFS nie obsługuje systemów plików utworzonych przed 2004-08-13 Nie można stworzyć katalogu:  Nie można znaleźć modułu szyfrowania %s, wersja %i:%i:%i Nie można odnaleźć interfejsu nameio %s, wersja %i:%i:%i Nie znaleziono określonego szyfru "%s"
 Nie można zainicjalizować zaszyfrowanego systemu plików - proszę sprawdzić ścieżkę dostępu.
 Nie można zainicjować szyfru %s, rozmiar klucza: %i, rozmiar bloku: %i Nie udało się załadować lub przeanalizować pliku konfiguracyjnego
 Nie można zlokalizwać punktu montowania, przerywam. Nie można zlokalizować głównego katalogu, przerywam. Odmontowuję system plików %s z powodu braku aktywności Składnia:
 Składnia: %s [opcje] rootDir mountPoint [-- [opcje montowania FUSE]] Używanie bloku plików systemowych o rozmiarze %i bajtów Używając klucza długości %i bitów. Potwierdź hasło EncFS:  Konfiguracja wersji 3; utworzona przez: %s
 Konfiguracja wersji 4; utworzona przez: %s
 Konfiguracja wersji 5; utworzona przez: %s (poprawka %i)
 Konfiguracja wersji 6: utworzona przez %s (poprawka %i)
 Klucz woluminu został pomyślnie uaktualniony.
 Podczas specyfikacji trybu deamon należy używać ścieżek absolutnych (zaczynających się od '/') Puste hasła są zabronione
 katalog %s nie istnieje.
 encfs wersja %s encfsctl wersja %s wielkość bloku systemu plików:  błąd getopt: %i Niepoprawne polecenie: "%s" opcja '--public' jest ignorowana w przypadku uzytkowników innych niż root błąd skrócenia: przeczytano %i bajtów, częściowy blok %i 