# Ange vilken CRAN-spegelserver som ska användas
# Detta förhindrar felet "trying to use CRAN without setting a mirror"
options(repos = c(CRAN = "https://cloud.r-project.org"))

# R kod för att installera (om nödvändigt) och ladda vanliga paket för Quarto-rapporter

# Definiera listan med nödvändiga paket
packages_to_load <- c(
  "tidyverse",    # Grundläggande samling för datavetenskap (inkluderar dplyr, ggplot2, tidyr, readr, purrr, stringr, forcats) [1, 3]
  "ggrepel",      # Förhindrar överlappande textetiketter i ggplot2-diagram [1]
  "patchwork",    # Kombinerar enkelt flera ggplot-diagram [1]
  "knitr",        # Grundläggande paket för R Markdown/Quarto kodblock (oftast förinstallerat med RStudio) [3]
  "kableExtra",   # Förbättrad tabellformatering med knitr::kable() [3]
  "gt",           # Skapar snygga och flexibla tabeller [3]
  "DT",           # Skapar interaktiva HTML-tabeller [3]
  "plotly",       # Skapar interaktiva diagram [3]
  "here",         # Förenklar filsökvägar i projekt [1, 3]
  "janitor",      # Verktyg för att städa och granska data [1]
  "lubridate",    # Underlättar hantering av datum och tider [1]
  "rio",          # Flexibel import och export av olika dataformat [1]
  "fs"            # Plattformsoberoende filsystemsåtgärder [1]
  # Lägg till andra projektspecifika paket här
)

# Loopa igenom paketlistan
for (pkg in packages_to_load) {
  # Kontrollera om paketet INTE redan är installerat
  if (!requireNamespace(pkg, quietly = TRUE)) {
    # Installera paketet om det saknas
    install.packages(pkg) 
  }
  # Ladda paketet in i den nuvarande sessionen
  library(pkg, character.only = TRUE)
}