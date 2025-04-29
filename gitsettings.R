library(usethis)

##############################################
### ENGÅNGSINSTÄLLNINGAR - KÖR BARA EN GÅNG ###
##############################################
# install.packages(c("usethis", "gitcreds")) # Installera nödvändiga paket
# usethis::create_github_token()             # Skapa GitHub token (spara denna!)
# gitcreds::gitcreds_set()                  # Spara GitHub token i credentials
# usethis::use_git()                        # Initiera git i projektet
usethis::use_github()                     # Skapa/koppla till GitHub-repo

###############################################
### RUTINER FÖR VARJE UPPDATERING AV FILER ###
###############################################

# Steg 1: Lägg till filer som ska uppdateras
system("git add graftema.R logo_vit.svg paket.R test.qmd rh_style.scss")
# ELLER lägg till alla ändrade filer: system("git add .")

# Steg 2: Commit ändringarna med beskrivande meddelande
system('git commit -m "Uppdaterat grafiktema och tillhörande filer"')

# Steg 3: Skicka till GitHub
system("git push origin main")

###############################################
### DIAGNOSTIK - KÖR VID BEHOV ###
###############################################
# system("git config --list")  # Se alla git-inställningar
# usethis::git_sitrep()        # Kontrollera git-status
# gitcreds::gitcreds_get()     # Kolla sparade GitHub-credentials