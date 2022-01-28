echo "Génération de pdf..."
pandoc 4_Rapport_Final.md -o 4_Rapport_Final.pdf --from markdown --template eisvogel --listings
pandoc 4_Manuel_Utilisateur.md -o 4_Manuel_Utilisateur.pdf --from markdown --template eisvogel --listings
pandoc 4_Guide_Installation.md -o 4_Guide_Installation.pdf --from markdown --template eisvogel --listings
echo "Génération terminée avec succès !"
