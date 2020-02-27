  view: campaign_history_performance {
    sql_table_name: dbo.CampaignResponseModel ;;

    dimension: age {
      type: number
      sql: ${TABLE}.Age ;;
    }

    dimension: age_bucket {
      type: string
      sql: ${TABLE}.Age_Bucket ;;
    }

    dimension: balance {
      type: number
      sql: ${TABLE}.Balance ;;
    }

    dimension: balance_bucket {
      type: string
      sql: ${TABLE}.Balance_bucket ;;
    }

    dimension: campaign {
      type: number
      sql: ${TABLE}.Campaign ;;
    }

    dimension: contact {
      type: string
      sql: ${TABLE}.Contact ;;
    }

    dimension: contact_quarter {
      type: string
      sql: ${TABLE}.Contact_Quarter ;;
    }

    dimension: contactcorr {
      type: string
      sql: ${TABLE}.contactcorr ;;
    }

    dimension: customer_segment {
      type: string
      sql: ${TABLE}.Customer_Segment ;;
    }

    dimension: day {
      type: number
      sql: ${TABLE}.Day ;;
    }

    dimension: default {
      type: string
      sql: ${TABLE}."Default" ;;
    }

    dimension: defauult_core {
      type: string
      sql: ${TABLE}.defauultCore ;;
    }

    dimension: duration {
      type: number
      sql: ${TABLE}.Duration ;;
    }

    dimension: duration_bucket {
      type: string
      sql: ${TABLE}.duration_bucket ;;
    }

    dimension: education {
      type: string
      sql: ${TABLE}.Education ;;
    }

    dimension: education_corected {
      type: string
      sql: ${TABLE}.Education_corected ;;
    }

    dimension: home_loan {
      type: string
      sql: ${TABLE}.Home_Loan ;;
    }

    dimension: housing {
      type: string
      sql: ${TABLE}.Housing ;;
    }

    dimension: image {
      type: string
      sql: ${TABLE}.image ;;
    }

    dimension: job {
      type: string
      sql: ${TABLE}.Job ;;
    }

    dimension: job_corected {
      type: string
      sql: ${TABLE}.Job_corected ;;
    }

    dimension: loan {
      type: string
      sql: ${TABLE}.Loan ;;
    }

    dimension: loancor {
      type: string
      sql: ${TABLE}.Loancor ;;
    }

    dimension: marital {
      type: string
      sql: ${TABLE}.Marital ;;
    }

    dimension: maritalcorre {
      type: string
      sql: ${TABLE}.maritalcorre ;;
    }

    dimension: month {
      type: string
      sql: ${TABLE}.Month ;;
    }

    dimension: monthcorr {
      type: string
      sql: ${TABLE}.monthcorr ;;
    }

    dimension: number_of_records {
      type: number
      sql: ${TABLE}.Number_of_Records ;;
    }

    dimension: pdays {
      type: number
      sql: ${TABLE}.Pdays ;;
    }

    dimension: poutcome {
      type: string
      sql: ${TABLE}.Poutcome ;;
    }

    dimension: predicted_probability {
      type: number
      sql: ${TABLE}.Predicted_Probability ;;
    }

    dimension: previous {
      type: number
      sql: ${TABLE}.Previous ;;
    }

    dimension: previous_bucket {
      type: string
      sql: ${TABLE}.previous_bucket ;;
    }

    dimension: target {
      type: number
      sql: ${TABLE}.Target ;;
    }

    dimension: targetcorr {
      type: string
      sql: ${TABLE}.targetcorr ;;
    }

    dimension: term_deposit {
      type: string
      sql: ${TABLE}.Term_Deposit ;;
    }

    dimension: term_deposit_cor {
      type: string
      sql: ${TABLE}.Term_Deposit_Cor ;;
    }



    measure:   contact_frequency{
      type: count
      drill_fields:[contactcorr]
    }

    measure:   contract_duration_frequency{
      type: count
      drill_fields:[duration_bucket]

    }

    measure:   contact_quarter_frequency{
      type: count
      drill_fields: [contact_quarter]
    }
    measure:   contact_month_frequency{
      type: count
      drill_fields: [monthcorr]

    }

    measure:  previous_bucket_frequency{
      type: count
      drill_fields: [previous_bucket]
    }

    measure:  campaign_response_frequency{
      type: count
      drill_fields: [targetcorr]
    }





  }
