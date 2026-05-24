(: Q2 - Liste des concours triés par date :)
<concours_liste>
{
  for $c in doc("club.xml")//concours
  let $cat := doc("club.xml")//categorie[@id = $c/@categorieRef]
  order by $c/@date ascending
  return
    <concours>
      <titre>{$c/titre/text()}</titre>
      <date>{string($c/@date)}</date>
      <coefficient>{string($c/@coefficient)}</coefficient>
      <categorie>{$cat/@libelle/string()}</categorie>
    </concours>
}
</concours_liste
