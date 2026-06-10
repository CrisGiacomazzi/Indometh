# Introduction

**Indomethacin** is a powerful nonsteroidal anti-inflammatory drug (NSAID) used to treat a variety of medical conditions. It has received approval from the FDA for the treatment of acute pain, rheumatoid arthritis, ankylosing spondylitis, osteoarthritis, bursitis, gouty arthritis, and patent ductus arteriosus. In clinical practice, indomethacin is frequently prescribed as part of a broader therapeutic regimen to support the management of these conditions (Munjal, 2024).

The goal of the pharmacokinetic (PK) analysis is to characterize how indomethacin plasma concentration changes over time after administration and to evaluate inter-subject variability (StatPearls, 2026).

# Objective

- The purpose of this project was to bridge the gap between technical data generation and business intelligence, transforming raw statistical output into a highly communicative visualization that enhances stakeholder data literacy and drives operational decisions.


# Results

## Native R plot
The native R output represents a standard, exploratory data visualisation typically generated during the initial phases of statistical analysis (figure 1). Rendered using a default grey background with high-contrast gridlines, the plot displays individual subject trajectories over an 8-hour period as overlapping, uniform black lines. While technically accurate in plotting concentration-time data points, this baseline graphic lacks a visual hierarchy, a population central tendency, and descriptive metadata. It serves as a raw diagnostic tool for the analyst rather than a communication asset for non-technical stakeholders, requiring significant cognitive effort to extract meaningful clinical or business insights.

Figure 1. Native R plot for PK analysis
<img width="2534" height="1380" alt="image" src="https://github.com/user-attachments/assets/f7224224-f487-449a-90bd-06f2586bb830" />

## Visual Re-Engineering and Modifications
- Eliminated Visual Noise: Replaced the heavy, native grey background grid with a clean, high-contrast white workspace to streamline stakeholder focus.
- Established Strategic Context: Added an executive-level title ("Fig 2. Indometh - Population Pharmacokinetics") and refined the y-axis label to explicitly state the biological matrix ("Drug concentration in Plasma (mg/L)").
- Layered Complex Data: The plot visualizes individual concentration–time profiles using grey lines, while black points represent observed plasma concentrations at each sampling time.
- Engineered Primary Signals: Introduced a bold red population trendline along with dotted red confidence bounds to instantly separate central tendencies (median) from individual variability.
- Anchored Operational Milestones: Placed an explicit vertical boundary at the 8-hour mark to clearly denote the "End of Study" and integrated a dashed horizontal baseline at 0mg/L.
- Enhanced Stakeholder Interpretation: This visualization supports stakeholder interpretation by linking raw measurements to overall exposure trends across the population.
  
Figure 2. Business-Oriented Plot Enhancements
<img width="2434" height="1380" alt="image" src="https://github.com/user-attachments/assets/8dbee04f-9b71-4ea8-bc4e-57e182478292" />

_Observation:
There is no established therapeutic plasma concentration range for indomethacin, for this reason, it was added a 95% CI in the plot to support the variability between subjects. 
_

# Conclusion
This portfolio project demonstrates mature health data literacy by transforming a standard, non-descript R visualization into a compelling, executive-ready data story. By establishing context and a clear value proposition through deliberate labeling and precise axis definitions, the design immediately communicates the clinical asset and biological parameters under review. The visualization reduces cognitive load via a structured visual hierarchy, stripping away distracting background noise and muting individual patient trajectories to let the critical data trends emerge seamlessly. Furthermore, the strategic introduction of a central population trendline (median) delivers immediate actionable insight, while explicitly marked strategic milestones (such as the exact trial termination boundaries) provide crucial operational anchors for business and clinical decision-makers alike.


