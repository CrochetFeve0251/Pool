# se deroule sur aragon directement
Feature: KYC enabled Token contract
  In order to manage the token supply
  As the contract owner
  I want to mint new tokens when required

Scenario: DAO
  Given la DAO se prepare a lancer une phase et cree donc un vote sur le futur investissement
  When la DAO lance un vote sur different LPtoken
  And le vote aura une limite de temps de 3 jours
  Then le resultat nous permettra de savoir ou seront investit les fonds durant la phase

Scenario: UTILISATEUR
Given l'utilisateur doit voter si il le souhaite
  When l'utilisateur connecte son wallet a la DAO via aragon
  And l'utilisateur si il possede le token de la DAO peut voter au vote de choix de LPtoken
  Then l'utilisateur a voter et a participe activement a la vie de la DAO

# a la fin des 3 jours precedent se deroule toujours sur aragon

Scenario: DAO
Given la DAO valide le vote precedent et relance un vote pour savoir qui participe a la phase avec ce LP token
  When la DAO lance un vote de participation a la phase oui ou non
  And le vote aura une limite de temps de 3 jours.
  Then la DAO a l'adresse des wallet voulant participer a la phase.

Scenario: UTILISATEUR
Given si l'utilisateur souhaite participer a la phase il doit voter au second vote et envoyer les fond demAnde
  When l'utilisateur connecte son waller a la DAO via aragon
  And si l'utilisateur possede le token de la DAO il doit voter oui
  And si l'utilisateur veut participer il doit egalement envoyer les fonds a la DAO
  Then la DAO a les fonds des utilisateurs et l'adresse de ceux voulant y participer.

# si l'utilisateur ne fait pas ce qu'il y a ecrit ci dessus il ne pourra pas entre dans la phases en cours.
# a la fin des 3 jours precedent se deroule toujours sur aragon

Scenario: DAO
Given recapitulatif et lancement d'un vote pour lancer la phase
  When la DAO lance un vote de lancement de la phase
  And la DAO publie un recapitulatif de celle ci
  And le vote aura une limite de 1 jours
  Then ce vote a pour but de deplacer les fonds vers AGENT

Scenario: UTILISATEUR
Given l'utilisateur vote pour le lancement de la phase
  When l'utilisateur connecte son wallet a la DAO
  And l'utilisateur vote
  Then ce vote valide de facon definitif le lancement de la phase

# a la fin du 1 jour

Scenario: DAO
Given lancement de la phase
  When la dao envoie la mise initial des utilisateur participants a la phase ( la totalité de celles-ci seront bag USDC initial ) a agent qui va se lier a un smart contract
  And la DAO lancera un timer de 8 semaine les utilisateur ont leur fond bloquer jusqu'a la fin de phase( a la fin des 8 semaines la phase est finis .)
  Then la phase est lancer

Scenario: SMART CONTRACT1
Given le smart contract prepare le LPtoken et le met en farm
  When le smart contract swap 49% des USDC dans le premier token
  And le smart contract swap 49% des USDC dans le second token
  And le smart contract associe les deux tokens en LPtoken
  And le smart contract depose le LPtoken en farm
  And le smart contract lance un timer de 8 semaines
  Then le bag USDC initial genere des reward

# 49% est le maximum etant donner le slippage de 1%

# toutes les 2 semaines soit 3 fois avant la fin de phases

Scenario: SMART CONTRACT1
Given reclamation des rewards et swap de ceux-ci
  When le smart contract reclame les rewards generer par le LPtoken
  And swap les rewards de maniere suivante 50% en WBTC 17% en USDC 16 % en USDT 17 % en DAI


# a la fin des 8 semaines

Scenario: SMARTCONTRACT1
Given le smart contract se prepare a finir et va disocier les fonds
  When le smart contract sort touts les LP des farm
  And le smart contract reclame les rewards generer par le LPtoken
  And swap les rewards de maniere suivante 50% en WBTC 17% en USDC 16 % en USDT 17 % en DAI
  And envoie les USDC USDT et DAI au wallet de la DAO
  And transforme le ou les LPtoken en USDC cette valeur se nommera USDC1
  And transforme le WBTC en USDC cette valeur se nommera en USDC2
  And enverra ces deux valeurs sur un autre smart contract (2) qui calculera pour distribuer la equitablement aux participants de la phase.
  Then le smart contract est fermer

Scenario: SMARTCONTRACT2
Given le smart contract recoit USDC1 et USDC2 alors il reclame T.I.1 et T.I.2
  When le smart contract claim les reward MATIC DELEGUATION And DAI STAKING
  And swap ces deux tokens en USDC ce fond se nommera T.I.1
  And le smart contract claim the reward STETH
  And swap ce token en USDC ce fond se nommera
  # STETH a la possibilite de generer des rewards en USDC sur certaine plateforme
  And le smart contract utilisera la FONCTION
  And le smart contract renverra fond et rewards (bag utilisateur a repartir) aux participants, par personne si mise initial utilisateur est egal a tous sinon par %
  And enverra les fonds specifique tel que TBG et T.I.2 si non utiliser sous la forme de STETH a la plateforme
  Then tout le monde est content
