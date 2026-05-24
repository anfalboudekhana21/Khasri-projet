(: Q3 - Calcul du score de chaque participant :)
<resultats_scores>
{
  for $conc in doc("club.xml")//concours
  let $coeff := number($conc/@coefficient)
  for $part in $conc/participants/participant
  let $membre := doc("club.xml")//membre[@id = $part/@membreRef]
  let $complexite := number($part/complexite)
  let $temps := number($part/tempsExecution)
  let $score := ($complexite + $temps) * $coeff
  return
    <participants_concours titre="{$conc/titre/text()}">
      <nom>{string($membre/prenom)} {string($membre/nom)}</nom>
      <complexite>{$complexite}</complexite>
      <tempsExecution>{$temps}</tempsExecution>
      <score>{format-number($score, "0.00")}</score></participants_concours>
}
</resultats_scores>
