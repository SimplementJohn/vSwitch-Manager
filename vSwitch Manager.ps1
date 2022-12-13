clear
Write-Output ""
Write-Output "Programme Administration vSwitch"
Write-Output "Creer par ROSA John, Version 1.0"
Write-Output "       Fait le 13/12/2022"
Write-Output ""

read-host "Appuyez sur la touche ENTREE pour continuer"
clear

Write-Output "_______________________________________________________________________"
Write-Output "
                                                                
               _____       _ _       _      _____                         
           _ _|   __|_ _ _|_| |_ ___| |_   |     |___ ___ ___ ___ ___ ___ 
          | | |__   | | | | |  _|  _|   |  | | | | .'|   | .'| . | -_|  _|
           \_/|_____|_____|_|_| |___|_|_|  |_|_|_|__,|_|_|__,|_  |___|_|  
                                                             |___|           
"
Write-Output "_______________________________________________________________________"
Write-Output "1 - Cr�er un vSwitch (OPERATIONEL)"
Write-Output "2 - Supprimer un vSwitch (OPERATIONEL)"
Write-Output "3 - Cr�er un ou plusieurs adaptateurs r�seaux pour des VM (OPERATIONEL)"
Write-Output "4 - Supprimer un ou plusieur adaptateurs r�seaux pour des VM (HS)"
Write-Output "5 - Cr�er un adaptateur r�seau pour l'HPV (OPERATIONEL)"
Write-Output "_______________________________________________________________________"
Write-Output ""

$choixUtilisateur = read-host "Que souhaitez vous faire ? (1,2,3,4,5)"
Write-Output ""

#Programme Cr�er un vSwitch #FINIS A TESTER
if ( $choixUtilisateur -eq 1 )
{
    #nous entrons le nombre de carte r?ea dont nous avons besoin
    $nombreCarteReseau = read-host "Entrez le nombre de carte reeau pour le vSwitch (1,2,3 ou 4)"


    #Si on selectione 1 carte r?eau
    if ( $nombreCarteReseau -eq 1 )
    {
        Get-NetAdapter
        Write-Output ""
        Write-Output "Vous allez creer le vSwitch avec une carte r�seau"
        $carteReseau1 = read-host "Entrez le nom 'Name' de la PREMIERE carte reseau:"
        Write-Output ""
        Write-Output "Vous avez selectione '$carteReseau1'"
        $nomVSwitch = read-host "Entrez le nom que vous voulez donner au vSwitch:"
        Write-Output ""
        #Creation du vswitch
        Add-VMNetworkAdapter -ManagementOS -Name "$carteReseau1" -SwitchName "$nomVSwitch"

    }

    #Si on selectione 2 cartes r?eau
    if ( $nombreCarteReseau -eq 2 )
    {
        Get-NetAdapter
        Write-Output ""
        Write-Output "Vous allez creer le vSwitch avec 2 cartes reseau"
        $carteReseau1 = read-host "Entrez le nom 'Name' de la PREMIERE carte reseau"
        $carteReseau2 = read-host "Entrez le nom 'Name' de la DEUXIEME carte reseau"
        Write-Output ""
        Write-Output "Vous avez selectione '$carteReseau1' et '$carteReseau2'"
        Write-Output ""
        $nomVSwitch = read-host "Entrez le nom que vous voulez donner au vSwitch"

        #Creation du vswitch
        Add-VMNetworkAdapter -ManagementOS -Name "$carteReseau1", "$carteReseau2" -SwitchName "$nomVSwitch"

    }


    #Si on selectione 3 cartes r?eau
    if ( $nombreCarteReseau -eq 3 )
    {
        Get-NetAdapter
        Write-Output ""
        Write-Output "Vous allez creer le vSwitch avec 3 cartes reseau"

        $carteReseau1 = read-host "Entrez le nom 'Name' de la PREMIERE carte reseau"
        $carteReseau2 = read-host "Entrez le nom 'Name' de la DEUXIEME carte reseau"
        $carteReseau3 = read-host "Entrez le nom 'Name' de la TROISIEME carte reseau"
        Write-Output ""
        Write-Output "Vous avez selectione '$carteReseau1' et '$carteReseau2' et 'carteReseau3"
        Write-Output ""
        $nomVSwitch = read-host "Entrez le nom que vous voulez donner au vSwitch"

        #Creation du vswitch
        Add-VMNetworkAdapter -ManagementOS -Name "$carteReseau1", "$carteReseau2", "$carteReseau3" -SwitchName "$nomVSwitch"
    }


    #Si on selectione 4 cartes r?eau
    if ( $nombreCarteReseau -eq 4 )
    {
        Get-NetAdapter
        Write-Output ""
        Write-Output "Vous allez creer le vSwitch avec 4 cartes reseau"
    
        $carteReseau1 = read-host "Entrez le nom 'Name' de la PREMIERE carte reseau"
        $carteReseau2 = read-host "Entrez le nom 'Name' de la DEUXIEME carte reseau"
        $carteReseau3 = read-host "Entrez le nom 'Name' de la TROISIEME carte reseau"
        $carteReseau4 = read-host "Entrez le nom 'Name' de la QUATRIEME carte reseau"
        Write-Output ""
        Write-Output "Vous avez selectione '$carteReseau1', '$carteReseau2', 'carteReseau3' et '$carteReseu4'"
        Write-Output ""
        $nomVSwitch = read-host "Entrez le nom que vous voulez donner au vSwitch"

        #Creation du vswitch
        Add-VMNetworkAdapter -ManagementOS -Name "$carteReseau1", "$carteReseau2", "$carteReseau3", "$carteReseau4" -SwitchName "$nomVSwitch"
    }

}


#Programe supprimer un vSwitch    #FINIS A TESTER
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


#Programme Cr�er un adaptateur r�seau pour des VM  #FINIS A TESTER 
if ( $choixUtilisateur -eq 3 )
{
    Write-Output ""
    $nombreVM = read-host "Combien de VM voulez vous connecter au vSwitch ? (1,2,3,4)"
    Write-Output "" 
    #Si 1 VM
    if ( $nombreVM -eq 1 ){
        $nomVM1 = read-host "Entrez le nom de votre
         VM"
        Write-Output ""
        $nomvSwitch = read-host "Entrez le nom de votre vSwitch"
        Write-Output ""
        Add-VMNetworkAdapter -Name "VM " -SwitchName "$nomvSwitch" -VMName "$nomVM1"
    }
    #Si deux VM
    if ( $nombreVM -eq 2 ){
        $nomVM1 = read-host "Entrez le nom de votre PREMIERE VM"
        $nomVM2 = read-host "Entrez le nom de votre DEUXIEME VM"
        Write-Output ""
        $nomvSwitch = read-host "Entrez le nom de votre vSwitch"
        Write-Output ""
        Add-VMNetworkAdapter -Name "VM " -SwitchName "$nomvSwitch" -VMName "$nomVM1"
        Add-VMNetworkAdapter -Name "VM " -SwitchName "$nomvSwitch" -VMName "$nomVM2"
    }
    #Si 3 VM
    if ( $nombreVM -eq 3 ){
        $nomVM1 = read-host "Entrez le nom de votre PREMIERE VM"
        $nomVM2 = read-host "Entrez le nom de votre DEUXIEME VM"
        $nomVM3 = read-host "Entrez le nom de votre TROISIEME VM"
        Write-Output ""
        $nomvSwitch = read-host "Entrez le nom de votre vSwitch"
        Write-Output ""
        Add-VMNetworkAdapter -Name "VM " -SwitchName "$nomvSwitch" -VMName "$nomVM1"
        Add-VMNetworkAdapter -Name "VM " -SwitchName "$nomvSwitch" -VMName "$nomVM2"
        Add-VMNetworkAdapter -Name "VM " -SwitchName "$nomvSwitch" -VMName "$nomVM3"
    }
    #Si 4 VM
    if ( $nombreVM -eq 4 ){
        $nomVM1 = read-host "Entrez le nom de votre PREMIERE VM"
        $nomVM2 = read-host "Entrez le nom de votre DEUXIEME VM"
        $nomVM3 = read-host "Entrez le nom de votre TROISIEME VM"
        $nomVM4 = read-host "Entrez le nom de votre QUATRIEME VM"
        Write-Output ""
        $nomvSwitch = read-host "Entrez le nom de votre vSwitch"
        Write-Output ""
        Add-VMNetworkAdapter -Name "VM " -SwitchName "$nomvSwitch" -VMName "$nomVM1"
        Add-VMNetworkAdapter -Name "VM " -SwitchName "$nomvSwitch" -VMName "$nomVM2"
        Add-VMNetworkAdapter -Name "VM " -SwitchName "$nomvSwitch" -VMName "$nomVM3"
        Add-VMNetworkAdapter -Name "VM " -SwitchName "$nomvSwitch" -VMName "$nomVM4"
    }
}


#Programme Supprimer un adaptateur r�seau pour des VM #A FAIRE
if ( $choixUtilisateur -eq 4 )
{

}

#Programme Cr�er un adaptateur r�seau pour l'HPV #A TESTER CEST FINIS
if ( $choixUtilisateur -eq 5 )
{
    $nomvSwitch= read-host "Entrez le nom de votre vSwitch"
    Write-Output ""
    Add-VMNetworkAdapter -ManagementOS -Name "HPV" -SwitchName "$nomvSwitch"
    Write-Output ""
    Get-NetAdapter
    Write-Output ""
    read-host "Fin du programme appuyez sur ENTREE pour fermer la feunetre)"
}