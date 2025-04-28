theme_halland <- function(base_size = 10,
                          base_family = "IBM Plex Sans", # Standardtext
                          title_family = "Poppins"      # Rubriktext
) {
  
  # Färger (anpassade för ren stil, kan hämtas från din SCSS palett vid behov)
  text_color <- "#004232"       # Mörkgrå för huvudtext/titlar (liknar $gray-dark)
  subtle_text_color <- "#555555" # Ljusare grå för undertitel/källa
  grid_color <- "grey95"       # Mycket ljus grå för gridlines
  axis_color <- "#B0B0B0"       # Ljus grå för axellinje/ticks
  
  # Bas tema: theme_minimal
  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) +
    ggplot2::theme(
      # --- Text Element ---
      plot.title = ggplot2::element_text(
        size = ggplot2::rel(1.35),
        face = "bold",            # Poppins är redan bold i SCSS, men för säkerhets skull
        color = text_color,       # Använd mörk textfärg
        family = title_family,
        hjust = 0,
        margin = ggplot2::margin(t = 5, b = 8)
      ),
      plot.subtitle = ggplot2::element_text(
        size = ggplot2::rel(1.0),
        color = subtle_text_color,
        family = base_family,
        hjust = 0,
        margin = ggplot2::margin(b = 12)
      ),
      plot.caption = ggplot2::element_text(
        size = ggplot2::rel(0.8),
        color = subtle_text_color,
        family = base_family,
        hjust = 0,
        margin = ggplot2::margin(t = 10)
      ),
      plot.title.position = "plot",
      plot.caption.position = "plot",
      
      # --- Axlar --- (båda axlar nu synliga)
      axis.text = ggplot2::element_text(
        size = ggplot2::rel(0.85),
        color = text_color,
        family = base_family
      ),
      axis.title = ggplot2::element_text(
        size = ggplot2::rel(0.85),
        color = subtle_text_color,
        family = base_family,
        face = "plain",
        margin = ggplot2::margin(t = 6, b = 6)
      ),
      axis.title.x = ggplot2::element_text(
        margin = ggplot2::margin(t = 10, b = 0)
      ),
      axis.title.y = ggplot2::element_text(
        margin = ggplot2::margin(r = 10, l = 0),
        angle = 90
      ),
      
      # Konsekvent stil för axellinjer och ticks (båda axlar nu synliga)
      axis.line.x = ggplot2::element_line(color = axis_color, linewidth = 0.4),
      axis.line.y = ggplot2::element_line(color = axis_color, linewidth = 0.4),
      axis.ticks.x = ggplot2::element_line(color = axis_color, linewidth = 0.4),
      axis.ticks.y = ggplot2::element_line(color = axis_color, linewidth = 0.4),
      axis.ticks.length = ggplot2::unit(0.2, "cm"),
      
      # --- Gridlines --- (endast horisontella)
      panel.grid.major.y = ggplot2::element_line(color = grid_color, linewidth = 0.3),
      panel.grid.major.x = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      
      # --- Bakgrund och Ram (vit bakgrund, ingen ram) ---
      plot.background = ggplot2::element_rect(fill = "white", color = NA),
      panel.background = ggplot2::element_rect(fill = "white", color = NA),
      panel.border = ggplot2::element_blank(),
      
      # --- Legend ---
      legend.position = "top",
      legend.justification = "left",
      legend.margin = ggplot2::margin(t = 0, r = 0, b = 5, l = 0),
      legend.spacing.x = ggplot2::unit(0.2, "cm"),
      legend.text = ggplot2::element_text(
        size = ggplot2::rel(0.85),
        color = text_color,
        family = base_family
      ),
      legend.title = ggplot2::element_text(
        size = ggplot2::rel(0.9),
        color = text_color,
        face = "bold",
        family = title_family,
        margin = ggplot2::margin(r = 5)
      ),
      legend.key = ggplot2::element_rect(fill = NA, color = NA),
      legend.key.size = ggplot2::unit(0.9, "lines"),
      
      # --- Facets ---
      strip.background = ggplot2::element_rect(fill = "grey95", color = NA),
      strip.text = ggplot2::element_text(
        size = ggplot2::rel(0.95),
        color = text_color,
        face = "bold",
        family = title_family,
        margin = ggplot2::margin(t = 4, b = 4)
      ),
      panel.spacing = ggplot2::unit(1.2, "lines"),
      
      # --- Marginaler --- (Justerade för bättre utrymme)
      plot.margin = ggplot2::margin(t = 12, r = 12, b = 12, l = 12, unit = "pt")
    )
}

# --- Färgpalett för Halland ---
# Definiera den nya enhetliga färgpaletten
halland_colors <- c(
  # Starka, distinkta basfärger
  "#005A4D", # Mörk grönblå
  "#004C70", # Mörk blå
  "#B33D4A", # Dammig röd/rost
  "#E8A03D", # Varm gul/ockra
  
  # Ljusare/Mellantoner
  "#1E8C6A", # Klarare grön
  "#5DADE2", # Mellanblå
  "#F17C67", # Korall/laxrosa
  "#F9D470", # Ljusare gul
  
  # Kompletterande ljusa nyanser
  "#85C1B8", # Ljus mintgrön/turkos
  "#A9CCE3", # Ljus blågrå
  "#F5B7B1", # Mycket ljus rosa/korall
  "#FCF3CF"  # Mycket ljus gul/beige
)

# --- Färgskalor med automatisk hög kontrast ---
# Funktion som väljer färger med hög kontrast för n element
get_contrasting_colors <- function(n) {
  if (n <= 1) return(halland_colors[1])
  if (n == 2) return(c(halland_colors[1], halland_colors[3])) # Grönblå + Röd (hög kontrast)
  if (n == 3) return(c(halland_colors[1], halland_colors[3], halland_colors[4])) # Grönblå + Röd + Gul
  if (n == 4) return(c(halland_colors[1], halland_colors[3], halland_colors[4], halland_colors[2])) # Alla fyra basfärger
  
  # För fler än 4, börja med basfärger och lägg till mellantoner
  if (n <= 8) return(halland_colors[1:n])
  
  # Om fler än 8 efterfrågas, använd hela paletten och repetera vid behov
  return(rep(halland_colors, length.out = n))
}

# Färgskala för fyllningar
scale_fill_halland <- function(..., contrast = TRUE) {
  if (contrast) {
    # Om kontrast önskas, låt ggplot bestämma antalet kategorier som behövs
    # och returnera sedan motsvarande antal kontrasterande färger
    return(ggplot2::scale_fill_manual(values = function(n) get_contrasting_colors(n), ...))
  } else {
    # Om kontrast inte behövs, använd hela paletten
    return(ggplot2::scale_fill_manual(values = halland_colors, ...))
  }
}

# Färgskala för linjer/punkter
scale_color_halland <- function(..., contrast = TRUE) {
  if (contrast) {
    # Om kontrast önskas, använd samma logik som för fyllningar
    return(ggplot2::scale_color_manual(values = function(n) get_contrasting_colors(n), ...))
  } else {
    # Om kontrast inte behövs, använd hela paletten
    return(ggplot2::scale_color_manual(values = halland_colors, ...))
  }
}

# För kompatibilitet med brittisk engelska
scale_colour_halland <- scale_color_halland