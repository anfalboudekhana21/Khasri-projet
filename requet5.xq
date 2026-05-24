(: Q5 - Membres d'une catégorie donnée (variable) :)
let $categorie_libelle := "Intelligence Artificielle"
let $cat := doc("club.xml")//categorie[@libelle = $categorie_libelle]
let $membres := doc("club.xml")//membre[@categorieRef = $cat/@id]
for $m in $membres
order by $m/nom ascending, $m/prenom ascending
return
  <membre>
    <nom>{$m/nom/text()}</nom>
    <prenom>{$m/prenom/text()}</prenom>
    <email>{$m/email/text()}</email>
  </membre>
