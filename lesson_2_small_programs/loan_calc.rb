# Write a program that calculates the interest rate and monthly
# payments of a car loan/mortgage

# Input
# - loan amount
# - APR
# - loan duration

# Output
# - loan duration in months
# - monthly interest rate
# - monthly payments

# Data Structures
# - yaml file for messages
# - methods

# Algorithm
# - create yaml file with messages stored
#   - messages include:
#     - welcome message
#     - prompt loan amount
#     - prompt APR
#     - prompt loan duration
#     - bad input
#     - output message
#     - new calculation
#     - end message
# - create prompt method to format messages
# - gets total loan amount
# - while total loan amount is not number, reprompt
#   - check_num method
# - gets APR as percentage, divide by 100 - check_num, reprompt
# - gets loan duration in years multiply by 12, check_num, reprompt
# - calculate monthly payment:
# - mon_pay = tot_loan * (mon_int / (1 - (1 + mon_int)**(-loan_dur)))
# - output message for
#   - monthly payment, monthly interest, loan duration
# - ask for new calculation (y/n)

require 'yaml'

MESSAGES = YAML.load_file('loan_calc_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def check_num
  num = ''
  loop do
    num = gets.chomp
    if (num.to_i.to_s == num) || (num.to_f.to_s == num) || (num.to_i < 0)
      break
    else
      prompt MESSAGES['p_bad_input']
    end
  end
  num
end

prompt MESSAGES['welcome']

calc_again = 'y'

while calc_again.downcase.start_with?('y')
  prompt MESSAGES['p_loan']
  loan_amount = check_num.to_f

  prompt MESSAGES['p_apr']
  loan_apr = check_num.to_f
  mon_int = loan_apr / 1200

  prompt MESSAGES['p_loan_dur']
  loan_dur = check_num.to_i
  mon_dur = loan_dur * 12

  mon_pay = loan_amount * (mon_int / (1 - (1 + mon_int)**-mon_dur))
  prompt "#{MESSAGES['out_payment']}#{mon_pay.round(2)}"
  prompt "#{MESSAGES['out_duration']}#{mon_dur} months"
  prompt MESSAGES['p_new_calc']
  calc_again = gets.chomp
end

prompt MESSAGES['out_end']
