echo "Génération de pdf..." 
pandoc 5_Rapport_Final.md -o 5_Rapport_Final.pdf --from markdown --template eisvogel --listings
pandoc 5_Manuel_Utilisateur.md -o 5_Manuel_Utilisateur.pdf --from markdown --template eisvogel --listings
pandoc 5_Guide_Installation.md -o 5_Guide_Installation.pdf --from markdown --template eisvogel --listings
echo "Génération terminée avec succès !"
