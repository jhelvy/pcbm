source(here('code', 'setup.R'))

# Compute baseline results:
source(here('code', 'loadInputs.R'))
outputs_baseline <- runModel(inputs_baseline)

# APV Sensitivity (annual production volume)
source(here('code', 'loadInputs.R'))
inputs_apv <- inputs_baseline
apv <- seq(1000, 40000, 500)
for (i in 1:length(apv)) {
    inputs_apv$plant['productionVol_annual'] <- apv[i]
    outputs <- runModel(inputs_apv)
    print(outputs)
}

# Different material for material 1:
# Differences:
# Material 1 price    $1  $/kg
# Material 2 price    $30     $/kg
# Material 1 cycle time for step 1    20  min
# Material 2 cycle time for step 1    2   min
