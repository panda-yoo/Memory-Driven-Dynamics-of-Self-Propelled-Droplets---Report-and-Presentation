$report_used = @(
"assets/images/output_sim/droplet_6_tracking/all_droplets/local_alpha_comparison.png",
"assets/images/output_sim/droplet_6_tracking/all_droplets/msd_comparison.png",
"assets/images/output_sim/droplet_6_tracking/all_droplets/orientation_comparison.png",
"assets/images/output_sim/droplet_6_tracking/all_droplets/trajectory_comparison.png",
"assets/images/output_sim/droplet_6_tracking/all_droplets/vacf_comparison.png",
"assets/images/output_sim/droplet_6_tracking_alpha_vs_tau.png",
"assets/images/output_sim/droplet_6_tracking_loglog_msd.png",
"assets/images/output_sim/droplet_6_tracking_orientation_corr.png",
"assets/images/output_sim/droplet_6_tracking_vacf.png",
"assets/images/output_sim/single_Trajectory.png",
"assets/images/plots/for_2&4ul_droplets_alpha_vs_tau.png",
"assets/images/plots/for_2&4ul_droplets_loglog_msd.png",
"assets/images/plots/for_2&4ul_droplets_orientation_corr.png",
"assets/images/plots/for_2&4ul_droplets_vacf.png",
"assets/images/plots/for_2.1_droplets_alpha_vs_tau.png",
"assets/images/plots/for_2.1_droplets_loglog_msd.png",
"assets/images/plots/for_2.1_droplets_orientation_corr.png",
"assets/images/plots/for_2.1_droplets_vacf.png",
"assets/images/plots/for_2.2_droplets_alpha_vs_tau.png",
"assets/images/plots/for_2.2_droplets_loglog_msd.png",
"assets/images/plots/for_2.2_droplets_orientation_corr.png",
"assets/images/plots/for_2.2_droplets_vacf.png",
"assets/images/plots/for_2.3_droplets_alpha_vs_tau.png",
"assets/images/plots/for_2.3_droplets_loglog_msd.png",
"assets/images/plots/for_2.3_droplets_orientation_corr.png",
"assets/images/plots/for_2.3_droplets_vacf.png",
"assets/images/plots/for_2.4_droplets_alpha_vs_tau.png",
"assets/images/plots/for_2.4_droplets_loglog_msd.png",
"assets/images/plots/for_2.4_droplets_orientation_corr.png",
"assets/images/plots/for_2.4_droplets_vacf.png",
"assets/images/yolo_tracking_example.png"
)

$pres_used = @(
"assets/images/bacteria.png",
"assets/images/BZ_active_droplet.png",
"assets/images/camera_setup_image.png",
"assets/images/lab_droplet_image.png",
"assets/images/Starling_murmuration.jpg"
)

# Move Report Assets
if (Test-Path "report/images") {
    Move-Item -Path "report/images/*" -Destination "report/assets/images" -Force
    Remove-Item "report/images" -Recurse -Force
}
if (Test-Path "report/logo.png") {
    Move-Item -Path "report/logo.png" -Destination "report/assets/logos/logo.png" -Force
}
if (Test-Path "report/references.bib") {
    Move-Item -Path "report/references.bib" -Destination "report/bibliography/references.bib" -Force
}

# Clean unused Report images
Get-ChildItem -Path "report/assets/images" -File -Recurse | ForEach-Object {
    $rel = $_.FullName.Substring((Resolve-Path "report").Path.Length + 1).Replace('\', '/')
    if ($report_used -notcontains $rel) {
        Remove-Item $_.FullName -Force
    }
}

# Move Presentation Assets
if (Test-Path "presentation/figures") {
    Move-Item -Path "presentation/figures/*" -Destination "presentation/assets/images" -Force
    Remove-Item "presentation/figures" -Recurse -Force
}
if (Test-Path "presentation/references.bib") {
    Move-Item -Path "presentation/references.bib" -Destination "presentation/bibliography/references.bib" -Force
}

# Clean unused Presentation images
Get-ChildItem -Path "presentation/assets/images" -File -Recurse | ForEach-Object {
    $rel = $_.FullName.Substring((Resolve-Path "presentation").Path.Length + 1).Replace('\', '/')
    if ($pres_used -notcontains $rel) {
        Remove-Item $_.FullName -Force
    }
}

# Delete unused files in presentation
if (Test-Path "presentation/MSc_Thesis_Pranav_Shinde_246PH028_V4.md") { Remove-Item "presentation/MSc_Thesis_Pranav_Shinde_246PH028_V4.md" -Force }
if (Test-Path "presentation/wsl-run.js") { Remove-Item "presentation/wsl-run.js" -Force }
if (Test-Path "presentation/README.md") { Remove-Item "presentation/README.md" -Force }
if (Test-Path "presentation/temp.txt") { Remove-Item "presentation/temp.txt" -Force }

