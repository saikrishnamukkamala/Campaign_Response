view: customer_demographics {
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

  dimension: has_balance {
    type: yesno
    sql: ${balance} < 0 ;;
  }

  measure: count_has_balance {
    type: count
    # sql: ${id} ;;
    filters: {
      field: has_balance
      value: "yes"
    }
  }

  measure: total_balance {
    type: sum
    sql: ${balance} ;;
    value_format_name: usd
  }

  measure: avg_balance {
    type: average
    sql: ${balance} ;;
    value_format_name: usd_0
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
    action: {
      label: "Contact Customer Via Email"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "Special offer for refinancing for [CUSTOMER NAME]"
      }
      form_param: {
        name: "To Mailing List"
        required: yes
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "Dear Loyal Banking Customer,

        Please accept our offer to refinance at 2%"
      }
    }

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
    label: "Job Corrected"
    type: string
    sql: ${TABLE}.Job_corected ;;
  }

dimension: is_house_maid {
  type: yesno
  sql: ${job_corected} = 'House Maid' ;;
}

  dimension: loan {
    type: string
    sql: ${TABLE}.Loan ;;
  }

  dimension: loancor {
    type: string
    sql: ${TABLE}.Loancor ;;
  }

  dimension: has_loan {
    type: yesno
    sql: ${loancor} = 'Yes' ;;
  }

  measure: customer_count {
    type: count
    drill_fields: [age, marital, contact,campaign,balance, target]
  }

  measure: count_has_loan {
    type: count
    filters: {
      field: has_loan
      value: "Yes"
    }
    drill_fields: [age, marital, contact,campaign,balance, target]

  }

  measure: percent_has_loan {
    type: number
    sql: 1.0 * ${count_has_loan}/${customer_count} ;;
    value_format_name: percent_2
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


  measure:   count_campaigns{
    type: count_distinct
    sql: ${campaign} ;;
  }

  # measure:   campaign_frequency{
  #   type: count
  #   drill_fields:[campaign]
  # }

  measure:   marital_frequency{
    type: count_distinct
    sql: ${maritalcorre} ;;
    drill_fields:[marital]

  }

  # measure:   age_bucket_frequency{
  #   type: count
  #   drill_fields: [age_bucket]
  # }
  # measure:   occupation_frequency{
  #   type: count
  #   drill_fields: [job_corected]

  # }

  # measure:   education_frequency{
  #   type: count
  #   drill_fields: [education_frequency]

  # }

  # measure:   balance_frequency{
  #   type: count
  #   drill_fields: [balance_frequency]
  # }

  # measure:   loan_count{
  #   type: count
  #   drill_fields: [loancor]
  # }


  #dimension: home_loan_sum {
   # sql: (SELECT count(*) FROM  ${customer_demographics.SQL_TABLE_NAME} o WHERE
  #  o.loancor='Yes') ;;
    # correlated subselect to derive the value for "first_order_id"
  #}

  #measure: positive_loan_count {
  #  sql: (SELECT sum(${loan_count}) FROM dbo.CampaignResponseModel) ;;
  #  type: number
  #}



  }
