source(here('code', 'setup.R'))

inputs_plant <- read_csv(here('inputs', 'plant.csv'))
inputs_steps <- read_csv(here('inputs', 'steps.csv'))

# Convert inputs to lists
plant <- inputs_plant$value
step1 <- inputs_steps$step1
step2 <- inputs_steps$step2
step3 <- inputs_steps$step3
names(plant) <- inputs_plant$variable
names(step1) <- inputs_steps$variable
names(step2) <- inputs_steps$variable
names(step3) <- inputs_steps$variable
inputs_baseline <- list(
    plant = plant,
    step1 = step1,
    step2 = step2,
    step3 = step3)

