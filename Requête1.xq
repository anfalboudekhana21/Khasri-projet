(: Q1 - Liste complète des membres avec libellé catégorie :)
<membres>
{
  for $m in doc("club.xml")//membre
  let $cat := doc("club.xml")//categorie[@id = $m/@categorieRef]
  return
    <membre id="{$m/@id}">
      <nomComplet>{string($m/prenom)} {string($m/nom)}</nomComplet>
      <email>{$m/email/text()}</email>
      <categorie>{$cat/@libelle/string()}</categorie>
    </membre>
}
</membres>
