---
title: Comandaments bàsics de la shell Linux
layout: default
permalink: /cat-shell-linux/
---
# 🌐 Comandaments essencials per treballar a la shell de Linux

## 🧭 Navegació pel sistema de fitxers

| Comandament | Descripció | Exemple |
|--------------|-------------|----------|
| `pwd` | Mostra el directori actual. | `pwd` |
| `ls` | Llista el contingut d’un directori. | `ls -l`, `ls -a` |
| `cd` | Canvia de directori. | `cd /home/usuari`, `cd ..` |
| `tree` | Mostra l’estructura de directoris en forma d’arbre. | `tree /etc` |
| `clear` | Neteja la pantalla del terminal. | `clear` |

---

## 📂 Gestió de fitxers i directoris

| Comandament | Descripció | Exemple |
|--------------|-------------|----------|
| `cp` | Copia fitxers o carpetes. | `cp fitxer1.txt /backup/` |
| `mv` | Mou o reanomena fitxers/directoris. | `mv fitxer.txt nou_nom.txt` |
| `rm` | Esborra fitxers o carpetes. ⚠️ Irreversible. | `rm fitxer.txt`, `rm -r carpeta/` |
| `mkdir` | Crea un nou directori. | `mkdir documents` |
| `rmdir` | Elimina un directori buit. | `rmdir carpeta_buida` |
| `touch` | Crea un fitxer buit o actualitza la data de modificació. | `touch nou_fitxer.txt` |
| `cat` | Mostra el contingut d’un fitxer. | `cat notes.txt` |
| `less` / `more` | Visualitza un fitxer llarg pàgina a pàgina. | `less /etc/passwd` |
| `head` | Mostra les primeres línies d’un fitxer. | `head -n 10 log.txt` |
| `tail` | Mostra les últimes línies d’un fitxer. | `tail -f /var/log/syslog` |

---

## 🔍 Cerca i filtratge

| Comandament | Descripció | Exemple |
|--------------|-------------|----------|
| `find` | Busca fitxers/directoris segons criteris. | `find /home -name "*.txt"` |
| `grep` | Cerca text dins de fitxers. | `grep "error" log.txt` |
| `locate` | Busca fitxers a través de la base de dades `mlocate`. | `locate bashrc` |
| `which` | Mostra la ruta d’un programa. | `which python` |

---

## ⚙️ Gestió del sistema

| Comandament | Descripció | Exemple |
|--------------|-------------|----------|
| `top` | Mostra els processos actius. | `top` |
| `htop` | Versió millorada de `top` (si està instal·lat). | `htop` |
| `ps` | Mostra processos en execució. | `ps aux` |
| `kill` | Mata un procés. | `kill 1234`, `kill -9 1234` |
| `df` | Mostra l’espai lliure als discos. | `df -h` |
| `du` | Mostra l’espai ocupat per fitxers o carpetes. | `du -sh *` |
| `free` | Mostra la memòria RAM disponible. | `free -h` |
| `uptime` | Mostra quant de temps porta encès el sistema. | `uptime` |

---

## 👤 Gestió d’usuaris i permisos

| Comandament | Descripció | Exemple |
|--------------|-------------|----------|
| `whoami` | Mostra l’usuari actual. | `whoami` |
| `id` | Mostra l’ID d’usuari i grups. | `id usuari` |
| `chmod` | Canvia permisos de fitxers. | `chmod 755 script.sh` |
| `chown` | Canvia el propietari d’un fitxer. | `chown usuari:grup fitxer.txt` |
| `sudo` | Executa ordres amb privilegis d’administrador. | `sudo apt update` |
| `passwd` | Canvia la contrasenya de l’usuari. | `passwd` |

---

## 🌐 Xarxa i connexions

| Comandament | Descripció | Exemple |
|--------------|-------------|----------|
| `ping` | Comprova la connexió amb un host. | `ping google.com` |
| `ifconfig` / `ip a` | Mostra la configuració de xarxa. | `ip a` |
| `wget` | Descarrega fitxers des d’una URL. | `wget https://fitxer.com/arxiu.zip` |
| `curl` | Fa peticions HTTP i mostra el resultat. | `curl https://api.ipify.org` |
| `ssh` | Connecta a un altre host via SSH. | `ssh usuari@192.168.1.10` |
| `scp` | Copia fitxers a través de SSH. | `scp fitxer.txt usuari@servidor:/destí/` |

---

## 🧮 Redirecció i tubs (pipes)

| Comandament | Descripció | Exemple |
|--------------|-------------|----------|
| `>` | Redirigeix la sortida a un fitxer (sobreescriu). | `ls > llista.txt` |
| `>>` | Afegeix la sortida al final d’un fitxer. | `echo "Hola" >> notes.txt` |
| `<` | Llegeix l’entrada des d’un fitxer. | `sort < noms.txt` |
| `|` | Envia la sortida d’un comandament a un altre. | `ls | grep "txt"` |

---

## 🧰 Altres útils

| Comandament | Descripció | Exemple |
|--------------|-------------|----------|
| `man` | Mostra el manual d’un comandament. | `man ls` |
| `history` | Mostra l’historial d’ordres. | `history` |
| `alias` | Defineix un àlies per a un comandament llarg. | `alias ll='ls -l'` |
| `date` | Mostra o canvia la data/hora. | `date +"%d-%m-%Y %H:%M"` |
| `cal` | Mostra un calendari. | `cal 2025` |
| `echo` | Mostra text o variables. | `echo $HOME` |

---

## 💡 Consells finals

- Utilitza **tabulador** per completar noms automàticament.  
- Pots combinar ordres amb `;` o `&&` per executar-les seguidament.  
- Usa `Ctrl + C` per aturar un procés, `Ctrl+Z` per posar-lo en pausa (`bg` per reactivar-lo) i `Ctrl + L` per netejar la pantalla.  
- Consulta `man <comandament>` per obtenir informació detallada.  
