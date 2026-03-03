# Carbon Footprint Structure – Stacked Bar Plot📊

## 🇺🇸 English
This repository shows how to create a stacked bar plot in R to visualize the composition of  the crop carbon footprint. The plot highlights the relative contribution of each emission source and allows comparison between production systems (irrigated vs. rainfed) while keeping each field visible.

## What’s inside📦
- Data preparation: starting from application rates per hectare, emission factors are applied to calculate emissions per source. Then emissions per unit of yield are computed. The dataset is transformed into long format with pivot_longer() to make it ready for plotting.
- Plotting: a 100% stacked bar plot showing the relative contribution of each source (fertilizers, pesticides, diesel, soil emissions) to the total carbon footprint per field and system.
- An Example dataset is included (data_Carbon_footprint.xlsx) so you can run the code and see the plot yourself.

## Packages used⚙️
tidyverse – for data manipulation (dplyr, tidyr)
readxl – to read Excel files
ggplot2 – for plotting
I used R version 4.3.1


## 🇪🇸 Español
El repositorio muestra cómo crear un gráfico de barras apiladas en R para visualizar la composición de la huella de carbono de los cultivos. El gráfico muestra la contribución relativa de cada fuente de emisión y permite la comparación entre distintos sistemas de producción (riego y secano) manteniendo visible cada lote particular.

## Qué van a encontrar📦
- Preparación de los datos: se partió de una base de datos que contaba con las dosis por hectárea de cada fuente, a lo que se le aplicó el factor de emisión para calcular el total de emisiones por hectárea de cada fuente. Luego utilizando el dato de rendimiento por hectárea se calculó la emisión por unidad de rendimiento (kgCO2/kg grano). Los datos fueron transformados de formato mediante pivot_longer() para poder graficarlos.
- Gráfico: un gráfico de barras apiladas al 100% que muestra la contribución relativa de cada fuente (fertilizantes, pesticidas, diésel, emisiones del suelo) a la huella de carbono total por campo y sistema.
- Se incluyen los datos con los que he construido este ejemplo (data_Carbon_footprint.xlsx) para que puedan probar el código.

## Paquetes usados⚙️
tidyverse – manipulación de datos (dplyr, tidyr)
readxl – cargar archivos Excel
ggplot2 – graficar
Usé R versión 4.3.1

![Carbon footprint plot](figures/Plot.png)

