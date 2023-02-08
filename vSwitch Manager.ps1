
#boucle infini
while(1){
clear

Write-Output "_______________________________________________________________________"
Write-Host "
                                                                
        _____       _ _       _      _____                                           
    _ _|   __|_ _ _|_| |_ ___| |_   |     |___ ___ ___ ___ ___ ___  
   | | |__   | | | | |  _|  _|   |  | | | | .'|   | .'| . | -_|  _|                  
    \_/|_____|_____|_|_| |___|_|_|  |_|_|_|__,|_|_|__,|_  |___|_|    
                                                      |___|    
                                                                  
           _          ____  _     _ _   _       _ _                 
          | |_ _ _   |    \|_|___|_| |_| |_ ___| | |                      
          | . | | |  |  |  | | . | |  _|   | .'| | |                      
          |___|_  |  |____/|_|_  |_|_| |_|_|__,|_|_|      Lite v2.2                
              |___|          |___|                              
                                                                 "

Write-Output "_______________________________________________________________________"
Write-Output ""
Write-Output "  1 - Installer le role Hyper-V et generer les fihiers pour Hyper-V"
Write-Output "  2 - Creer un vSwitch"
Write-Output "  3 - Supprimer un vSwitch"
Write-Output "  4 - Ajoutez un Adaptateur Reseau a l'HPV"
Write-Output "  5 - Ajoutez un adaptateur Reseau a une VM"
Write-Output "  6 - Supprimer un adaptateur Reseau a une VM"
Write-Output "  7 - Affiche les Cartes Reseaux, vSwitch et les VM "
Write-Output "  8 - Copyright "
Write-Output "  9 - Debug" 
Write-Output "_______________________________________________________________________"
Write-Output ""

$choixUtilisateur = read-host "Que souhaitez vous faire ? 1,2,3,4,5,6,7,8 ou 9"
Write-Output ""

#Creer un vSwitch
if ( $choixUtilisateur -eq 2 )
{

    $versionOS = read-host "Vous etes sur WindowsServer2019 ou WindowsServer2022 (1 ou 2)? "
    if ( $versionOS -eq 1)  #Si l'utilisateur a selectionne windows server 2019
    {
        Write-Output ""
        Write-Output "Vous avez selectione WindowsServer2019"
        Write-Output ""
        Get-NetAdapter
        Write-Output ""
        $carteReseau1 = read-host "Entrez le nom 'Name' de votre TEAMING:"
        Write-Output "Vous avez selectione '$carteReseau1'"
        Write-Output ""
        $nomVSwitch = read-host "Entrez le nom que vous voulez donner au vSwitch:"
        Write-Output ""
        #Creation du vswitch
        New-VMSwitch "$nomVSwitch" -NetAdapterName "$carteReseau1" -AllowManagementOS $false
        Write-Output ""
        $choix = read-host "Appyez sur ENTREE pour quitter"
    }

    if ( $versionOS -eq 2)  #Si l'utilisateur a selectionne windows server 2022
    {
        Write-Output ""
        Write-Output "Vous avez selectione WindowsServer2012"
        Write-Output ""
        Get-NetAdapter
        Write-Output ""
        $carteReseau1 = read-host "Entrez le nom 'Name' de votre TEAMING:"
        Write-Output "Vous avez selectione '$carteReseau1'"
        Write-Output ""
        $nomVSwitch = read-host "Entrez le nom que vous voulez donner au vSwitch:"
         Write-Output ""
        #Creation du vswitch
        New-VMSwitch "$nomVSwitch" -NetAdapterName "$carteReseau1" -AllowManagementOS $false -AllowNetLbfoTeams $true
        Write-Output ""
        $choix = read-host "Appyez sur ENTREE pour quitter"
    }



}


#Programe supprimer un vSwitch
if ( $choixUtilisateur -eq 3 )
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


#Ajoutez un Adaptateur Reseau a l'HPV
if ( $choixUtilisateur -eq 4 )
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


#Ajoutez un adaptateur Reseau a une VM
if ( $choixUtilisateur -eq 5 )
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
    Write-Output "Voila l'apadtateur $nomAdaptateur � �tais cr�e pour $nomVM � travert $nomVSwitch"
    Write-Output ""
    $choix = read-host "Appyez sur ENTREE pour quitter"

}


#Programme supprimer un adaptateur du vSwitch a l'adapteur
if ( $choixUtilisateur -eq 6 )
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



#Programme Afficher les cartes reseaux et les vSwitch
if ( $choixUtilisateur -eq 7 )
{
    Write-Output "_______________________________________________________________________"
    Write-Output ""
    Write-Output "Voici les Cartes Reseaux..."
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


#Programme Instalation de hyper-v + changement du role
if ( $choixUtilisateur -eq 1 )
{
    Write-Output "_______________________________________________________________________"
    Write-Output ""    
    Write-Output "Le script va installer le role Hyper-V puis redemarera "
    Write-Output ""
    $nomMachine = hostname
    Install-WindowsFeature -Name Hyper-V -ComputerName $nomMachine -IncludeManagementTools 

    Write-Output "_______________________________________________________________________"
    Write-Output ""    
    Write-Output "Creation du repertoire Hyper-V"
    Write-Output "Modification des cle de Registres Hyper-V"
    Write-Output ""    

    Write-Output "Affichage des lecteurs disponible"
    Write-Output ""    

    #affiche localement les disques dispo
    wmic logicaldisk get name
    Write-Output ""    
    
    Write-Output "Quel emplacement voulez vous stocker le dossier Hyper-V ?"
    $emplacement = read-host "Ecrivez la lettre en majuscule suivi de ':' "
    Write-Output ""    

    #Association des chemin a des variables
    $defaultConfigPath = "$emplacement\Hyper-V\VM"
    $defaultVhdxPath = "$emplacement\Hyper-V\VHDX"
    
    #creation des dossiers dans la partition D
    New-Item -Path $defaultConfigPath -ItemType Directory
    New-Item -Path $defaultVhdxPath -ItemType Directory
    Write-Output ""

    #Modification de clé de registres
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" -Name "DefaultVmDirectory" -Value $defaultConfigPath
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" -Name "DefaultVirtualHardDiskPath" -Value $defaultVhdxPath

    #timer avant arret
    Write-Output "_______________________________________________________________________"
    Write-Output ""
    Write-Host "L'ordinateur va redemarer dans 5 secondes" -ForegroundColor Red
    Start-Sleep -Seconds 1
    Write-Host "L'ordinateur va redemarer dans 4 secondes" -ForegroundColor Red
    Start-Sleep -Seconds 1
    Write-Host "L'ordinateur va redemarer dans 3 secondes" -ForegroundColor Red
    Start-Sleep -Seconds 1
    Write-Host "L'ordinateur va redemarer dans 2 secondes" -ForegroundColor Red
    Start-Sleep -Seconds 1
    Write-Host "L'ordinateur va redemarer dans 1 secondes" -ForegroundColor Red
    Start-Sleep -Seconds 1

    #arret de l'ordinateur
    restart-computer
}

#Programme copyright
if ( $choixUtilisateur -eq 8 )
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

#Programme debug
if ( $choixUtilisateur -eq 9 )
{

    #timer avant arret
    Write-Output "_______________________________________________________________________"
    Write-Output ""
    Write-Host "L'ordinateur va redemarer dans 5 secondes" -ForegroundColor Red
    Start-Sleep -Seconds 1
    Write-Host "L'ordinateur va redemarer dans 4 secondes" -ForegroundColor Red
    Start-Sleep -Seconds 1
    Write-Host "L'ordinateur va redemarer dans 3 secondes" -ForegroundColor Red
    Start-Sleep -Seconds 1
    Write-Host "L'ordinateur va redemarer dans 2 secondes" -ForegroundColor Red
    Start-Sleep -Seconds 1
    Write-Host "L'ordinateur va redemarer dans 1 secondes" -ForegroundColor Red
    Start-Sleep -Seconds 1

}


}#fin boucle while(1)