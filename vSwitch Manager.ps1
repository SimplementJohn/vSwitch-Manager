
#boucle infini
while(1){
clear

Write-Output "_______________________________________________________________________"
Write-Output "
                                                                
        _____       _ _       _      _____                                           
    _ _|   __|_ _ _|_| |_ ___| |_   |     |___ ___ ___ ___ ___ ___  
   | | |__   | | | | |  _|  _|   |  | | | | .'|   | .'| . | -_|  _|                  
    \_/|_____|_____|_|_| |___|_|_|  |_|_|_|__,|_|_|__,|_  |___|_|    
                                                      |___|    
                                                                  
           _          ____  _     _ _   _       _ _                 
          | |_ _ _   |    \|_|___|_| |_| |_ ___| | |                      
          | . | | |  |  |  | | . | |  _|   | .'| | |                      
          |___|_  |  |____/|_|_  |_|_| |_|_|__,|_|_|      Lite v2.0                
              |___|          |___|                              
                                                                 "

Write-Output "_______________________________________________________________________"
Write-Output ""
Write-Output "1 - Créer un vSwitch"
Write-Output "2 - Supprimer un vSwitch"
Write-Output "3 - Ajoutez un Adaptateur Réseau a l'HPV"
Write-Output "4 - Ajoutez un adaptateur Réseau a une VM"
Write-Output "5 - Supprimer un adaptateur Réseau a une VM"
Write-Output "6 - Affiche les Cartes Réseaux, vSwitch et les VM "
Write-Output "7 - Copyright "
Write-Output ""
Write-Output "_______________________________________________________________________"
Write-Output ""

$choixUtilisateur = read-host "Que souhaitez vous faire ? 1,2,3,4,5,6 ou 7"
Write-Output ""

#Créer un vSwitch
if ( $choixUtilisateur -eq 1 )
{
    #nous entrons le nombre de carte reseau dont nous avons besoin
    $nombreCarteReseau = read-host "Entrez le nombre de carte reseau pour le vSwitch."


    #Si on selectione 1 carte reseau
    if ( $nombreCarteReseau -eq 1 )
    {
        Get-NetAdapter
        Write-Output ""
        Write-Output "Vous allez creer le vSwitch avec une carte réseau"
        $carteReseau1 = read-host "Entrez le nom 'Name' de votre carte reseau:"
        Write-Output "Vous avez selectione '$carteReseau1'"
        Write-Output ""
        $nomVSwitch = read-host "Entrez le nom que vous voulez donner au vSwitch:"
        Write-Output ""
        #Creation du vswitch
        New-VMSwitch "$nomVSwitch" -NetAdapterName "$carteReseau1" -AllowManagementOS $false -AllowNetLbfoTeams $true
        Write-Output ""
        Write-Output "Le vSwitch portant le nom de $nomVSwitch à été crée"
        Write-Output ""
        $choix = read-host "Appyez sur ENTREE pour quitter"
    }
}


#Programe supprimer un vSwitch
if ( $choixUtilisateur -eq 2 )
{
    Get-NetAdapter
    Write-Output ""
    $vSwitchASupprimer = read-host "Quel vSwitch souhaitez vous supprimer ?"
    Write-Output ""
    Remove-VMSwitch $vSwitchASupprimer
    Write-Output ""
    Write-Output "Vous venez de supprimer $vSwitchASupprimer"
    Write-Output ""
}


#Ajoutez un Adaptateur Réseau a l'HPV
if ( $choixUtilisateur -eq 3 )
{
    Get-NetAdapter
    Write-Output ""
    $nomAdaptateur = read-host "Quel nom voulez vous donner a l'adaptateur"
    Write-Output ""
    $nomVSwitch = read-host "Quel nom du vSwitch ?"
    Write-Output ""
    Add-VMNetworkAdapter -Name "$nomAdaptateur" -SwitchName "$nomVSwitch" -ManagementOS
    Write-Output ""
    $choix = read-host "Appyez sur ENTREE pour quitter"
}


#Ajoutez un adaptateur Réseau a une VM
if ( $choixUtilisateur -eq 4 )
{
    Get-NetAdapter
    Write-Output ""
    $nomAdaptateur = read-host "Quel nom voulez vous donner a l'adaptateur"
    Write-Output ""
    $nomVSwitch = read-host "Quel nom du vSwitch ?"
    Write-Output ""
    $nomVM = read-host "A quelle VM voulez vous l'attacher ?"
    Write-Output ""
    Add-VMNetworkAdapter -Name "$nomAdaptateur"  -SwitchName "$nomVSwitch" -VMName "$nomVM"
    Write-Output ""
    Write-Output "Voila l'apadtateur $nomAdaptateur à étais crée pour $nomVM à travert $nomVSwitch"
    Write-Output ""
    $choix = read-host "Appyez sur ENTREE pour quitter"

}


#Programme supprimer un adaptateur du vSwitch a l'adapteur
if ( $choixUtilisateur -eq 5 )
{
    Write-Output ""
    $nomAdaptateur = read-host "Quel adaptateur voulez vous supprimer ?"
    Write-Output ""
    $maVM = read-host "Quel est le nom de la VM sur la quelle vous voulez supprimer l'adaptateur $nomAdatateur ?"
    Write-Output ""
    Remove-VMNetworkAdapter -VMName "$maVM" -VMNetworkAdapterName "$monAdaptateur"
    Write-Output ""
    Write-Output "Vous avez supprime $monAdaptateur de $maVM"
    Write-Output ""
    $choix = read-host "Appyez sur ENTREE pour quitter"
}



#Programme Afficher les cartes réseaux et les vSwitch
if ( $choixUtilisateur -eq 6 )
{
    Write-Output "_______________________________________________________________________"
    Write-Output ""
    Write-Output "Voici les Cartes Réseaux..."
    Write-Output ""
    Get-NetAdapter 
    Write-Output ""
    Write-Output "_______________________________________________________________________"
    Write-Output ""
    Write-Output "Voici les vSwitch..."
    Write-Output ""
    Get-VMSwitch 
    Write-Output "_______________________________________________________________________"
    Write-Output ""
    Write-Output "Voici les VM..."
    Write-Output ""
    Get-VM
    Write-Output "_______________________________________________________________________"
    Write-Output ""
    $choix = read-host "Appyez sur ENTREE pour quitter"
}

#Programme copyright
if ( $choixUtilisateur -eq 7 )
{
    Write-Output "_______________________________________________________________________"
    Write-Output ""
    Write-Output "Programme vSwitch Manager, ce progrrame permet d'administrer des vSwitch en PowerSheel"
    Write-Output "Cree par ROSA John le 04/10/2023"
    Write-Output "Version 2.0"
    Write-Output ""
    Write-Output "_______________________________________________________________________"
    Write-Output ""
    $choix = read-host "Appyez sur ENTREE pour quitter"
}



}#fin boucle while(1)