(: Q4 - Vainqueur de chaque concours (ex-aequo possible) :)
<vainqueurs>
{
  for $conc in doc("club.xml")//concours
  let $coeff := number($conc/@coefficient)
  let $parts := $conc/participants/participant
  let $scores :=
    for $p in $parts
    let $c := number($p/complexite)
    let $t := number($p/tempsExecution)
    return ($c + $t) * $coeff
  let $max_score := max($scores)
  return
    <concours titre="{$conc/titre/text()}">
    {
      for $p at $pos in $parts
      let $c := number($p/complexite)
      let $t := number($p/tempsExecution)
      let $score := ($c + $t) * $coeff
      where $score = $max_score
      let $m := doc("club.xml")//membre[@id = $p/@membreRef]return
        <vainqueur>
          <nom>{string($m/prenom)} {string($m/nom)}</nom>
          <score>{format-number($score, "0.00")}</score>
        </vainqueur>
    }
    </concours>
}
</vainqueurs>
