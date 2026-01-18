# wp-cli-bash 🌐

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Bash](https://img.shields.io/badge/Language-Bash-4EAA25.svg)](https://www.gnu.org/software/bash/)
[![WordPress API](https://img.shields.io/badge/API-WordPress%20REST-21759b.svg)](https://developer.wordpress.org/rest-api/)
[![Gitea](https://img.shields.io/badge/Mirror-Gitea-629424.svg?logo=gitea)](https://gitea.blablalinux.be/blablalinux/wp-cli-bash)

**[FR]** Une interface interactive simple en Bash pour gérer votre blog WordPress directement depuis le terminal via l'API REST.

**[EN]** A simple interactive Bash interface to manage your WordPress blog directly from the terminal using the REST API.

---

## 🇫🇷 Français

### Présentation

Ce script permet d'interagir avec WordPress sans navigateur. Il est idéal pour les administrateurs système et les passionnés de ligne de commande qui souhaitent lister, créer ou supprimer des articles rapidement.

### Fonctionnalités

* **Statut global :** affiche le nombre d'articles et les commentaires en attente.
* **Listing :** affiche les 10 derniers articles (publiés et brouillons).
* **Création :** publie instantanément ou enregistre en brouillon.
* **Suppression :** mise à la corbeille via l'ID de l'article.

### Documentation complète

Un guide d'installation pas à pas et de configuration est disponible sur le Wiki :
👉 **[Documentation wp-cli (Wiki)](https://wiki.blablalinux.be/fr/gestion-wordpress-terminal-wp-cli)**

---

## 🇺🇸 English

### Overview

This script allows you to interact with WordPress without a browser. It is perfect for sysadmins and terminal enthusiasts who want to list, create, or delete posts quickly.

### Features

* **Global Status:** display total post count and pending comments.
* **Listing:** show the last 10 posts (including published and drafts).
* **Creation:** instant publishing or save as draft.
* **Deletion:** move posts to trash via ID.

### Full Documentation

A complete step-by-step installation and configuration guide is available on the Wiki (French):
👉 **[wp-cli Documentation (Wiki)](https://wiki.blablalinux.be/fr/gestion-wordpress-terminal-wp-cli)**

---

## 📂 Sources & Miroirs

Le projet est hébergé sur deux plateformes. Choisissez votre source préférée :

* **Gitea (Principal) :** [gitea.blablalinux.be/blablalinux/wp-cli-bash](https://gitea.blablalinux.be/blablalinux/wp-cli-bash)
* **GitHub (Miroir) :** [github.com/blablalinux/wp-cli-bash](https://github.com/anyblabla/wp-cli-bash)

## 🛠️ Installation

Préparez votre dossier de scripts et téléchargez le fichier via l'une des commandes ci-dessous :

```bash
mkdir -p ~/Scripts && cd ~/Scripts

# Option A : Depuis Gitea (BlablaLinux)
curl -O https://gitea.blablalinux.be/blablalinux/wp-cli-bash/raw/branch/main/wp-cli.sh

# Option B : Depuis GitHub
curl -O https://raw.githubusercontent.com/blablalinux/wp-cli-bash/main/wp-cli.sh

# Rendre le script exécutable
chmod +x wp-cli.sh

```

## ⚖️ License

Distribué sous licence **GNU GPL v3.0**. Voir le fichier `LICENSE` pour plus de détails.

**Auteur :** Amaury aka BlablaLinux - [blablalinux.be](https://link.blablalinux.be)
