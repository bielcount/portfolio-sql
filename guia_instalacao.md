# Instalação e Uso do MariaDB no Debian 13 Trixie  
Guia completo, organizado e explicado passo a passo.

---

## 1. Atualizar o sistema  
Antes de instalar qualquer pacote, atualize o sistema para garantir versões recentes dos repositórios e evitar conflitos.

| Comando | Descrição |
|--------|-----------|
| `sudo apt update` | Atualiza a lista de pacotes disponíveis |
| `sudo apt upgrade -y` | Instala atualizações pendentes |

---

## 2. Instalar o MariaDB  
O MariaDB é um servidor SQL compatível com MySQL. Instale o servidor e o cliente para administrar bancos e usuários.

| Comando | Descrição |
|--------|-----------|
| `sudo apt install mariadb-server` | Instala o servidor MariaDB (necessário para rodar o banco) |
| `sudo apt install mariadb-client -y` | Instala o cliente para conectar no servidor |

Após instalar, o serviço geralmente inicia automaticamente.

---

## 3. Iniciar, habilitar e verificar o serviço  
Garantir que o MariaDB está ativo e configurado para iniciar junto com o sistema.

| Comando | Descrição |
|--------|-----------|
| `sudo systemctl start mariadb` | Inicia o serviço caso ainda não esteja rodando |
| `sudo systemctl enable mariadb` | Ativa o serviço para iniciar automaticamente |
| `sudo systemctl status mariadb` | Mostra o status do serviço (ativo/desativado/erros) |

---

## 4. Comandos úteis do serviço  
Esses comandos controlam o MariaDB como serviço do sistema.

| Comando | Descrição |
|--------|-----------|
| `sudo systemctl status mariadb` | Exibe status atual |
| `sudo systemctl stop mariadb` | Para completamente o servidor |
| `sudo systemctl start mariadb` | Inicia o servidor |
| `sudo systemctl restart mariadb` | Reinicia o serviço (aplica mudanças) |
| `sudo systemctl reload mariadb` | Recarrega configurações sem reiniciar |

---

## 5. Consultar bancos, tabelas e usuários  
Esses comandos são executados *dentro do console do MariaDB* após rodar `mysql -u root -p`.

| Comando | Descrição |
|--------|-----------|
| `SHOW DATABASES;` | Lista todos os bancos existentes |
| `SELECT DATABASE();` | Exibe o banco selecionado no momento |
| `SHOW TABLES;` | Lista as tabelas do banco atual |
| `SELECT user, host FROM mysql.user;` | Lista todos os usuários cadastrados |
| `SELECT CURRENT_USER();` | Mostra com qual usuário você está conectado |
| `SHOW GRANTS FOR 'username'@'host';` | Exibe os privilégios de um usuário específico |

---



## 6. Criar, remover e alterar usuários  
Gerenciamento de usuários do servidor MariaDB.

| Comando | Descrição |
|--------|-----------|
| `CREATE USER 'usuarioNovo'@'localhost' IDENTIFIED BY 'senha';` | Cria usuário válido apenas no próprio servidor |
| `CREATE USER 'novousuario'@'%' IDENTIFIED BY 'senhaSegura123';` | Cria usuário com acesso remoto de qualquer IP |
| `CREATE USER 'novousuario'@'192.168.1.100' IDENTIFIED BY 'senhaSegura123';` | Usuário com acesso somente desse IP |
| `DROP USER 'usuario'@'localhost';` | Exclui usuário |
| `ALTER USER 'usuario'@'localhost' IDENTIFIED BY 'novaSenha456';` | Troca senha do usuário |
| `RENAME USER 'antigo'@'localhost' TO 'novo'@'localhost';` | Renomeia usuário |

---

## 7. Conceder e remover privilégios  
Permissões determinam o que cada usuário pode fazer dentro de cada banco.

| Comando | Descrição |
|--------|-----------|
| `GRANT ALL PRIVILEGES ON banco.* TO 'usuario'@'localhost';` | Dá todas permissões no banco selecionado |
| `GRANT SELECT, INSERT, UPDATE ON banco.* TO 'usuario'@'localhost';` | Dá permissões específicas |
| `REVOKE ALL PRIVILEGES ON *.* FROM 'usuario'@'localhost';` | Remove todas as permissões de um usuário |

Após qualquer alteração de privilégios, é recomendado aplicar:


---

## 8. Conectar ao MariaDB via terminal  
A administração do servidor é feita pelo cliente `mysql`.

| Comando | Descrição |
|--------|-----------|
| `mysql -u root -p` | Entra como root e pede senha |
| `mysql -u usuario -p` | Conecta com um usuário específico |
| `mysql -u novousuario -p -D nome_banco` | Já conecta selecionando um banco |
| `USE nome_do_banco;` | Muda para o banco desejado |
| `STATUS;` | Exibe informações da sessão |
| `EXIT;` | Sai do console do MariaDB |

## 9 comandos de backup
| Comando | Descrição |
|--------|-----------|
| `mariadb-dump -u usuario -p bancoAlvo > nomeBkp.sql` | faz o backup do banco inteiro |
| `mariadb-dump -u usuario -p bancoAlvo colunaA > nomeBkpColA.sql` | cria backup de tabelas especificas de um banco |
| `mariadb -u usuario -p banco < clients.sql` | restaura o backup ao banco |

---

## 10. Fluxo recomendado para criar um banco e usuário  
Processo completo para criar um ambiente mínimo de uso.

| Comando | Descrição |
|--------|-----------|
| `CREATE USER 'meuuser'@'localhost' IDENTIFIED BY 'minhaSenha123';` | Cria usuário padrão |
| `CREATE DATABASE meudb;` | Cria o banco de dados |
| `GRANT ALL PRIVILEGES ON meudb.* TO 'meuuser'@'localhost';` | Dá acesso total ao usuário apenas no banco |
| `FLUSH PRIVILEGES;` | Atualiza permissões |
| `SHOW GRANTS FOR 'meuuser'@'localhost';` | Mostra se o usuário está configurado corretamente |
| `EXIT;` | Encerra |

---
