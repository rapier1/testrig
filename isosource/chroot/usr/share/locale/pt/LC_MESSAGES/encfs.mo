��    S      �  q   L             .   1  1   `  1   �  (   �  "   �  '     -   8  �   f      �     	     0	  *   C	  )   n	     �	     �	  B   �	  >   

  0   I
  S   z
  P  �
       )   4  2   ^  -   �  U   �  S        i     �     �     �     �  /   �  #        <  .   X  (   �     �  .   �  &   �       #   7     [     m     �  #   �     �  2   �      �  *     �   J  �        �  �   �     I     a      u  :   �  ?   �  .     9   @  0   z  K   �     �  *     %   ?  8   e  $   �     �  '   �     �       '   %  '   M  5   u  !   �  !   �     �  \        j     ~     �  �  �  #   �  0   �  5   �  :     9   N     �  0   �  7   �  �     %   �     �     �  1   �  -   .     \     z  O   �  <   �  B   $  f   g  �  �     V  3   q  <   �  M   �  g   0  ]   �     �           ,   *   :   (   e   3   �   6   �      �   F   !  C   \!     �!  4   �!  +   �!     "  !   2"     T"     m"     �"  +   �"     �"  <   �"  &   #  4   @#  �   u#  �   s$     %  �   %     �%     �%  %   &  =   2&  -   p&  5   �&  A   �&  8   '  T   O'     �'  /   �'  /   �'  M   #(  9   q(     �(  ?   �(     �(     )  +   3)  +   _)  :   �)  $   �)  3   �)     *  n   <*     �*  *   �*     �*     P          L   Q          O      +   &              .   C                     D          A          B                   '       !   	   (   "                ;          <      6         2      F          @          :       9   G   $              N         /   1   )      M   %      4   =   7   0   I             *   R       8   5       #           ,   S       -   ?   H      J   
      K   E                   3      >      -- change password for volume   -- decodes name and prints plaintext version   -- decodes the file and cats it to standard out   -- decrypts a volume and writes results to path   -- encodes a filename and print result   -- print version number and exit   -- show information (Default command)   -- show undecodable filenames in the volume   --extpass=program	Use external program for password prompt

Example, to mount at ~/crypt with raw storage in ~/.crypt :
    encfs ~/.crypt ~/crypt

   --reverse		reverse encryption
  (NOT supported)
  (using %i:%i:%i)
  -- Supports block sizes of %i to %i bytes  -- Supports key lengths of %i to %i bits  -- block size %i bytes  -- key length %i bits %s (root dir)
  -- displays information about the filesystem, or 
 -------------------------- WARNING --------------------------
 --reverse specified, not using unique/chained IV A really old EncFS filesystem was found. 
It is not supported in this EncFS build.
 Add random bytes to each block header?
This adds a performance penalty, but ensures that blocks
have different authentication codes.  Note that you can
have the same benefits by enabling per-file initialization
vectors, which does not come with as great of performance
penalty. 
Select a number of bytes, from 0 (no random bytes) to 8:  Block Size: %i bytes Block Size: %i bytes + %i byte MAC header Block Size: %i bytes, including %i byte MAC header Block encoding, hides file name size somewhat Config subversion %i found, but this version of encfs only supports up to version %i. Configuration finished.  The filesystem to be created has
the following properties: Creating new encrypted volume. Directory not created. EncFS Password:  Enter current Encfs password
 Enter new Encfs password
 Enter the number corresponding to your choice:  Error saving modified config file.
 Example: 
%s info ~/.crypt
 Found %i invalid file. Found %i invalid files. Found config file %s, but failed to load In directory %s: 
 Incorrect number of arguments for command "%s" Internal error: failed to exec program Internal error: fork() failed Internal error: socketpair() failed Invalid password
 Invalid selection. Key Size: %i bits Manual configuration mode selected. New Encfs Password:  Paranoia configuration not supported for --reverse Paranoia configuration selected. Passwords did not match, please try again
 Please choose from one of the following options:
 enter "x" for expert configuration mode,
 enter "p" for pre-configured paranoia mode,
 anything else, or an empty line will select standard mode.
?>  Please select a key size in bits.  The cipher you have chosen
supports sizes from %i to %i bits in increments of %i bits.
For example:  Remount failed Select a block size in bytes.  The cipher you have chosen
supports sizes from %i to %i bytes in increments of %i.
Or just hit enter for the default (%i bytes)
 Selected algorithm "%s" Selected key size:  Standard configuration selected. The configuration loaded is not compatible with --reverse
 The directory "%s" does not exist. Should it be created? (y,n)  The following cipher algorithms are available: The following filename encoding algorithms are available: The requested cipher interface is not available
 This version of EncFS doesn't support filesystems created before 2004-08-13 Unable to create directory:  Unable to find cipher %s, version %i:%i:%i Unable to find specified cipher "%s"
 Unable to initialize encrypted filesystem - check path.
 Unable to load or parse config file
 Usage:
 Using filesystem block size of %i bytes Using key size of %i bits Verify Encfs Password:  Version 3 configuration; created by %s
 Version 4 configuration; created by %s
 Version 5 configuration; created by %s (revision %i)
 Volume Key successfully updated.
 Zero length password not allowed
 directory %s does not exist.
 encfs [options] rootDir mountPoint -- [FUSE Mount Options]
valid FUSE Mount Options follow:
 encfsctl version %s filesystem block size:  invalid command: "%s" Project-Id-Version: encfs
Report-Msgid-Bugs-To: vgough@pobox.com
POT-Creation-Date: 2010-11-18 00:12-0800
PO-Revision-Date: 2008-02-14 18:28+0000
Last-Translator: PostScript <Unknown>
Language-Team: Portuguese <pt@li.org>
Language: pt
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2010-06-17 04:44+0000
X-Generator: Launchpad (build Unknown)
X-Rosetta-Version: 0.1
   -- muda a palavra passe do volume   -- decifra o nome e imprime a versão em texto   -- decifra o ficheiro e mostra-o na saída standart   -- decifra um volume e escreve resultados para o caminho   -- codifica o nome de um ficheiro e imprime o resultado   -- imprime versão e sai   -- mostrar informação (Comando por omissão)   -- mostra nomes de ficheiros indecifráveis no volume   --extpass=program	Usar um programa externo para pedir a password
Exemplo, para montar em ~/crypt com armazenamento nativo em ~/.crypt :
encfs ~/.crypt ~/crypt

   --reverse	 	 encriptação reversa
  (NÃO suportado)
  (usando %i:%i:%i)
  -- Suporta tamanhos de bloco de %i até %i bytes  -- Suporta tamanhos de chave de %i a %i bits  -- tamanho do bloco %i bytes  -- tamanho da chave %i bits %s (directório raiz)
  -- exibe informação sobre o sistema de arquivos, ou 
 -------------------------- AVISO --------------------------
 --reverse especificado, IV único/encadeado não está a ser usado Foi encontrado um sistema de ficheiros EncFS muito antigo. 
Não é suportado nesta versão do EncFS.
 Adicionar bytes aleatórios no cabeçalho de cada bloco?
Isto vai provocar uma penalização na performance, mas garante que os blocos
tem códigos diferentes de autenticação. Pode ter 
os mesmos benefícios se seleccionar os vectores de inicialização
por ficheiro, o que não traz uma penalização
 tão grande. 
Seleccione um número de bytes, desde 0 (sem bytes aleatórios) até 8:  Tamanho do Bloco: %i bytes Tamanho do Bloco: %i bytes + %i byte cabeçalho MAC Tamanho do Bloco: %i bytes, incluindo %i byte cabeçalho MAC Codificação em bloco, esconde o tamanho do nome do ficheiro de alguma forma Configuração %i d subversion encontrada, mas esta versão do encfs apenas suporta até à versão %i. A configuração terminou. O sistema de ficheiros a ser criado tem
as seguintes propriedades: Criando novo volume cifrado. Directório não criado. Senha EncFS:  Introduza a palavra-passe actual do Encfs
 Introduza a nova palavra-passe do Encfs
 Introduza o número correspondente à sua escolha:  Erro ao salvar ficheiro de configuração modificado.
 Exemplo: 
%s info ~/.crypt
 Encontrado %i ficheiro inválido. Encontrados %i ficheiros inválidos. Ficheiro de configuração %s encontrado, mas o carregamento falhou No directório %s: 
 Número incorrecto de argumentos para o comando "%s" Erro interno: falhou execução de programa Erro interno: fork() falhou Erro interno: socketpair() falhou Palavra-passe inválida
 Selecção inválida. Tamanho da Chave: %i bits Modo de configuração manual seleccionada. Nova senha Encfs:  A configuração de Paranoia não é suportada por --reverse Configuração Paranóia seleccionada. As senhas não coincidem, por favor tente novamente
 Por favor escolha uma das opções que se seguem:
 introduza "x" para o modo de configuração expert,
 introduza "p" para o modo de pre-configurado de paranoia,
 Mais alguma coisa, ou uma linha vazia seleccionará o modo de configuração standard.
?>  Por favor seleccione um tamanho de chave em bits. A cifra que escolheu
suporta tamanhos de %i até %i bits em incrementos de %i bits.
Por exemplo:  Remontar falhou Seleccione um tamanho de bloco em bytes. A cifra que escolheu
suporta tamanhos de %i até %i bytes em incrementos de %i.
Ou pressione apenas enter para o valor por omissão (%i bytes)
 Algoritmo seleccionado "%s" Tamanho de chave seleccionado:  Configuração Standard seleccionada. A configuração carregada não é compatível com --reverse
 O directório "%s" não existe. Criar? (y,n)  Os seguintes algoritmos de cifra estão disponíveis: Estão disponíveis os seguintes algoritmos de cifra de ficheiro: A interface da cifra pretendida  não está disponível
 Esta versão do EncFS não suporta sistemas de ficheiros criados antes de 2004-08-13 Incapaz de criar directório:  Incapaz de encontrar cifra %s, versão %i:%i:%i Incapaz de encontrar a cifra especificada "%s"
 Incapaz de inicializar o sistema de ficheiros cifrado - verifique o caminho.
 Incapaz de abrir ou processar ficheiro de configuração
 Utilização:
 Utilizando tamanho de bloco do sistema de ficheiros de %i bytes Usando chave de tamanho %i bits Confirme a senha Encfs:  Configuração da versão 3; criada por %s
 Configuração da versão 4; criada por %s
 Configuração da versão 5; criada por %s (revisão (%i)
 Volume Key actualizada com sucesso.
 Não é permitida uma password de comprimento zero
 directório %s não existe.
 encfs [options] rootDir mountPoint -- [Opções para montar o FUSE]
Opções validas para montar o FUSE são:
 encfsctl versão %s tamanho do bloco do sistema de ficheiros:  comando inválido: "%s" 