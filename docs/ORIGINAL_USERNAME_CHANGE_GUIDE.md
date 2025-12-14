# Guia de Mudança de Nome de Usuário
Data: 2025-06-02 02:31

## ⚠️ IMPORTANTE: Faça backup antes de prosseguir
1. Backup automático dos arquivos de diagnóstico será criado em:
   C:\Users\João\Desktop\DIAGNOSTIC_BACKUP_BEFORE_USERNAME_CHANGE

## 🔄 Passos para Mudar o Nome de Usuário

1. Abrir 'Configurações do Windows':
   - Pressione Win + I
   - Ou pesquise por 'Configurações' no menu Iniciar

2. Navegar para:
   - Contas > Suas informações
   - Clique em 'Gerenciar minha conta da Microsoft'
   - Entre em sua conta se necessário
   - Altere o nome de exibição para 'JX'

3. Para mudar o nome da pasta do usuário:
   a. Criar novo usuário administrador temporário:
      - Configurações > Contas > Família e outros usuários
      - Adicionar outra pessoa a este PC
      - Criar conta com privilégios de administrador
      - Nome sugerido: 'Admin_Temp'

   b. Fazer logoff e entrar com a conta temporária

   c. Renomear a pasta do usuário:
      - Abrir PowerShell como Administrador
      - Executar:
        `powershell
        # Certifique-se de que o usuário original está desconectado
        Rename-Item 'C:\Users\João' 'C:\Users\JX'
        `

   d. Atualizar o registro:
      - Abrir regedit
      - Navegar para: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList
      - Localizar o SID correto (verificar o ProfileImagePath)
      - Atualizar o ProfileImagePath para o novo caminho

4. Fazer logoff da conta temporária e entrar com sua conta

5. Verificar se tudo está funcionando:
   - Testar acesso aos arquivos
   - Verificar se os programas abrem normalmente
   - Confirmar se o caminho está correto

6. Depois que tudo estiver funcionando:
   - Remover a conta temporária
   - Verificar as variáveis de ambiente
   - Atualizar quaisquer scripts que referenciam o caminho antigo

## 🔍 Backup Atual
Criando backup dos arquivos de diagnóstico...
## 📊 Informações do Sistema Atual


WindowsProductName         : Windows 10 Pro
WindowsVersion             : 2009
OsHardwareAbstractionLayer : 10.0.26100.1





## 🔍 Caminhos Importantes a Serem Atualizados
1. PYTHONPATH atual: 
2. Path do usuário: C:\Program Files\Python311\Scripts\;C:\Program Files\Python311\;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\Users\João\.cargo\bin;C:\Users\João\AppData\Local\Microsoft\WindowsApps;;C:\Users\João\AppData\Roaming\Python\Python311\Scripts;C:\Users\João\AppData\Roaming\npm;C:\Users\João\AppData\Local\Programs\Microsoft VS Code\bin

## 📝 Checklist Pré-Mudança
- [ ] Fechar todos os programas
- [ ] Fazer backup completo dos dados
- [ ] Verificar se há espaço suficiente no disco
- [ ] Desativar o ambiente virtual Python
- [ ] Fechar todas as janelas do terminal
- [ ] Fazer logoff de todas as contas (Microsoft, Git, etc)

## ⚠️ Considerações Especiais
1. Projetos em andamento:
   - EON-LAB/EON-FRAMEWORK
   - VIREON
   - SYMBIOTIC_METHOD

2. Após a mudança, será necessário:
   - Reconfigurar o ambiente virtual Python
   - Atualizar caminhos em arquivos de configuração
   - Verificar integrações com WSL
   - Testar todas as ferramentas de desenvolvimento

## 🔄 Ordem de Atualização Recomendada
1. Sistema Windows
2. Ambiente Python
3. Configurações Rust
4. Integrações WSL
5. Configurações Docker
6. Ambiente de desenvolvimento

