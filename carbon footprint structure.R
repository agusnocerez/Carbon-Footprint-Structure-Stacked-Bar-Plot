library(readxl)
library(tidyverse)
library(ggplot2)

data_Carbon_footprint <- read_excel("data_Carbon_footprint.xlsx")

carbonfootprint_long <- data_Carbon_footprint %>%
  pivot_longer(c(`UREA_EO2(kgCO2/ha)`, `UAN_EO2(kgCO2/ha)`, `MAP_P2O5_ECO2(kgCO2/ha)`,`Fungicide_ECO2(kgCO2/ha)`, `Insecticide_ECO2(kgCO2/ha)`, `Herbicides_ECO2(kgCO2/ha)`,`Diesel_ECO2(kgCO2/ha)`, Soil_direct_emissions_kgCO2, Soil_indirect_emission),
               names_to = "Sources of emission", values_to = "kg_CO2_ha")

carbonfootprint_long <- carbonfootprint_long %>%
  mutate(kg_CO2_unit = kg_CO2_ha/`Yield(kg/ha)`)

# Calculate the proportion of emissions from each source of emission
carbonfootprint_long <- carbonfootprint_long %>%
  mutate(proportion_kgCO_unit = kg_CO2_unit/carbon_footprint__TN_grain)

#
carbonfootprint_long$`Sources of emission` <- factor(
  carbonfootprint_long$`Sources of emission`,
  levels = c(
    "UREA_EO2(kgCO2/ha)",
    "UAN_EO2(kgCO2/ha)",
    "MAP_P2O5_ECO2(kgCO2/ha)",
    "Fungicide_ECO2(kgCO2/ha)",
    "Insecticide_ECO2(kgCO2/ha)",
    "Herbicides_ECO2(kgCO2/ha)",
    "Soil_direct_emissions_kgCO2",
    "Soil_indirect_emission",
    "Diesel_ECO2(kgCO2/ha)"
  ),
  labels = c(
    "Urea",
    "UAN",
    "MAP",
    "Fungicide",
    "Insecticide",
    "Herbicide",
    "Soil direct N2O",
    "Soil indirect N2O",
    "Diesel"
  )
)



ggplot(data=carbonfootprint_long, aes(x= Field, y=proportion_kgCO_unit, fill = `Sources of emission`)) +
  geom_bar(stat = "identity", position = "fill",  color = "grey30", linewidth = 0.25)+
  scale_y_continuous(expand = c(0, 0)) +
  scale_fill_manual(values = c(
    "Urea" = "#3E8E41",
    "UAN" = "#76B947",
    "MAP" = "#B7D7A8",
    "Fungicide" = "#8E6BBF",
    "Insecticide" = "#B39CD0",
    "Herbicide" = "#6A4C93",
    "Diesel" = "#D9A441",
    "Soil direct N2O" = "#C17C54",
    "Soil indirect N2O" = "#CFCFCF"
  ))+
  coord_flip() +
  labs(y="Contribution to total carbon footprint")+
  theme_classic(base_size = 13) +
  facet_grid(rows = vars(System), scales = "free_y", space = "free_y")

