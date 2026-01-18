#!/bin/bash

# ==============================================================================
# Script : wp-cli.sh (Interactif)
# Auteur : Amaury aka BlablaLinux
# ==============================================================================

# --- ⚠️ CONFIGURATION À PERSONNALISER ⚠️ ---
URL_SITE="https://votre-site.com"          # L'URL de votre blog (sans / à la fin)
USER_WP="votre_login"                     # Votre nom d'utilisateur WordPress
APP_PASS="xxxx xxxx xxxx xxxx xxxx xxxx"  # Le jeton généré à l'étape 2
# -------------------------------------------

AUTH=$(echo -n "$USER_WP:$APP_PASS" | base64)

# Vérification de la présence de jq
if ! command -v jq &> /dev/null; then echo "Erreur : jq est requis." ; exit 1 ; fi

# --- Fonctions ---
list_posts() {
    clear
    echo "--- 10 DERNIERS ARTICLES ---"
    curl -s --header "Authorization: Basic $AUTH" "$URL_SITE/wp-json/wp/v2/posts?status=any&per_page=10" | jq -r '.[] | "ID: \(.id) | \(.title.rendered) [\(.status)]"'
    echo "----------------------------"
}

create_post() {
    clear
    echo "--- RÉDACTION D'UN NOUVEL ARTICLE ---"
    read -p "Titre de l'article : " title
    read -p "Contenu (texte brut) : " content
    echo "Action : 1) Publier immédiatement | 2) Enregistrer en Brouillon"
    read -p "Choix : " c
    local st="publish" ; [[ "$c" == "2" ]] && st="draft"

    JSON_TMP=$(mktemp)
    jq -n --arg ti "$title" --arg co "$content" --arg st "$st" '{title: $ti, content: $co, status: $st}' > "$JSON_TMP"

    RESPONSE=$(curl -s --request POST --url "$URL_SITE/wp-json/wp/v2/posts" --header "Authorization: Basic $AUTH" --header "Content-Type: application/json" --data-binary @"$JSON_TMP")
    rm "$JSON_TMP"

    local id=$(echo "$RESPONSE" | jq -r '.id')
    [[ "$id" != "null" ]] && echo "✅ Succès ! Article créé avec l'ID : $id" || echo "❌ Échec de la création."
    read -p "Appuyez sur Entrée pour continuer..."
}

delete_post() {
    clear ; list_posts
    read -p "Entrez l'ID de l'article à supprimer : " id
    if [[ -n "$id" ]]; then
        echo "🗑️ Suppression en cours..."
        curl -s --request DELETE --url "$URL_SITE/wp-json/wp/v2/posts/$id" --header "Authorization: Basic $AUTH" | jq -r '"✅ ID \(.id) a été déplacé vers la corbeille."'
    fi
    read -p "Appuyez sur Entrée pour continuer..."
}

# --- Menu Principal ---
while true; do
    clear
    echo "========================="
    echo "    WP-CLI MANAGER       "
    echo "========================="
    echo "1) Voir le statut global (Total articles)"
    echo "2) Lister les 10 derniers articles"
    echo "3) Créer un nouvel article / Brouillon"
    echo "4) Supprimer un article via son ID"
    echo "5) Quitter"
    echo "========================="
    read -p "Votre choix [1-5] : " choice
    case $choice in
        1) clear ; echo "📊 Statut du site :" ; curl -s --header "Authorization: Basic $AUTH" "$URL_SITE/wp-json/wp/v2/posts?status=any&per_page=1" -I | grep -i 'x-wp-total' ; read -p "Entrée..." ;;
        2) list_posts ; read -p "Appuyez sur Entrée..." ;;
        3) create_post ;;
        4) delete_post ;;
        5) exit 0 ;;
        *) echo "Choix invalide..." ; sleep 1 ;;
    esac
done
