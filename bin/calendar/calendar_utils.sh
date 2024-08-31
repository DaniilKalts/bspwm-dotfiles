#!/bin/bash

# Define colors for highlighting (Dracula Purple for day, Bright Blue for month/year, and Bright Green for numbers)
highlight_color='\033[1;35m'  # Bright purple for Dracula theme (day of the week)
month_year_color='\033[1;34m' # Bright blue for Dracula theme (month/year)
number_color='\033[1;32m'     # Bright green for Dracula theme (numbers)
reset_color='\033[0m'         # Reset color

# Function to get the day of the week from a date and format the output
get_day_of_week() {
  local date_input="$1"
  local day_of_week
  day_of_week=$(date -d "$date_input" +%A)

  # Output the result with the date and day name in distinct colors
  echo -e "${month_year_color}Day of the week on ${date_input}: ${highlight_color}${day_of_week}${reset_color}"
}

# Function to find all dates for multiple days of the week in the current month
# Excludes dates that have already passed
get_dates_for_days_of_week() {
  local current_month
  local current_year
  local today
  current_month=$(date +%m)
  current_year=$(date +%Y)
  today=$(date +%Y-%m-%d)

  for day in "$@"; do
    local day_normalized
    local day_of_week
    local first_date
    local first_day
    day_normalized=$(echo "$day" | awk '{print toupper(substr($1,1,1)) tolower(substr($1,2))}')
    day_of_week=$(date -d "$day_normalized" +%u)
    first_date="${current_year}-${current_month}-01"
    first_day=$(date -d "$first_date +$(((day_of_week - $(date -d "$first_date" +%u) + 7) % 7)) days" +%d)

    echo -e "${highlight_color}${day_normalized}:${reset_color}"

    for ((i = $first_day; i <= 31; i += 7)); do
      if date -d "$current_year-$current_month-$i" >/dev/null 2>&1; then
        local date_to_check
        date_to_check="$current_year-$current_month-$(printf "%02d" $i)"
        if [[ "$date_to_check" > "$today" || "$date_to_check" == "$today" ]]; then
          echo "  $date_to_check"
        fi
      fi
    done
  done
}

# Function to calculate the number of days between two dates (inclusive)
days_between_dates() {
  local start_date="$1"
  local end_date="$2"
  local start_seconds
  local end_seconds
  local days_passed
  start_seconds=$(date -d "$start_date" +%s)
  end_seconds=$(date -d "$end_date" +%s)
  days_passed=$(((end_seconds - start_seconds) / 86400 + 1))

  echo -e "${month_year_color}Days passed between ${start_date} and ${end_date} (including both dates): ${number_color}${days_passed}${reset_color}"
}

# Main logic to execute functions based on arguments
main() {
  case "$1" in
  get_day_of_week)
    get_day_of_week "$2"
    ;;
  get_dates_for_days_of_week)
    shift
    get_dates_for_days_of_week "$@"
    ;;
  days_between_dates)
    days_between_dates "$2" "$3"
    ;;
  *)
    echo "Invalid function or missing arguments"
    echo "Usage:"
    echo "  $0 get_day_of_week YYYY-MM-DD"
    echo "  $0 get_dates_for_days_of_week day1 day2 ..."
    echo "  $0 days_between_dates start_date end_date"
    ;;
  esac
}

# Call the main function with all the passed arguments
main "$@"
