��            �         �
     �
  ]   �
  .   ?  1   n  1   �  (   �  "   �  '        F  -   T  �   �  R         l    �     �     �  *   �  )   �          .  B   E  >   �  S   �  P       l  )   �  2   �     �  �   �  U   �  S        n     �  6   �  &  �  �     &  �  �   �     �     �     �  /   �     #  .   7  #   f     �  j   �  <     (   N  )   w  *   �  )   �  /   �  .   &     U     h  .   �  3   �  +   �  &        <  #   Z     ~     �     �  #   �  (   �  #     (   &  #   O     s  �   �  �   :      
  *   +  �   V  �        �     �  �   �     h      �   l   �       !  :   "!  ?   ]!  �  �!  :   -#  .   h#  9   �#  ?   �#  0   $  9   B$  K   |$     �$  *   �$  %   %  8   6%  ;   o%  $   �%  '   �%  *   �%  *   #&     N&  @   V&      �&  '   �&     �&     �&  '   '  '   :'  5   b'  5   �'  !   �'  M   �'  !   >(     `(  \   ~(     �(     �(      )  {   )     �)     �)  +   �)  4   �)  �  *  #   �+  |   ,  0   �,  5   �,  :   �,  ;   :-     v-  0   �-     �-  7   �-  �   .  d   �.  %   /  7  ;/     s0     �0  1   �0  -   �0     �0     1  P   51  <   �1  f   �1  �  *2     �3  3   �3  <   4     R4    j4  g   q5  ]   �5     76     T6  j   q6  Z  �6  �   78  �  %9    �:     �;  *   �;  (   <  3   ,<     `<  F   u<  6   �<     �<  �   =  D   �=  w   (>  9   �>  [   �>  5   6?  ;   l?  F   �?     �?     @  4   $@  :   Y@  .   �@  +   �@     �@  !   A     -A     FA     \A  %   vA  -   �A  +   �A  (   �A  1   B     QB    dB  �   sC  &   eD  4   �D  �   �D  �   �E     SF     cF  �   zF     3G     OG  z   oG  %   �G  =   H  ,   NH  �  {H  N   0J  5   J  A   �J  F   �J  8   >K  Z   wK  T   �K  &   'L  /   NL  /   ~L  M   �L  Z   �L  9   WM  5   �M  5   �M  :   �M     8N  N   GN  "   �N  ?   �N     �N     O  +   2O  +   ^O  :   �O  9   �O  $   �O  Z   $P  3   P     �P  n   �P     ?Q     PQ  *   dQ  �   �Q     $R     7R  5   OR  5   �R            P   S   -      ]         1          k          +            w   b   x                   6      U          V      a   "   `   '          ,   G   0   m   K      ~   =         ;          3   *       }       u   X   t   9   E   f       s                 <   	                          
       ^   :       J   v   j   H   )   y      d   Y          /   |   %   [   Q   4       F   _           n   c           {   l   r   z              Z          >   8   e       D   o   7   5           L              A   T   h   O   (      p       q   W          i           !   ?   M   g   B   C       N                  #   R   .          I   @       \   &   $       2      -- change password for volume   -- change password for volume, taking password from standard input.
	No prompts are issued.   -- decodes name and prints plaintext version   -- decodes the file and cats it to standard out   -- decrypts a volume and writes results to path   -- encodes a filename and print result   -- print version number and exit   -- show information (Default command)   -- show key   -- show undecodable filenames in the volume   --extpass=program	Use external program for password prompt

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
 Enable block authentication code headers
on every block in a file?  This adds about 12 bytes per block
to the storage requirements for a file, and significantly affects
performance but it also means [almost] any modifications or errors
within a block will be caught and will cause a read error. Enable filename initialization vector chaining?
This makes filename encoding dependent on the complete path, 
rather then encoding each path element individually. Enable filename to IV header chaining?
This makes file data encoding dependent on the complete file path.
If a file is renamed, it will not decode sucessfully unless it
was renamed by encfs with the proper key.
If this option is enabled, then hard links will not be supported
in the filesystem. Enable per-file initialization vectors?
This adds about 8 bytes per file to the storage requirements.
It should not affect performance except possibly with applications
which rely on block-aligned file io for performance. EncFS Password:  Enter current Encfs password
 Enter new Encfs password
 Enter the number corresponding to your choice:  Error creating key
 Error decoding volume key, password incorrect
 Error saving modified config file.
 Example: 
%s info ~/.crypt
 External chained IV disabled, as both 'IV chaining'
and 'unique IV' features are required for this option. Failure generating new volume key! Please report this error. File data IV is chained to filename IV.
 Filename encoding: "%s", version %i:%i:%i Filenames encoded using IV chaining mode.
 Filesystem cipher: "%s", version %i:%i:%i For more information, see the man page encfs(1) Found %i invalid file. Found %i invalid files. In directory %s: 
 Incorrect number of arguments Incorrect number of arguments for command "%s" Internal error: Caught exception from main loop: %s Internal error: Caught unexpected exception Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Invalid password
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
For example:  Remount failed Salt Size: %i bits Select a block size in bytes.  The cipher you have chosen
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
 This version of EncFS doesn't support filesystems created before 2004-08-13 Unable to create directory:  Unable to find cipher %s, version %i:%i:%i Unable to find specified cipher "%s"
 Unable to initialize encrypted filesystem - check path.
 Unable to instanciate cipher %s, key size %i, block size %i Unable to load or parse config file
 Unable to locate mount point, aborting. Unable to locate root directory, aborting. Unmounting filesystem %s due to inactivity Usage:
 Usage: %s [options] rootDir mountPoint [-- [FUSE Mount Options]] Using PBKDF2, with %i iterations Using filesystem block size of %i bytes Using key size of %i bits Verify Encfs Password:  Version 3 configuration; created by %s
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
PO-Revision-Date: 2012-09-01 10:26+0000
Last-Translator: Paulo Lopes <Unknown>
Language-Team: Portuguese <pt@li.org>
Language: pt
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2015-03-14 00:04+0000
X-Generator: Launchpad (build 17389)
X-Rosetta-Version: 0.1
   -- muda a palavra passe do volume   -- muda a palavra-passe do volume, obtendo a palavra-passe a partir da entrada standard - stdin.
	Sem emissão de prompts.   -- decifra o nome e imprime a versão em texto   -- decifra o ficheiro e mostra-o na saída standart   -- decifra um volume e escreve resultados para o caminho   -- codifica o nome de um ficheiro e apresenta o resultado   -- imprime versão e sai   -- mostrar informação (Comando por omissão)   -- mostrar chave   -- mostra nomes de ficheiros indecifráveis no volume   --extpass=program	Usar um programa externo para pedir a password

Ex: para montar em ~/crypt com armazenamento nativo em ~/.crypt :
    encfs ~/.crypt ~/crypt

   --public		actuar como sis.fich. multi-utilizador tipico
			(encfs tem de ser executado como root)
   --reverse	 	 encriptação reversa
   -v, --verbose		verboso: saída de msgs de debug do encfs
  -i, --idle=MINUTOS	Auto-desmontagem após período de inactividade
  --anykey		Não verificar se a chave correcta está a ser usada
  --forcedecode		descodifica dados mesmo se um erro for detectado
			(para sis.fich. usando cabeçalhos de bloco MAC)
  (NÃO suportado)
  (usando %i:%i:%i)
  -- Suporta tamanhos de bloco de %i até %i bytes  -- Suporta tamanhos de chave de %i a %i bits  -- tamanho do bloco %i bytes  -- tamanho da chave %i bits %s (directório raiz)
  -- exibe informação sobre o sistema de ficheiros, ou 
 -------------------------- AVISO --------------------------
 Foi encontrado um sistema de ficheiros EncFS muito antigo. 
Não é suportado nesta versão do EncFS.
 Adicionar bytes aleatórios ao cabeçalho de cada bloco?
Isto irá provocar degradação da performance, mas irá garantir
que os blocos tem diferentes códigos de autenticação. Pode ter os
mesmos benefícios se optar por usar os vectores de inicialização (VI)
por cada ficheiro, opção que não reduz a performance tanto como esta. 
Seleccione um número de bytes, desde 0 (sem bytes aleatórios) até 8:  Tamanho do Bloco: %i bytes Tamanho do Bloco: %i bytes + %i byte cabeçalho MAC Tamanho do Bloco: %i bytes, incluindo %i byte cabeçalho MAC Build: encfs versão %s Opções comuns:
  -H			mostrar opções opcionais de montagem do FUSE
  -s			desactivar modo de funcionamento multithreaded
  -f			correr em primeiro plano (não gerar daemon).
			As mensagens de erro serão enviadas para stderr
			em vez de o ser para syslog.
 Configuração %i d subversion encontrada, mas esta versão do encfs apenas suporta até à versão %i. A configuração terminou. O sistema de ficheiros a ser criado tem
as seguintes propriedades: Criando novo volume cifrado. A directoria não foi criada Cada ficheiro contém um cabeçalho de 8 bytes com dados de vector de inicialização único (VI único).
 Activar os cabeçalhos de código de autenticação de blocos
em cada bloco de um ficheiro?  Isto adiciona cerca de 12 bytes
por bloco às exigências de espaço em disco de um ficheiro e
afecta significativamente a performance mas também quer dizer
que (quase) qualquer modificação ou erros dentro de um bloco
irão causar um erro de leitura. Activar encadeamento de vector de inicialização do nome de ficheiro ?
Isto faz com que a codificação do nome do ficheiro fique dependente de
um caminho completo, em vez de cada cada elemento do caminho ser
codificado individualmente. Activar encadeamento de cabeçalho de VI do nome de ficheiro?
Isto faz com que a codificação dos dados do fich. fique dependente do seu
caminho completo. Se um ficheiro for renomeado, não irá ser descodificado
com sucesso a não ser que tenha sido renomeado pelo encfs com a chave certa.
Se esta opção estiver activada, então os atalhos rígidos não serão
suportados pelo sistema de ficheiros. Activar vectores de inicialização por cada ficheiro?
Isto adiciona cerca de 8 bytes por ficheiro aos requesitos
de espaço de armazenamento. Não afectará a performance
excepto no caso de aplicações que baseiem a sua
performance em IO de ficheiros em blocos-alinhados. Senha EncFS:  Introduza a palavra-passe actual do Encfs
 Introduza a nova palavra-passe do Encfs
 Introduza o número correspondente à sua escolha:  Erro ao criar chave
 Erro na descodificação da chave de volume, palavra-passe incorrecta
 Erro ao salvar ficheiro de configuração modificado.
 Exemplo: 
%s info ~/.crypt
 Encadeamento externo de cabeçalho VI foi desactivado !
Porque tanto a função de 'encadeamento de vector de inicialização (VI)'
como a de ' Vector de inicialização único' são requeridas por esta opção. Falha ao gerar uma nova chave de volume! Por favor relate este erro. O vector de inicialização dos dados do ficheiro está encadeado com
o vector de inicialização do nome de ficheiro.
 Codificação de nome de ficheiro: "%s", versão %i:%i:%i Nomes de ficheiros codificados usando o modo de encadeamento de vector de inicialização.
 Cifra de sistema de ficheiros: "%s", versão %i:%i:%i Para mais informações, consulte a página man do encfs(1) Encontrado %i ficheiro inválido. Encontrados %i ficheiros inválidos. No directório %s: 
 Número incorreto de argumentos Número incorrecto de argumentos para o comando "%s" Erro interno: Apanhei uma excepção no loop principal: %s Erro interno: Apanhei um excepção inesperada Erro interno: falhou execução de programa Erro interno: fork() falhou Erro interno: socketpair() falhou Palavra-passe inválida
 Selecção inválida. Tamanho da Chave: %i bits Comparação MAC falhada no bloco %li Comparação MAC falhada, recusando a leitura Modo de configuração manual seleccionada. Falta um ou mais argumentos, cancelando. Interface de codificação de nome não suportada Nova senha Encfs:  Nota: requerido modo de linha de execução única,
mas foi especificado tempo para expirar quando
inactivo. O sistema de ficheiros irá funcionar em
modo linha de execução única, mas terão de ser 
utilizadas linhas de execução para verificação 
da inactividade. Agora tem de inserir uma palavra passe para seu sistema
de ficheiros. Necessitará recordar esta palavra-passe,
porque não existe nenhum mecanismo de recuperação.
Entretanto, a palavra passe pode ser mudada mais tarde
usando o encfsctl.

 Configuração Paranóia seleccionada. As senhas não coincidem, por favor tente novamente
 Por favor escolha uma das opções que se seguem:
 introduza "x" para o modo de configuração expert,
 introduza "p" para o modo de pre-configurado de paranoia,
 Mais alguma coisa, ou uma linha vazia seleccionará o modo de configuração standard.
?>  Por favor seleccione um tamanho de chave em bits. A cifra que escolheu
suporta tamanhos de %i até %i bits em incrementos de %i bits.
Por exemplo:  Remontar falhou Tamanho Salt : %i bits Seleccione um tamanho de bloco em bytes. A cifra que escolheu
suporta tamanhos de %i até %i bytes em incrementos de %i.
Ou pressione apenas enter para o valor por omissão (%i bytes)
 Algoritmo seleccionado "%s" Tamanho de chave seleccionado:  Desculpe, incapaz de localizar a cifra para a configuração predefinida…
Seguindo para o modo de configuração manual. Configuração Standard seleccionada. A configuração carregada não é compatível com --reverse
 A directoria "%s" não existe. Criar? (y,N)  O opção de encadeamento de vector de inicialização (VI) externo foi
activada. Esta opção impede o uso de atalhos rígidos no sistema de ficheiros.Sem atalhos rígidos alguns programas podem não funcionar, como por ex.
os 'mutt' e 'procmail' que falharão de certeza. Para mais informações. consulte as  listas de correio sobre o encfs. Se quiser escolher outra configuração
prima CTRL-C agora para abortar e começar de novo. A interface de codificação do nome de ficheiro pedida não está disponível Os seguintes algoritmos de cifra estão disponíveis: Estão disponíveis os seguintes algoritmos de cifra de ficheiro: A directoria raw não pode ser uma subdirectoria do ponto de montagem. A interface da cifra pretendida  não está disponível
 Foi pedida uma interface de codificação de nome de ficheiro que não está disponível.
 Esta versão do EncFS não suporta sistemas de ficheiros criados antes de 2004-08-13 Não foi possível criar a directoria  Incapaz de encontrar cifra %s, versão %i:%i:%i Incapaz de encontrar a cifra especificada "%s"
 Incapaz de inicializar o sistema de ficheiros cifrado - verifique o caminho.
 Incapaz de criar instância a partir da cifra %s, tamanho da chave %i, tamanho do bloco %i Incapaz de abrir ou processar ficheiro de configuração
 Incapaz de encontrar o ponto de montagem, a cancelar. Incapaz de localizar o diretório de raiz, a abortar. A desmontar sistema de ficheiros %s devido à inactividade Utilização:
 Uso: %s [opções] Dir-raiz Ponto-montagem [-- [Opções da montagem do FUSE]] Usiando PBKDF2, com %i iterações Utilizando tamanho de bloco do sistema de ficheiros de %i bytes Usando chave de tamanho %i bits Confirme a senha Encfs:  Configuração da versão 3; criada por %s
 Configuração da versão 4; criada por %s
 Configuração da versão 5; criada por %s (revisão (%i)
 Configuração da Versão 6; criada por %s (revisão %i)
 Volume Key actualizada com sucesso.
 Quando especificar a modo daemon, tem de usar os caminhos absolutos (começam por “/”) Não é permitida uma password de comprimento zero
 directório %s não existe.
 encfs [options] rootDir mountPoint -- [Opções para montar o FUSE]
Opções validas para montar o FUSE são:
 encfs versão %s encfsctl versão %s tamanho do bloco do sistema de ficheiros:  FUSE falhou. Possíveis causas:
 - módulo kernel do FUSE não foi instalado (modprobe fuse)
 - opções inválidas -- leia as informações de uso
 erro do getopt: %i comando inválido: "%s" opção '--public' ignorada para utilizador não-root falha ao truncar: lidos %i bytes, bloco parcial de %i 