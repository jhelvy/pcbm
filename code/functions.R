
runModel <- function(inputs) {

    # Create local variables
    plant <- inputs$plant
    step1 <- inputs$step1
    step2 <- inputs$step2
    step3 <- inputs$step3

    # Compute plant level variables
    availPlantTime <- 24 - sum(
        plant['dailyHrs_noShift'],
        plant['dailyHrs_unpaidBreaks'],
        plant['dailyHrs_paidBreaks'],
        plant['dailyHrs_unplannedDown'],
        plant['dailyHrs_maintenance'])

    # Compute EPV
    epv_step3 <- plant['productionVol_annual'] / step3['yieldRate']
    epv_step2 <- epv_step3 / step2['yieldRate']
    epv_step1 <- epv_step2 / step1['yieldRate']

    # Compute lineTimeAvail
    lineTimeAvail_step3 <- plant['workingDays_annual'] *
        (availPlantTime - step3['timeHr_maintenance'] -
         step3['timeHr_downtime'])
    lineTimeAvail_step2 <- plant['workingDays_annual'] *
        (availPlantTime - step2['timeHr_maintenance'] -
         step2['timeHr_downtime'])
    lineTimeAvail_step1 <- plant['workingDays_annual'] *
        (availPlantTime - step1['timeHr_maintenance'] -
         step1['timeHr_downtime'])

    # Create outputs dataframe:
    outputs <- data.frame(
        epv = c(epv_step1, epv_step2, epv_step3),
        lineTimeAvail = c(
            lineTimeAvail_step1, lineTimeAvail_step2, lineTimeAvail_step3)
    )
    row.names(outputs) <- c('step1', 'step2', 'step3')

    # Return outputs
    return(outputs)
}
